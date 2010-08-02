package eu.trackfreaks.util;

import org.apache.commons.lang.StringUtils;

public class IntegerUtils {

    private static final String HEX = "0123456789ABCDEF";

    public static String toHexString(int value, int digits) {
        char[] result = new char[digits];
        for (int i = digits - 1; i >= 0; i--) {
            result[i] = HEX.charAt(value & 15);
            value >>= 4;
        }
        return new String(result);
    }

    public static int fromHexString(String hex) {
        int result = 0;
        while (!hex.isEmpty()) {
            result <<= 4;
            result |= HEX.indexOf(hex.charAt(0));
            hex = StringUtils.substring(hex, 1);
        }
        return result;
    }

}
