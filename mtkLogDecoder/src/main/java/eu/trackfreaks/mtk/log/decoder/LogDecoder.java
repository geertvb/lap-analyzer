package eu.trackfreaks.mtk.log.decoder;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.EndianUtils;

public class LogDecoder {

	private String filename = "/Developer/Eclipse-3.5/workspace/mtkLogDecoder/53F400881C00_13-57-53.bin";

	private byte[] buffer = new byte[0x10000];
	private byte[] marker = new byte[] {
			(byte) 0x2A,
			(byte) 0xFF, 
			(byte) 0xBB,
			(byte) 0xBB,
			(byte) 0xBB,
			(byte) 0xBB
			};
	
	private int logCount;
	private int logFormat;
	private int logMode;
	private double logPeriod;
	private double logDistance;
	private double logSpeed;
	
	private int pos;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public int getWord() {
		int result = EndianUtils.readSwappedUnsignedShort(buffer, pos);
		pos += 2;
		return result;
	}
	
	public int getByte() {
		return buffer[pos++] & 0xFF;
	}
	
	public int getLong() {
		int result = EndianUtils.readSwappedInteger(buffer,pos);
		pos += 4;
		return result;
	}
	
	public double getDouble() {
		double result = EndianUtils.readSwappedDouble(buffer,pos);
		pos += 8;
		return result;
	}
	
	public double getFloat() {
		double result = EndianUtils.readSwappedFloat(buffer,pos);
		pos += 4;
		return result;
	}
	
	public void decode_header_info() {
		pos = 0;
		logCount = getWord();
		logFormat = getLong();
		logMode = getWord();
		logPeriod = getWord() / 10.0;
		pos += 2;
		logDistance = getWord() / 10.0;
		pos += 2;
		logSpeed = getWord() / 10.0;
		pos += 2;
	}
	
	public void decode_sector_status() {
		//TODO
	}
	
	public void decode_header_filler() {
		int pos = 20 + 32;
		for (int i=0; i < 448; i++) {
			if ((buffer[pos++] & 0xFF) != 0xFF) {
				throw new RuntimeException("Bad filler at " + pos);
			}
		}
	}
	
	public void decode_header_marker() {
		/*
		int pos = 512 - marker.length;
		for (int i=0; i < marker.length; i++) {
			if ((buffer[pos++] & 0xFF) != (marker[i] & 0xFF)) {
				throw new RuntimeException("Bad marker at " + pos);
			}
		}
		*/
	}
	
	public void decode_log_header() {
		decode_header_info();
		decode_sector_status();
		decode_header_filler();
		decode_header_marker();
	}
	
	public boolean enabled(int id) {
		return (logFormat & (1 << id)) != 0;
	}
	
	public void readTime(int id) {
		if (enabled(id)) {
			long zxcv = 1000L * getLong();
			Date date = new Date(zxcv);
			System.out.print(sdf.format(date) + ",");
		}
	}
	
	public void readByte(int id) {
		if (enabled(id)) {
			System.out.print(getByte() + ",");
		}
	}
	
	public void readWord(int id) {
		if (enabled(id)) {
			System.out.print(getWord() + ",");
		}
	}
	
	public void readDouble(int id) {
		if (enabled(id)) {
			System.out.print(getDouble() + ",");
		}
	}
	
	public void readFloat(int id) {
		if (enabled(id)) {
			System.out.print(getFloat() + ",");
		}
	}
	
	private static final int BI_UTC = 0;
	private static final int BI_VALID = 1;
	private static final int BI_LATITUDE = 2;
	private static final int BI_LONGITUDE = 3;
	private static final int BI_HEIGHT = 4;
	private static final int BI_SPEED = 5;
	private static final int BI_HEADING = 6;
	private static final int BI_DSTA = 7;
	private static final int BI_DAGE = 8;
	private static final int BI_PDOP = 9;
	private static final int BI_HDOP = 10;
	private static final int BI_VDOP = 11;
	private static final int BI_NSAT = 12;
	private static final int BI_SID = 13;
	private static final int BI_ELEVATION = 14;
	private static final int BI_AZIMUTH = 15;
	private static final int BI_SNR = 16;
	private static final int BI_RCR = 17;
	private static final int BI_MILLISECOND = 18;
	private static final int BI_DISTANCE = 19;

	public void decode_log_data() {
		readTime(BI_UTC);
		readWord(BI_VALID);
		readDouble(BI_LATITUDE);
		readDouble(BI_LONGITUDE);
		readFloat(BI_HEIGHT);
		readFloat(BI_SPEED);
		readFloat(BI_HEADING);
		readWord(BI_DSTA);
		readFloat(BI_DAGE);
		readWord(BI_PDOP);
		readWord(BI_HDOP);
		readWord(BI_VDOP);
		readByte(BI_NSAT); //Used
		readByte(BI_NSAT); //View
		//TODO SID, ELEVATION,AZIMUTH,SNR
		readWord(BI_RCR);
		readWord(BI_MILLISECOND);
		readDouble(BI_DISTANCE);
		
		/*
		   { 0, 4, "UTC" },
		   { 1, 2, "VALID" },
		   { 2, 8, "LATITUDE,N/S"},
		   { 3, 8, "LONGITUDE,E/W"},
		   { 4, 4, "HEIGHT" },
		   { 5, 4, "SPEED" },
		   { 6, 4, "HEADING" },
		   { 7, 2, "DSTA" },
		   { 8, 4, "DAGE" },
		   { 9, 2, "PDOP" },
		   { 10, 2, "HDOP"},
		   { 11, 2, "VDOP"},
		   { 12, 2, "NSAT (USED/VIEW)"},
		   { 13, 4, "SID",},
		   { 14, 2, "ELEVATION" },
		   { 15, 2, "AZIMUTH" },
		   { 16, 2, "SNR"},
		   { 17, 2, "RCR"},
		   { 18, 2, "MILLISECOND"},
		   { 19, 8, "DISTANCE" }
		   */
	}
	
	public void decode_log_packet() {
		int p0 = pos;
		System.out.println();

		decode_log_data();

		int p1 = pos;
		if (getByte() == '*') {
			int crc = 0;
			while (p0 < p1) {
				crc ^= (buffer[p0++] & 0xFF);
			}
			if (getByte() != crc) {
				throw new RuntimeException("Bad checksum");
			}
		} else {
			throw new RuntimeException("Missing end marker");
		}
	}
	
	public void decode_chunk_fill() {
		//TODO
	}
	
	public void decode_sep_record() {
		//TODO
		pos = pos + 16;
	}
	
	public boolean isSeparationRecord() {
		for (int i=0; i<7; i++) {
			if ((buffer[pos+i] & 0xFF) != 0xAA) {
				return false;
			}
		}
		for (int i=12; i<16; i++) {
			if ((buffer[pos+i] & 0xFF) != 0xBB) {
				return false;
			}
		}
		return true;
	}
	
	public void decode_log_chunk() {
		while (pos < 16384) {
			if (isSeparationRecord()) {
				decode_sep_record();
			} else {
				decode_log_packet();
			}
		}
		decode_chunk_fill();
	}

	public void decode_log_block() {
		decode_log_header();
		pos = 512;
		decode_log_chunk();
	}

	public void decode() throws Exception {
		File file = new File(filename);
		FileInputStream fis = new FileInputStream(file);
		try {
			int len = fis.read(buffer);
			while (len > 0) {
				for (int i = len; i < buffer.length; i++) {
					buffer[i] = (byte) 0xFF;
				}
				decode_log_block();
				len = fis.read(buffer);
			}
		} finally {
			fis.close();
		}
	}

	public static void main(String[] args) throws Exception {
		LogDecoder ld = new LogDecoder();
		ld.decode();
	}

}
