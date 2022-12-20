package com.kosta.jupjup.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class BoardVO {

	private int fno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int hit;
	private String user_id;

	
	

}



