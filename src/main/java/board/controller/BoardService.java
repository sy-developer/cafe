package board.controller;

import java.util.List;

import board.bean.BoardDTO;

public interface BoardService {
	// 저장하기
	public int boardWrite(BoardDTO boardDTO);
	// 삭제하기
	public int boardDelete(int board_num);
	// 상세보기
	public BoardDTO boardView(int board_num);
	// 목록보기
	public List<BoardDTO> boardList(int startNum, int endNum);
	// 전체 데이타 갯수 구하기 
	public int getTotal();
	// 조회수 증가하기
	public int updateHit(int board_readcount);
	// 수정하기
	public int boardModify(BoardDTO boardDTO);
	// 댓글달기
	public int boardReply(BoardDTO dto);
	// 작성자 확인하기
	public boolean isArticleBoardWriter(String board_id);
}


