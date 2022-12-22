package com.kosta.jupjup.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MateCreateVO {
	
	// no > mate_no
	
	private Long mate_no;

	@NotBlank(message = "모임명을 입력 해주세요.")
	private String activityname;

	private String writer;

	@NotBlank(message = "모임장소를 입력 해주세요.")
	private String meetingplace;
	
	private int meetingtime;
	
	private Date meetingdate;

	private int peoplenum;

	private int peoplemaxnum;
	
	@NotBlank(message = "출발지를 입력 해주세요.")
	private String startzone;
	
	@NotBlank(message = "도착지를 입력 해주세요.")
	private String endzone;
	
	@NotNull(message = "시작시간를 입력 해주세요.")
	private int starttime;
	
	@NotNull(message = "종료시간을 입력 해주세요.")
	private int endtime;
	
	@NotBlank(message = "예시를 참고해서 안내사항을 작성해주세요.")
	private String content;

	private Date regdate;

	private int replycnt;

	private String image;

	private int regular;
	
	private String timestamp;
	
	private String user_id;

}
