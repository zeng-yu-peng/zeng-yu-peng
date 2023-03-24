package com.dtsys;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class IV {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/people?serverTimezone=UTC&useSSL=false", "root", "775320Yui");

			System.out.println("匯入疫苗施打資料...");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select V_ID,P_HID, V_NAME, V_DATE from vaccine");
			while (rs.next()) {
				String V_ID = rs.getString(1);
				String P_HID = rs.getString(2);
				String V_NAME = rs.getString(3);
				String V_DATE = rs.getString(4);

				System.out.println("疫苗編號=" + V_ID +"  健保卡卡號=" + P_HID +  "  緊急聯絡人=" + V_NAME + "  狀態=" + V_DATE);

				// (2)個人檔案【健保卡->】
				boolean vacfo = false;
				String P_ID = null;


				Statement stmt2 = con.createStatement();
				ResultSet rs2 = stmt2
						.executeQuery("select P_ID from ALLpeople where P_HID='" + P_HID + "'");

				vacfo = rs2.next();
				if (vacfo == true) {
					P_ID = rs2.getString(1);
				}

				System.out.println("統一編號=" + P_ID + "  健保卡號=" + P_HID );
				stmt2.close();

				// 塞入整合資料
				String query = " insert into ALLVaccine (V_ID, P_ID, V_NAME, V_DATE)"
						+ " values (?, ?, ?, ?)";

				// create the mysql insert preparedstatement
				PreparedStatement preparedStmt = con.prepareStatement(query);

				preparedStmt.setString(1, V_ID);
				preparedStmt.setString(2, P_ID);
				preparedStmt.setString(3, V_NAME);
				preparedStmt.setString(4, V_DATE);

				// execute the preparedstatement
				preparedStmt.execute();

			} // end while



			con.close();
		} catch (Exception e) {
			System.out.println(e);
			System.err.println("輸入資料有誤!");
		}

	}

}
