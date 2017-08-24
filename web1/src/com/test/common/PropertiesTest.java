package com.test.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesTest {

	
	public static void main(String[] args){
		Properties pro = new Properties();
		
		try {
			pro.load(PropertiesTest.class.getClassLoader().getResourceAsStream("db.properties"));
			System.out.println(pro.getProperty("db.driver"));
			System.out.println(pro.getProperty("db.url"));
			System.out.println(pro.getProperty("db.id"));
			System.out.println(pro.getProperty("db.pwd"));
			System.out.println(pro.getProperty("iot.class"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
