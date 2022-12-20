package com.kosta.jupjup.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kosta.jupjup.dao.LoginDAO;
import com.kosta.jupjup.vo.UserVO;


@Service
public class LoginService {
	
	@Autowired
	LoginDAO loginDAO;
	
		public String getAccessToken (String authorize_code) {

			System.out.println("access_Token 받자");
			String access_Token = "";
			String refresh_Token = "";
			String reqURL = "https://kauth.kakao.com/oauth/token";

			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				StringBuilder sb = new StringBuilder();
				
				sb.append("grant_type=authorization_code");
				sb.append("&client_id=c54da2a5f03d3994996f0e79f1f70ae2"); //본인이 발급받은 key
				sb.append("&redirect_uri=http://localhost:8088/user/kakao"); // 본인이 설정한 경로, 주소
				sb.append("&code=" + authorize_code);
				bw.write(sb.toString());
				bw.flush();
				
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);
				
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
				
				access_Token = element.getAsJsonObject().get("access_token").getAsString();
				refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
				
				System.out.println("access_token : " + access_Token);
				System.out.println("refresh_token : " + refresh_Token);
				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return access_Token;
		}
	    
		
		
		public UserVO getUserInfo(String access_Token) {
			
			HashMap<String, Object> userInfo = new HashMap<String, Object>();
			
			String reqURL = "https://kapi.kakao.com/v2/user/me";
			
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);
				
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				
				String line = "";
				String result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
				
				JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();	
				JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
				
				String nickname = properties.getAsJsonObject().get("nickname").getAsString();
				String email = kakao_account.getAsJsonObject().get("email").getAsString();
				String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
				
				String[] emailSep = email.split("@");
				String id = emailSep[0];
				
				System.out.println(nickname);				
				System.out.println(id);
				System.out.println(email);
				System.out.println(gender);
				
				userInfo.put("id", id);
				userInfo.put("nickname", nickname);
				userInfo.put("email", email);
				userInfo.put("gender", gender);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			UserVO result = loginDAO.findKakao(userInfo);
			
			if(result == null) {
				loginDAO.kakaoInsert(userInfo);
				return loginDAO.findKakao(userInfo);
			}
			return result;
		}
	    
	}
