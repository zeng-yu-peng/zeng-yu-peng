package com.dtsys;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ParseExamineData {

	public static void main(String[] args) {
		String pcon = "G"; // 預設P_CON為綠燈
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/people?serverTimezone=UTC&useSSL=false", "root", "775320Yui");

			// 從test_p找出每個人最新的一筆紀錄
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select A.I_ID, A.P_ID, A.I_TIME, A.END_TIME, A.I_SYMPTOM from test_p as A , "
					+ "(select P_ID, max(I_TIME) as I_TIME from test_p group by P_ID)  as B "
					+ "where A.P_ID = B.P_ID and A.I_TIME=B.I_TIME;");
			
			while (rs.next()) {
				String iid = rs.getString(1);
				String pid = rs.getString(2);
				String itime = rs.getString(3);
				String etime = rs.getString(4);
				int isymptom = rs.getInt(5);

				System.out.println("I_ID=" + iid + "  P_ID=" + pid + "  I_TIME=" + itime + "  END_TIME=" + etime
						+ "  I_SYMPTOM=" + isymptom);

				// PCON: 狀態判斷
				if (isymptom == 1) { 
					pcon = "R"; // Red: 確診
				} else if (itime != null && etime == null) { // 治療中
					pcon = "O"; // Orange: 隔離中
				} else {
					pcon = "G"; // Green: OK
				}

				// 更新people的PCON
				String sqlUpdPeople = "update ALLPeople set P_CON=? where P_ID=?";
				PreparedStatement preparedStmt = con.prepareStatement(sqlUpdPeople);

				preparedStmt.setString(1, pcon);
				preparedStmt.setString(2, pid);

				if (preparedStmt.executeUpdate() == 1) {
					System.out.println("更新PCON成功: P_ID=" + pid + "  P_CON=" + pcon);
				} else {
					System.out.println("更新PCON失敗: P_ID=" + pid + "  P_CON=" + pcon);
				}
				
				preparedStmt.close();
			}
			
			rs.close();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {}
			}
		}

	}

}
