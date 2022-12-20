package com.kosta.jupjup.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class ReplyVO {

	private int frno;
	private int fno;
	private String content;
	private String writer;
	private Date regdate;
	
	@Override
	public String toString() {
		return "ReplyVO [frno=" + frno + ", fno=" + fno + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + "]";
	}
	
	
}