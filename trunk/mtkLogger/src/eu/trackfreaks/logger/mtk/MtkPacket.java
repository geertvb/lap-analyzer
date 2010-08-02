package eu.trackfreaks.logger.mtk;

import eu.trackfreaks.util.IntegerUtils;

public class MtkPacket {

    public static final String PMTK_TEST = "000";

    public static final String PMTK_LOG = "182";
    public static final String PMTK_LOG_ON = PMTK_LOG + "," + "4";
    public static final String PMTK_LOG_OFF = PMTK_LOG + "," + "5";
    public static final String PMTK_LOG_QUERY = PMTK_LOG + "," + "2";
    public static final String PMTK_LOG_SET = PMTK_LOG + "," + "1";
    public static final String PMTK_LOG_REQ_DATA = PMTK_LOG + "," + "7";

    public static final String PMTK_API_SET_FIX_CTL = "300";
    public static final String PMTK_API_Q_FIX_CTL = "400";

    public static final String PMTK_API_Q_BT_MAC_ADDR = "492";

    public static final String Preamble = "$";
    public static final String TalkerID = "PMTK";

    public static String checksum(String data) {
        byte xor = 0;
        for (byte b : data.getBytes()) {
            xor ^= b;
        }
        return IntegerUtils.toHexString(xor, 2);
    }

    public static String createPacket(String PktType, Object... dataFields) {
        StringBuffer sb = new StringBuffer();
        sb.append(TalkerID);
        sb.append(PktType);
        for (Object dataField : dataFields) {
            sb.append(",");
            sb.append(dataField);
        }
        String data = sb.toString();
        String result = Preamble + data + "*" + checksum(data) + "\r\n";
        return result;
    }

}
