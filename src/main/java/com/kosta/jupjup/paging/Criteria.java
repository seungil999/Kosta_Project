package com.kosta.jupjup.paging;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

	private int pageNum ; // 현재 페이지 번호
	private int amount ; // 하단 페이지 당 보여줄 양

	private String type; // 검색 유형
	private String keyword; // 검색 키워드 
	
	private String meeting; // matefind 
	private String filter;
	private int currenttime;
	
	
	public Criteria() {
		this.pageNum = 1;
		this.amount = 12;
		this.filter = "all";
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {

		return type == null ? new String[] {} : type.split("");
	}
	
	

	public String getListLink() {

		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword())
				.queryParam("filter", this.getFilter());
		return builder.toUriString();

	}
}
