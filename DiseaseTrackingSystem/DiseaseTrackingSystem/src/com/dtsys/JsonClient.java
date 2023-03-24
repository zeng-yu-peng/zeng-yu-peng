package com.dtsys;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class JsonClient {

	public static void main(String[] args) {
		JSONObject jsonReq = new JSONObject();
		try {
			jsonReq.put("Type", "1001");
			jsonReq.put("PID", "0000001");
			jsonReq.put("SID", "A000001");
			jsonReq.put("Phone", "0987456123");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		CloseableHttpClient httpClient = HttpClients.createDefault();
		System.out.println("Json request object: " + jsonReq.toString());
		
		HttpPost httpPost = new HttpPost("http://localhost:8080/DiseaseTrackingSystem/RequestHandler");
		
		StringEntity strEntity = new StringEntity(jsonReq.toString(), "UTF-8");
		strEntity.setContentEncoding("UTF-8");
		strEntity.setContentType(new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));
		
		httpPost.setEntity(strEntity);
		
		System.out.println("Executing request: req=" + httpPost.getRequestLine());
		
		// create a response handler
		ResponseHandler<String> respHandler = new ResponseHandler<String> () {

			@Override
			public String handleResponse(HttpResponse resp) throws ClientProtocolException, IOException {
				int status = resp.getStatusLine().getStatusCode();
				
				if(status >= 200 && status < 300) {
					HttpEntity ent = resp.getEntity();
					
					return ent != null? EntityUtils.toString(ent): null; 
				} else {
					throw new ClientProtocolException("Unexpected response: status=" + status);
				}
			}
		};
			
		try {
			String respBody = httpClient.execute(httpPost, respHandler);
			System.out.println("Response received: resp=" + respBody);
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
		
}
