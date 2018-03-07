package com.itqinxue.util;

import java.util.UUID;

public class managerUUID {

	public static String getUUID() {
		UUID uuid=UUID.randomUUID();
		String a=uuid.toString();
		a=a.replace("-", "");
		return a;
	}
}
