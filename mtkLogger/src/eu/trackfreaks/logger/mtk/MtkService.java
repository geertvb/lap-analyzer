package eu.trackfreaks.logger.mtk;

import static eu.trackfreaks.logger.mtk.MtkPacket.*;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.logging.Logger;

import org.apache.commons.lang.StringUtils;

import eu.trackfreaks.util.IntegerUtils;
import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;

public class MtkService {

    private static Logger logger = Logger.getLogger(MtkService.class.getName());

    private String portName = "COM4";

    private CommPort commPort;
    private BufferedReader reader;
    private BufferedWriter writer;

    private String deviceId;

    public void openConnection() {
        try {
            logger.info("Opening com port " + portName);

            CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(portName);
            commPort = portIdentifier.open(this.getClass().getName(), 2000);
            if (commPort instanceof SerialPort) {
                SerialPort serialPort = (SerialPort) commPort;
                serialPort.setSerialPortParams(115200, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
                serialPort.enableReceiveTimeout(5000);

                InputStream in = serialPort.getInputStream();
                InputStreamReader isr = new InputStreamReader(in);
                reader = new BufferedReader(isr);

                OutputStream out = serialPort.getOutputStream();
                OutputStreamWriter osw = new OutputStreamWriter(out);
                writer = new BufferedWriter(osw);

            } else {
                throw new RuntimeException("Not a serial port");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void closeConnection() {
        try {
            logger.info("Closing com port " + commPort.getName());

            writer.close();
            reader.close();
            commPort.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private boolean isValid(String line) {
        if (!StringUtils.startsWith(line, "$")) {
            return false;
        }
        line = StringUtils.removeStart(line, "$");

        String checksum = StringUtils.right(line, 2);
        line = StringUtils.removeEnd(line, checksum);

        if (!StringUtils.endsWith(line, "*")) {
            return false;
        }
        line = StringUtils.removeEnd(line, "*");
        
        if (!StringUtils.startsWith(line, "PMTK")) {
            return false;
        }

        return checksum(line).equals(checksum);
    }

    private String readLine() {
        try {
            String line = reader.readLine();
            while (!isValid(line)) {
                line = reader.readLine();
            }
            System.out.println(" < " + line);
            return line;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private boolean isAck(String line) {
        return StringUtils.startsWith(line, "$PMTK001");
    }

    private void write(String line) {
        try {
            System.out.print(" > " + line);
            writer.write(line);
            writer.flush();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public String waitForAck(String prefix) {
        return waitForAck(prefix, new DefaultLineHandler());
    }

    public String waitForAck(String prefix, LineHandler lh) {
        String line = readLine();
        while (!isAck(line)) {
            if (line.startsWith(prefix)) {
                lh.handleLine(line);
            }
            line = readLine();
        }
        return lh.getResult();
    }

    public String waitFor(String prefix) {
        return waitFor(prefix, new DefaultLineHandler());
    }

    public String waitFor(String prefix, LineHandler lh) {
        String line;

        line = readLine();
        while (!line.startsWith(prefix)) {
            line = readLine();
        }
        lh.handleLine(line);

        return lh.getResult();
    }

    public void waitForAck() {
        String line;

        line = readLine();
        while (!isAck(line)) {
            line = readLine();
        }
    }

    public int getFrequency() {
        logger.info("getFrequency");

        write(createPacket(PMTK_API_Q_FIX_CTL));
        String response = waitFor("$PMTK500");
        response = StringUtils.substringAfter(response, ",");
        response = StringUtils.substringBefore(response, ",");
        int result = 1000 / Integer.parseInt(response);

        logger.info("" + result);
        return result;
    }

    public void setFrequency(int value) {
        logger.info("setFrequency");

        write(createPacket(PMTK_API_SET_FIX_CTL, 1000 / value, "0", "0", "0.0", "0.0"));
        waitForAck();
    }

    public String getBluetoothMacAddress() {
        logger.info("getBluetoothMacAddress");

        write(createPacket(PMTK_API_Q_BT_MAC_ADDR, new Object[0]));
        String response = waitFor("$PMTK592");
        response = StringUtils.substringAfterLast(response, ",");
        
        logger.info("" + response);
        return response;
    }

    public boolean isLogging() {
        logger.info("isLogging");

        write(createPacket(PMTK_LOG_QUERY, 7));
        String response = waitForAck("$PMTK182,3,7");
        response = StringUtils.substringAfterLast(response, ",");
        int value = Integer.parseInt(response);
        boolean result = (value & 2) != 0;

        logger.info("" + result);
        return result;
    }

    public double getTimeInterval() {
        logger.info("getTimeInterval");

        write(createPacket(PMTK_LOG_QUERY, 3));
        String response = waitForAck("$PMTK182,3,3");
        response = StringUtils.substringAfterLast(response, ",");
        int value = Integer.parseInt(response);
        double result = value / 10.0;

        logger.info("" + result);
        return result;
    }

    public void setTimeInterval(double value) {
        logger.info("setTimeInterval");

        write(createPacket(PMTK_LOG_SET, 3, Math.round(value * 10)));
        waitForAck();
    }

    public double getDistanceInterval() {
        logger.info("getDistanceInterval");

        write(createPacket(PMTK_LOG_QUERY, 4));
        String response = waitForAck("$PMTK182,3,4");
        response = StringUtils.substringAfterLast(response, ",");
        int value = Integer.parseInt(response);
        double result = value / 10.0;

        logger.info("" + result);
        return result;
    }

    public void setDistanceInterval(double value) {
        logger.info("setDistanceInterval");

        write(createPacket(PMTK_LOG_SET, 4, Math.round(value * 10)));
        waitForAck();
    }

    public double getSpeedInterval() {
        logger.info("getSpeedInterval");

        write(createPacket(PMTK_LOG_QUERY, 5));
        String response = waitForAck("$PMTK182,3,5");
        response = StringUtils.substringAfterLast(response, ",");
        int value = Integer.parseInt(response);
        double result = value / 10.0;

        logger.info("" + result);
        return result;
    }

    public void setSpeedInterval(double value) {
        logger.info("setSpeedInterval");

        write(createPacket(PMTK_LOG_SET, 5, Math.round(value * 10)));
        waitForAck();
    }

    public void stopLogging() {
        logger.info("stopLogging");

        write(createPacket(PMTK_LOG_OFF));
        waitForAck();
    }

    public void startLogging() {
        logger.info("startLogging");

        write(createPacket(PMTK_LOG_ON));
        waitForAck();
    }

    public int getMemoryUsed() {
        logger.info("getMemoryUsed");

        write(createPacket(PMTK_LOG_QUERY, 8));
        String response = waitForAck("$PMTK182,3,8");
        response = StringUtils.substringAfterLast(response, ",");
        int result = IntegerUtils.fromHexString(response);

        logger.info("" + result);
        return result;
    }

    public void getLogData(int memoryUsed) {
        logger.info("getLogData");

        QueryLogHandler qlh = new QueryLogHandler();
        qlh.setDeviceId(deviceId);
        qlh.open();

        int start = 0;
        int block = 0x10000;
        while (memoryUsed > 0) {
            int size = Math.min(memoryUsed, block);
            write(createPacket(PMTK_LOG_REQ_DATA, IntegerUtils.toHexString(start, 8), IntegerUtils.toHexString(size, 8)));
            waitForAck("$PMTK182,8", qlh);

            memoryUsed -= size;
            start += size;

        }

        qlh.close();
    }

    public void downloadData() {

        openConnection();

        if (getFrequency() != 1) {
            setFrequency(1);
        }

        deviceId = getBluetoothMacAddress();

        if (isLogging()) {
            stopLogging();
        }

        int memoryUsed = getMemoryUsed();

        if (memoryUsed > 0) {
            // getLogData(memoryUsed);
            /*
             * eraseLogData();
             */
        }

        if (getTimeInterval() != 0.0) {
            setTimeInterval(0.0);
        }
        
        if (getDistanceInterval() != 0.0) {
            setDistanceInterval(0.0);
        }
        
        if (getSpeedInterval() != 10.0) {
            setSpeedInterval(10.0);
        }
        
        /*
         * if (!correctLogSettings()) { setLogSettings(); }
         */

        startLogging();

        setFrequency(5);

        closeConnection();

    }

    public static void main(String[] args) {
        MtkService mtkService = new MtkService();
        mtkService.downloadData();
    }

}
