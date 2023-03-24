package com.dtsys;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.Iterator;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.HTTP;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class RequestHandler
 */
@WebServlet("/RequestHandler")
public class RequestHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Random mRnd = new Random(System.currentTimeMillis()); // 亂數機生驗證碼

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RequestHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at doGet: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		

		StringBuffer jb = new StringBuffer();
		String line = null;
		Connection con = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/people?serverTimezone=UTC&useSSL=false", "root", "775320Yui");
		    
		    stmt = con.createStatement();
			
			// 編碼全用UTF-8
			request.setCharacterEncoding("UTF-8");

			// get request string
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null) {
				jb.append(line);
			}

			// create JSON request object
			JSONObject jsonReq = new JSONObject(jb.toString());
			System.out.println("JSON request object=" + jsonReq.toString());

			// 回應編碼全用UTF-8
			response.setCharacterEncoding("UTF-8");

			// set response content type to application/json
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();

			// create JSON response object, 回應也依據與前端約定填入其他資料
			JSONObject jsonResp = new JSONObject();

			switch (jsonReq.getInt("Type")) {
			
			case 1001: // 要求驗證碼(本)
				String hid = jsonReq.getString("HID");
				String sql01 = "select P_NAME,P_ID,P_CON from allpeople where P_SID='" + jsonReq.getString("SID") + "' AND P_HID='"
						+ hid + "' ";

				System.out.println("Info: SQL=" + sql01);
				
				ResultSet rs01 = stmt.executeQuery(sql01);

				boolean b = rs01.next();
				if (b == true) // 成功抓取資料
				{
					String vcode = String.format("V%06d", mRnd.nextInt(9999999)); // 建立驗證碼
					jsonResp.put("Status", "0"); // 0: 成功

					jsonResp.put("Name", rs01.getString(1)); // 這是暫時的, 名字要從資料庫取得
					jsonResp.put("Phone", jsonReq.getString("Phone"));
					jsonResp.put("VCode", vcode);
					jsonResp.put("Id", rs01.getString(2));
					jsonResp.put("Con",rs01.getString(3));
					jsonResp.put("Hid", hid);
					VCodeStore.putVCode(hid, vcode);
			
					
				} else // 失敗說明
				{
					jsonResp.put("Status", "1"); // 1: 失敗
					jsonResp.put("Description", "資料驗證失敗");
				}

				rs01.close();
				break;
				
				
			case 1002: // 要求驗證碼(外)
				String rid = jsonReq.getString("RID");
				String sql02 = "select P_NAME,P_ID,P_CON from allpeople where P_PID='" + jsonReq.getString("PID") + "' AND P_RID='"
						+ rid + "' ";

				System.out.println("Info: SQL=" + sql02);
				
				ResultSet rs02 = stmt.executeQuery(sql02);

				boolean w = rs02.next();
				if (w == true) // 成功抓取資料
				{
					String vcode = String.format("V%06d", mRnd.nextInt(9999999)); // 建立驗證碼
					jsonResp.put("Status", "0"); // 0: 成功

					jsonResp.put("Name", rs02.getString(1)); // 這是暫時的, 名字要從資料庫取得
					jsonResp.put("Phone", jsonReq.getString("Phone"));
					jsonResp.put("VCode", vcode);
					jsonResp.put("Id", rs02.getString(2));
					jsonResp.put("Con",rs02.getString(3));
					jsonResp.put("Rid", rid);
					VCodeStore.putVCode(rid, vcode);
			
					
				} else // 失敗說明
				{
					jsonResp.put("Status", "1"); // 1: 失敗
					jsonResp.put("Description", "資料驗證失敗");
				}

				rs02.close();
				break;
				
		
				
			case 1003: // 驗證驗證碼(本國)
				String vcode = jsonReq.getString("VCode");
				String reqHid = jsonReq.getString("Hid");
				String storeVcode = VCodeStore.getVCode(reqHid);
				
				if(storeVcode != null && vcode.equals(storeVcode) == true) {  // 
					jsonResp.put("Status", "0"); // 0: 成功
					
					// 從資料庫取allpeople得產生QRCODE的資料
					ResultSet rsQC = stmt.executeQuery("select P_ID, P_CON from ALLPeople where P_HID='" + reqHid +"'");
					rsQC.next();

					String pid = rsQC.getString(1);
					jsonResp.put("Pid", pid);
					jsonResp.put("Pcon", rsQC.getString(2));
					
					LocalDateTime dt = LocalDateTime.now();
					System.out.println("Date time = " + dt.toString());
					
					jsonResp.put("Datetime", dt.toString());
					
					String sqlQR = "insert into ALLQR_People (P_ID, P_QR) values(?, ?)";
					PreparedStatement preparedStmt = con.prepareStatement(sqlQR);

					preparedStmt.setString(1, pid);
					preparedStmt.setString(2, jsonResp.toString());
					
					preparedStmt.execute();	
					preparedStmt.close();
				}
				else
				{
					jsonResp.put("Status", "1"); // 1: 失敗
					jsonResp.put("Description", "驗證碼不存在或驗證失敗！");
				}
				
				break;  
			case 1004: // 驗證驗證碼(外國)
				vcode = jsonReq.getString("VCode");
				String reqRid = jsonReq.getString("Rid");
				storeVcode = VCodeStore.getVCode(reqRid);
				
				if(storeVcode != null && vcode.equals(storeVcode) == true) {  // 
					jsonResp.put("Status", "0"); // 0: 成功
					
					// 從資料庫取allpeople得產生QRCODE的資料
					ResultSet rsQC = stmt.executeQuery("select P_ID, P_CON from ALLPeople where P_RID='" + reqRid +"'");
					rsQC.next();
					
					String pid = rsQC.getString(1);
					jsonResp.put("Pid", pid);
					jsonResp.put("Pcon", rsQC.getString(2));
					
					LocalDateTime dt = LocalDateTime.now();
					System.out.println("Date time = " + dt.toString());
					
					jsonResp.put("Datetime", dt.toString());
					
					String sqlQR = "insert into ALLQR_People (P_ID, P_QR) values(?, ?)";
					PreparedStatement preparedStmt = con.prepareStatement(sqlQR);

					preparedStmt.setString(1, pid);
					preparedStmt.setString(2, jsonResp.toString());
					
					preparedStmt.execute();	
					preparedStmt.close();
				}
				else
				{
					jsonResp.put("Status", "1"); // 1: 失敗
					jsonResp.put("Description", "驗證碼不存在或驗證失敗！");
				}
				
				break; 
			default:
				System.out.println("Unknown request type");
				jsonResp.put("Status", "1"); // 1: 失敗
				jsonResp.put("Description", "未定義的Request Type.");
			}
			

			System.out.println("JSON response object=" + jsonResp.toString());

			// finally output the json string
			out.print(jsonResp.toString());
		} catch (Exception e) {
			// crash and burn
			e.printStackTrace();
			throw new IOException("Error parsing JSON request string");
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				
				if(con != null) {
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}