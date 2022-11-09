package com.kosta.jupjup.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RegularMateVO {
	private Long no;
	private String writer;
	private String meetingplace;
	private Date meetingtime;
	private int peoplenum;
	private String startzone;
	private String endzone;
	private int starttime;
	private int endtime;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int replycnt;
}