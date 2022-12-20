package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.BoardVO;
import com.kosta.jupjup.vo.SearchCriteria;

@Mapper
@Repository
public interface BoardDAO {

	// 게시글 작성

	public void insert(BoardVO boardVO);

	// 게시물 목록 조회
	public List<BoardVO> listPage(SearchCriteria scri);
	
	//게시물 총개수 
	
	public int listCount(SearchCriteria scri);
	// 게시물 조회
	public BoardVO read(int fno);

	// 게시물 수정
	public void update(BoardVO boardVO);

	// 게시물 삭제
	public void delete(int fno);
	
	// 게시판 조회수
	public void boardHit(int fno);
	}

	
