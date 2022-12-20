package com.kosta.jupjup.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MateReplyVO {
	private Long rno; // rno > mate_reply_no
	private Long no;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
	private String user_id;
	
	/** 유저 프로필 **/
	private String username;

	private String nickname;

	private String id;

	private String pwd;

	private String email;

	private String phone;

	private String gender;
	
	private String profile;
	
	private String profile_open;
	
	private int grade;
	
}
