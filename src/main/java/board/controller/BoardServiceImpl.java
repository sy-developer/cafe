package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;
	// 글 작성하기
	@Override
	public int boardWrite(BoardDTO boardDTO) {
		return boardDAO.boardWrite(boardDTO);
	}
	// 글 삭제하기
	@Override
	public int boardDelete(int board_num) {
		return boardDAO.boardDelete(board_num);
	}
	// 글 상세보기
	@Override
	public BoardDTO boardView(int board_num) {
		return boardDAO.boardView(board_num);
	}
	// 목록보기
	@Override
	public List<BoardDTO> boardList(int startNum, int endNum) {
		return boardDAO.boardList(startNum, endNum);
	}
	// 총 데이타 수 구하기
	@Override
	public int getTotal() {
		return boardDAO.getTotal(); 
	}
	// 조회수 증가하기
	@Override
	public int updateHit(int board_readcount) {
		return boardDAO.updateHit(board_readcount);
	}
	// 글 수정하기
	@Override
	public int boardModify(BoardDTO boardDTO) {
		return boardDAO.boardModify(boardDTO);
	}
	// 댓글달기
	@Override
	public int boardReply(BoardDTO boardDTO) {
		return boardDAO.boardReply(boardDTO);
	}
	// 작성자 확인하기
	@Override
	public boolean isArticleBoardWriter(String board_id) {
		return boardDAO.isArticleBoardWriter(board_id);
	}
}
	
	


