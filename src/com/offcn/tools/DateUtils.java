package com.offcn.tools;

import java.sql.Timestamp;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;

public class DateUtils {
	
	/**
	 * 
	 * @todo: 把user的生日的年月日 放到数组
	 * @param date
	 * @return Integer[]
	 */
	public static Integer[] getArrByDate(Date date){
		
		Integer[] arr = new Integer[3];
		
		Calendar c = Calendar.getInstance();
		
		c.setTime(date);
		
		arr[0] = c.get(Calendar.YEAR);
		arr[1] = c.get(Calendar.MONTH)+1;
		arr[2] = c.get(Calendar.DAY_OF_MONTH);
		
		return arr;
	}
	
	public static Timestamp getTimestampByDateStr(String dateStr){
		
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr, new ParsePosition(0));

		return new Timestamp(date.getTime());
	}
	
	public static java.sql.Date getDateByDateStr(String dateStr){
		
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr, new ParsePosition(0));
		
		java.sql.Date da = new java.sql.Date(date.getTime());
		
		return da;
	}
	
	public static Timestamp getTimestampByCurDate(){
		
		return new Timestamp(new Date().getTime());
	}
}
