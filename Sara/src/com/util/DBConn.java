package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {

	private static Connection conn = null;
	
	public static Connection getConnection() {
		
		try {
			String url = "jdbc:oracle:thin:@192.168.0.10:1521:Xe";
			String user = "sara"; 
			String pwd = "a123";
			
			if(conn == null) {
			
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, pwd);
				
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return conn;
		
	}
	
	public static void close() { // DB 닫는 메서드

		if(conn == null) {
			return;	//  conn 이 null 이면 반응 x
		}
		
		try {
			if(!conn.isClosed()) {
				conn.close();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		conn = null;	// 이걸 안하면 어댑터 오류 뜸
		
	}
	
	
	
	
	
	
	
	
	
}
