package com.kosta.jupjup.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MateVO {
	private Long no;
	private String activityname;
	private String writer;
	private String meetingplace;
	private Date meetingtime;
	private String dayofweek;
	private int peoplenum;
	private int peoplemaxnum;
	private String startzone;
	private String endzone;
	private String starttime;
	private String endtime;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int replycnt;
	private String image;
	private String regular;
	private int likecnt;
}
