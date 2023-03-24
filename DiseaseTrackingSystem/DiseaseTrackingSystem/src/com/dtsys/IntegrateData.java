package com.dtsys;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class IntegrateData {

	public static void main(String[] args) {
		int seqno = 1000;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/people?serverTimezone=UTC&useSSL=false", "root", "775320Yui");

			System.out.println("匯入本國國人資料...");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select P_SID, P_NAME, P_SEX, P_BDAY, P_HPHONE, P_HADDRESS,P_NATION from speople");
			while (rs.next()) {
				String P_SID = rs.getString(1);
				String P_NAME = rs.getString(2);
				String P_SEX = rs.getString(3);
				String P_BDAY = rs.getString(4);
				String P_HPHONE = rs.getString(5);
				String P_HADDRESS = rs.getString(6);
				String P_NATION = rs.getString(7);
				System.out.println("身分證字號=" + P_SID + "  姓名=" + P_NAME + "  性別=" + P_SEX + "  生日=" + P_BDAY + "  住家電話="
						+ P_HPHONE + "  居住地址=" + P_HADDRESS +" 國籍="+P_NATION);

				// (2)健保資料【身分證->】
				boolean hinfo = false;
				String P_HID = null;
				String P_FID = null;
				String P_CON = null;

				Statement stmt2 = con.createStatement();
				ResultSet rs2 = stmt2.executeQuery("select P_HID, P_FID, P_CON from hid where P_SID='" + P_SID + "'");

				hinfo = rs2.next();
				if (hinfo == true) {
					P_HID = rs2.getString(1);
					P_FID = rs2.getString(2);
					P_CON = rs2.getString(3);
				}

				System.out.println("健保卡號=" + P_HID + "  緊急聯絡人=" + P_FID + "  狀態=" + P_CON);
				stmt2.close();

				// (3)電信業者資料(身分證->)
				boolean tinfo = false;
				String P_PHONE = null;
				String P_ADDRESS = null;

				Statement stmt3 = con.createStatement();
				ResultSet rs3 = stmt3.executeQuery("select P_PHONE, P_ADDRESS from phone where P_SID='" + P_SID + "'");

				tinfo = rs3.next();
				if (tinfo == true) {
					P_PHONE = rs3.getString(1);
					P_ADDRESS = rs3.getString(2);

				}
				System.out.println("手機號碼=" + P_PHONE);
				stmt3.close();

				// (4)出入境資料(身分證->)
				boolean rinfo = false;
				String P_PID = null;
				String P_ONAME = null;
				String P_HOTEL = null;

				Statement stmt4 = con.createStatement();
				ResultSet rs4 = stmt4.executeQuery(
						"select P_PID, P_ONAME, P_HOTEL from ppeople where P_SID='" + P_SID + "'");

				rinfo = rs4.next();
				if (rinfo == true) {
					P_PID = rs4.getString(1);
					P_ONAME = rs4.getString(2);
					P_HOTEL = rs4.getString(3);

				}
				System.out.println("護照號=" + P_PHONE + "  原文姓名=" + P_ONAME + "  旅遊居住地=" + P_HOTEL);
				stmt4.close();

				// 塞入整合資料
				String query = " insert into ALLPeople (P_ID, P_SID, P_HID, P_PID,  P_NAME, P_ONAME, P_PHONE, P_HPHONE, P_BDAY, P_SEX, P_ADDRESS, P_HADDRESS, P_HOTEL, P_NATION, P_FID, P_CON)"
						+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

				// create the mysql insert preparedstatement
				PreparedStatement preparedStmt = con.prepareStatement(query);

				preparedStmt.setString(1, String.format("%07d", seqno++));
				preparedStmt.setString(2, P_SID);
				preparedStmt.setString(3, P_HID);
				preparedStmt.setString(4, P_PID);
				preparedStmt.setString(5, P_NAME);
				preparedStmt.setString(6, P_ONAME);
				preparedStmt.setString(7, P_PHONE);
				preparedStmt.setString(8, P_HPHONE);
				preparedStmt.setString(9, P_BDAY);
				preparedStmt.setString(10, P_SEX);
				preparedStmt.setString(11, P_ADDRESS);
				preparedStmt.setString(12, P_HADDRESS);
				preparedStmt.setString(13, P_HOTEL);
				preparedStmt.setString(14, P_NATION);
				preparedStmt.setString(15, P_FID);
				preparedStmt.setString(16, P_CON);

				// execute the preparedstatement
				preparedStmt.execute();

			} // end while

			rs.close();
			stmt.close();

			System.out.println("\n匯入外國人資料...");
			stmt = con.createStatement();
			rs = stmt.executeQuery("select P_PID, P_RID, P_NAME, P_ONAME, P_SEX, P_NATION, P_PHONE from rpeople");
			while (rs.next()) {
				String P_PID = rs.getString(1);
				String P_RID = rs.getString(2);
				String P_NAME = rs.getString(3);
				String P_ONAME = rs.getString(4);
				String P_SEX = rs.getString(5);
				String P_NATION = rs.getString(6);
				String P_PHONE = rs.getString(7);
				System.out.println("護照號=" + P_PID + "  居留證=" + P_RID + "  姓名=" + P_NAME + "  原文姓名=" + P_ONAME + "  性別="
						+ P_SEX + "  國籍=" + P_NATION + "  手機號碼=" + P_PHONE);

				// (2)健保資料【護照->】
				boolean hinfo = false;
				String P_HID = null;
				String P_FID = null;
				String P_CON = null;

				Statement stmt2 = con.createStatement();
				ResultSet rs2 = stmt2.executeQuery("select P_HID, P_FID, P_CON from hid where P_PID='" + P_PID + "'");

				hinfo = rs2.next();
				if (hinfo == true) {
					P_HID = rs2.getString(1);
					P_FID = rs2.getString(2);
					P_CON = rs2.getString(3);
				}

				System.out.println("健保卡號=" + P_HID + "  緊急聯絡人=" + P_FID + "  狀態=" + P_CON);
				stmt2.close();

				// (3)電信業者資料(護照->)
				boolean tinfo = false;
				String P_BDAY = null;
				String P_ADDRESS = null;

				Statement stmt3 = con.createStatement();
				ResultSet rs3 = stmt3.executeQuery("select P_BDAY,P_ADDRESS from phone where P_PID='" + P_PID + "'");

				tinfo = rs3.next();
				if (tinfo == true) {
					P_BDAY = rs3.getString(1);
					P_ADDRESS = rs3.getString(2);

				}
				System.out.println("出生日期=" + P_BDAY);
				stmt3.close();

				// (4)出入境資料(護照->)
				boolean rinfo = false;
				String P_HOTEL = null;

				Statement stmt4 = con.createStatement();
				ResultSet rs4 = stmt4.executeQuery("select P_HOTEL from ppeople where P_PID='" + P_PID + "'");

				rinfo = rs4.next();
				if (rinfo == true) {
					P_HOTEL = rs4.getString(1);

				}
				System.out.println("旅遊居住地=" + P_HOTEL);
				stmt4.close();

				// 塞入整合資料
				String query = " insert into ALLPeople (P_ID, P_HID, P_PID, P_RID, P_NAME, P_ONAME, P_PHONE, P_BDAY, P_SEX, P_ADDRESS, P_HOTEL, "
						+ "P_NATION, P_FID, P_CON)"
						+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

				// create the mysql insert preparedstatement
				PreparedStatement preparedStmt = con.prepareStatement(query);

				preparedStmt.setString(1, String.format("%07d", seqno++));
				preparedStmt.setString(2, P_HID);
				preparedStmt.setString(3, P_PID);
				preparedStmt.setString(4, P_RID);
				preparedStmt.setString(5, P_NAME);
				preparedStmt.setString(6, P_ONAME);
				preparedStmt.setString(7, P_PHONE);
				preparedStmt.setString(8, P_BDAY);
				preparedStmt.setString(9, P_SEX);
				preparedStmt.setString(10, P_ADDRESS);
				preparedStmt.setString(11, P_HOTEL);
				preparedStmt.setString(12, P_NATION);
				preparedStmt.setString(13, P_FID);
				preparedStmt.setString(14, P_CON);

				// execute the preparedstatement
				preparedStmt.execute();
				


			}

			con.close();
		} catch (Exception e) {
			System.out.println(e);
			System.err.println("輸入資料有誤!");
		}

	}

}
