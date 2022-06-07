package ca.quinsam.webcamserver.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	private static final SimpleDateFormat TIMESTAMP_FORMAT = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
	
	private DateUtil() {}
	
	public static String getTimeStamp() {
		Date date = new Date(System.currentTimeMillis());
		return TIMESTAMP_FORMAT.format(date);
	}
}
