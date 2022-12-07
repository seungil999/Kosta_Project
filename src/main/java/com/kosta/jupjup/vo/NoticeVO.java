package com.kosta.jupjup.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private Long no;
	private String name;
	private String content;
	
	private Date regdate;
}
