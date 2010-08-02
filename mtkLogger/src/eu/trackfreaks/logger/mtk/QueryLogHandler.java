package eu.trackfreaks.logger.mtk;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;

import eu.trackfreaks.util.IntegerUtils;

public class QueryLogHandler implements LineHandler {

    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    private SimpleDateFormat timeFormat = new SimpleDateFormat("HH-mm-ss");

    private String deviceId = "unknown";
    private String path = "/Tracklogs";
    private Date date = new Date();

    private File file;

    private FileOutputStream fos;

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getPath() {
        return path;
    }

    public void open() {
        try {
            String dateString = dateFormat.format(date);
            String timeString = timeFormat.format(date);
            String dirname = path + "/" + dateString;
            File dir = new File(dirname);
            FileUtils.forceMkdir(dir);
            String filename = deviceId + "_" + timeString + ".bin";
            file = new File(dir, filename);
            fos = new FileOutputStream(file);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void handleLine(String line) {
        line = StringUtils.substringAfterLast(line, ",");
        line = StringUtils.substringBeforeLast(line, "*");
        byte[] buffer = new byte[line.length() / 2];
        for (int i = 0; i < line.length(); i += 2) {
            String hex = StringUtils.substring(line, i, i + 2);
            buffer[i / 2] = (byte) IntegerUtils.fromHexString(hex);
        }
        try {
            fos.write(buffer);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void close() {
        try {
            fos.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String getResult() {
        return file.getAbsolutePath();
    }

}
