package com.kosta.jupjup.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	
	// TODO 1216 > phone 삭제, grade, status , regdate, updatedate, deletedate 추가 됨
	
	private String id;
	
	private String username;

	private String nickname;

	private String pwd;

	private String email;

	private String gender;
	
	private String status;
	
	private String profile;
	
	private String profile_open; // 프로필 공개 여부 
	
	private int grade; // 가입 1, 최대 3
	
	private String regdate;
	
	private String updatedate;
	
	private String deletedate;
	

}
