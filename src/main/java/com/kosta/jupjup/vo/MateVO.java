package com.kosta.jupjup.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MateVO {
	// TODO 수정된 테이블에 맞춰서 수정했음.
	
	private Long mate_no; // private Long no;
	private String activityname;
	private String writer;
	private Date meetingdate;
	private String meetingplace;
	private int meetingtime;
	private String dayofweek;
	private int peoplenum;
	private int peoplemaxnum;
	private String startzone;
	private String endzone;
	private Integer starttime;
	private Integer endtime;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int replycnt;
	private String image;
	private int regular;
	private int likecnt;
	private String user_id;
	private Integer report_count;
	
	
}
