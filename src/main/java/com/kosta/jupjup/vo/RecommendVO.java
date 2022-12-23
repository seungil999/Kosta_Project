package com.kosta.jupjup.vo;

import lombok.Data;

@Data
public class RecommendVO {

	// 가져온 데이터 파싱
	private String recname; // 관광지
	private String address; // 주소
	private String simpledesc; // 자원소개
	private int rec_no;	//번호
	private String user_id;
	
/*
create table recommend (
    recno number primary key,
    recname varchar(20) not null,
    address varchar2(20) not null,
    simpledesc varchar2(2000) not null
);
*/
}
