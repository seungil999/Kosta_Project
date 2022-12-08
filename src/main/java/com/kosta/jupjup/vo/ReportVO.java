package com.kosta.jupjup.vo;


import lombok.Data;

@Data
public class ReportVO {
	private int report_no;
	private int report_type;
	private String report_writer;
	private String report_content;
	private Long mate_id;
	private String user_id;
	private String report_user_id;
	private String report_mate_id;
	private int cnt;
	
	
}
