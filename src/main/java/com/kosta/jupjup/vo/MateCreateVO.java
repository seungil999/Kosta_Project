package com.kosta.jupjup.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MateCreateVO {
	private Long fno;
	private String activityname;
	private String writer;
	private String meetingplace;
	private String meetingtime;
	private int peoplenum;
	private String peoplemaxnum;
	private String startzone;
	private String endzone;
	private String starttime;
	private String endtime;
	private String content;
	private Date regdate;
	private int replycnt;
	private String image;
	
	//fileName을 가져와야할거같은데
	//private String fileName;
}
