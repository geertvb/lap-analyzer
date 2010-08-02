package eu.trackfreaks.logger.mtk;

import org.apache.commons.lang.StringUtils;

public class DefaultLineHandler implements LineHandler {

    private StringBuffer sb = new StringBuffer();

    @Override
    public void handleLine(String line) {
        line = StringUtils.removeStart(line, "$");
        line = StringUtils.substringBeforeLast(line, "*");
        if (sb.length() > 0) {
            sb.append("\r\n");
        }
        sb.append(line);
    }

    @Override
    public String getResult() {
        return sb.toString();
    }

}
