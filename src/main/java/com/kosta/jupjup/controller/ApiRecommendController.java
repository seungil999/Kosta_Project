package com.kosta.jupjup.controller;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.XML;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class ApiRecommendController {

	private static final String url = "http://openapi.tour.go.kr/openapi/service/TourismResourceService/getTourResourceList"; 
	private static final String skey = "QHVC2Zvf84fs2SsY9w3VqwkO%2BWMIfz9E66i5411xgZKpZJ4qdqp%2BK%2Fx%2BYDBnR1w6sZdU%2Bw35pE6SeGm7B9c1aQ%3D%3D"; // 서비스키 

	@GetMapping("/recommend/info")
	public Map<String, Object> getInfo(@RequestParam Map<String, Object> paramMap) throws Exception {

		System.out.println("도착!");
        Map<String, Object> resultMap = new HashMap<>();   
        String sido = (String) paramMap.get("sido");
        String gungu = (String) paramMap.get("gungu");
        
        System.out.println("***입력받은 시도 : "+sido);
        System.out.println("***입력받은 군구 : "+gungu);
        try {
 
            StringBuilder urlBuilder = new StringBuilder(url);
            urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+skey); /*Service Key*/
            urlBuilder.append("&" + URLEncoder.encode("SIDO","UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8")); /*시도*/
            urlBuilder.append("&" + URLEncoder.encode("GUNGU","UTF-8") + "=" + URLEncoder.encode(gungu, "UTF-8")); /*시군구*/
           urlBuilder.append("&" + URLEncoder.encode("RES_NM","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*관광지*/
            URL url = new URL(urlBuilder.toString());
 
            System.out.println("###url=>"+url);
 
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json");
            System.out.println("Response Code:"+conn.getResponseCode());
 
 
            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
 
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line=rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();
 
            org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
            String xmlJSONObjString = xmlJSONObj.toString();
           // System.out.println("### xmlJSONObjString=>"+xmlJSONObjString);
 
            // json 변환된 곳에서 원하는 데이터만 추출
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> map = new HashMap<>();
            map = objectMapper.readValue(xmlJSONObjString, new TypeReference<Map<String, Object>>(){});
           
            Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
            Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
            Map<String, Object> items = null;
            List<Map<String, Object>> itemList = null;
 
            items = (Map<String, Object>) body.get("items");
            itemList = (List<Map<String, Object>>) items.get("item");
 
         //   System.out.println("### map="+map);
          //  System.out.println("### dataResponse="+dataResponse);
           // System.out.println("### body="+body);
          //  System.out.println("### items="+items);
          //  System.out.println("### itemList="+itemList);
 

            
          resultMap.put("Result", "0000");           
            resultMap.put("data", itemList);
            
 
        } catch (Exception e) {
            e.printStackTrace(); 
            resultMap.clear();
           resultMap.put("Result", "0001");
        }
 
        return resultMap;
    }
	
	
	
}
