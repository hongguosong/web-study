package com.itqinxue.util;

import java.util.Date;
public class MyDate extends Date{
	
	public MyDate(long l) {
		this.setTime(l);
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 5431729755764835175L;
	public String format(int num){
		if(num <10){
			return "0"+num;
		}else{
			return ""+num;
		}
	}
	@Override
	public String toLocaleString() {
		
		int year=this.getYear();
		int month=this.getMonth()+1;
		int day=this.getDay();
		int hour=this.getHours();
		int minutes=this.getMinutes();
		int seconds=this.getSeconds();
		String t=year+"-"+format(month)+"-"+format(day)+" "+format(hour)+":"+format(minutes)+":"+format(seconds);
		
		return t;
	}
}
