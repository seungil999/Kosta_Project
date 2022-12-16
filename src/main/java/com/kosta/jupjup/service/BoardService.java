package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.vo.BoardVO;
import com.kosta.jupjup.vo.SearchCriteria;

@Service
public interface BoardService {

	// 게시글 작성
	public void write(BoardVO boardVO);

	// 게시물 목록 조회
	public List<BoardVO> listPage(SearchCriteria scri);
	// 게시물 총개수

	public int listCount(SearchCriteria scri);

   // 게시물 조회
	public BoardVO read(int bno);

	// 게시물 수정
	public void update(BoardVO boardVO);

	// 게시물 삭제
	public void delete(int bno);

	


}
