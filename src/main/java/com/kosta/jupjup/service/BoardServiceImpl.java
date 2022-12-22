package com.kosta.jupjup.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.jupjup.dao.BoardDAO;
import com.kosta.jupjup.vo.BoardVO;
import com.kosta.jupjup.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) {
		dao.insert(boardVO);
	}
	// 게시물 목록 조회
		@Override
		public List<BoardVO> listPage(SearchCriteria scri)  {

			return dao.listPage(scri);
		}
		// 게시물 총갯수 
		@Override
		public int listCount(SearchCriteria scri){
			return dao.listCount(scri);
		}


		// 게시물 조회
		@Transactional(isolation = Isolation.READ_COMMITTED)
		@Override
		public BoardVO read(int fno)  {
				   dao.boardHit(fno);
			return dao.read(fno);
		}

		
		@Override
		public void update(BoardVO boardVO) {

			dao.update(boardVO);
		}

		@Override
		public void delete(int fno){
			
			dao.delete(fno);
		}
}