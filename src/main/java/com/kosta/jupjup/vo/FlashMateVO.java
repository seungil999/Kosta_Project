package com.kosta.jupjup.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class FlashMateVO {
	private Long fno;
	private String activityname;
	private String writer;
	private String meetingplace;
	private Date meetingtime;
	private int peoplenum;
	private int peoplemaxnum;
	private String startzone;
	private String endzone;
	private int starttime;
	private int endtime;
	private String content;
	private Date regdate;
	private int replycnt;
	private String image;
}
