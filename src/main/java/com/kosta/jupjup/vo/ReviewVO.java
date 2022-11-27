package com.kosta.jupjup.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private Long no;
	private Long mate_no;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private int replycnt;
	private int likecnt;
	private int hit;
}
