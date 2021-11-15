package board.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import board.bean.BoardDTO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/board/boardDelete.do")	// handlerMapping 설정하기
	public ModelAndView boardDelete(HttpServletRequest request, HttpServletResponse response) {
		// 데이터 처리하기
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// db 처리하기
		int result = boardService.boardDelete(board_num);
		// 화면네비게이션 설정하기 : 데이타 공유하기 + view처리 파일 선택하기
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("boardDelete.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value= "/board/boardList.do")
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response) {
		// boardList.jsp의 데이타 코드처리하기
		// 데이타 읽어오기 
		int pg = 1;
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));	
		}
		System.out.println("pg =" + pg);
		// db 처리하기
		// 목록 : 한 페이지당 10개씩 보이기
		int limit = 10;
		int endNum = pg * limit;
		int startNum = endNum - (limit - 1);
		
		//BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = boardService.boardList(startNum, endNum);
		System.out.println("list");
		/* 페이징 처리하기 */
		// 목록 : 한 페이지당 10개씩
		int totalA = boardService.getTotal();	// 총 글 수 구하기
		int totalP = (totalA + (limit - 1)) / limit;	// 총 페이지 수 구하기
		
		// 페이징 숫자 설정하기
		// 다섯 블럭
		int startPage = (pg-1) / 5 * 5 + 1;
		int endPage = startPage + 1;
		if(endPage > totalP) endPage = totalP;
		
		// 화면 네비게이션 처리하기
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg );
		modelAndView.addObject("list", list);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		
		modelAndView.setViewName("boardList.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value = "/board/boardView.do")
	public ModelAndView boardView(HttpServletRequest request, HttpServletResponse response) {
		// 데이터 처리하기
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// db 처리하기
		// 조회수 증하하기
		boardService.updateHit(board_num);
		BoardDTO boardDTO = boardService.boardView(board_num);
		// 화면네비게이션 설정하기 : 데이타 공유하기 + view처리 파일 선택하기
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("board_num", board_num);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("boardDTO", boardDTO);
		modelAndView.setViewName("boardView.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value = "/board/boardWriteForm.do")
	public ModelAndView boardWriteForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("boardWriteForm.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value = "/board/boardWrite.do")
	public ModelAndView boardWrite(HttpServletRequest request, HttpServletResponse response) {
		// 데이터 처리하기
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String board_subject = request.getParameter("subject");
		String board_content = request.getParameter("content");
		String board_pass = request.getParameter("pass");
		String board_id = (String)session.getAttribute("memId");
		
		// db 처리하기
		BoardDTO boardDTO = new BoardDTO();
		
		boardDTO.setBoard_id(board_id);
		boardDTO.setBoard_pass(board_pass);
		boardDTO.setBoard_subject(board_subject);
		boardDTO.setBoard_content(board_content);
		System.out.println("id = " + board_id);
		System.out.println("pass = " + board_pass);
		System.out.println("subject = " + board_subject);
		System.out.println("content = " + board_content);
		System.out.println("boardDTO = " + boardDTO);
	
		int result = boardService.boardWrite(boardDTO);
		System.out.println("result = " + result);
		
		// 화면네비게이션 설정하기 : 데이타 공유하기 + view처리 파일 선택하기
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("boardWrite.jsp");
		return modelAndView;
	}
	@RequestMapping(value = "/board/boardModify.do")
	public ModelAndView boardModify(HttpServletRequest request, HttpServletResponse response) {
		// 데이터 처리하기
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String board_subject = (String)session.getAttribute("subject");
		String board_content = (String)session.getAttribute("content");
		String board_pass = (String)session.getAttribute("pass");
		String board_id = (String)session.getAttribute("memId");
		
		// db 처리하기
		BoardDTO boardDTO = new BoardDTO();
		
		boardDTO.setBoard_id(board_id);
		boardDTO.setBoard_pass(board_pass);
		boardDTO.setBoard_subject(board_subject);
		boardDTO.setBoard_content(board_content);
		System.out.println("boardDTO = " + boardDTO);
		
		//BoardDAO dao = new BoardDAO();
		int result = boardService.boardModify(boardDTO);
		System.out.println("result = " + result);
		
		// 화면네비게이션 설정하기 : 데이타 공유하기 + view처리 파일 선택하기
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("boardModify.jsp");
		return modelAndView;
	}
	@RequestMapping(value = "/board/boardModifyForm.do")
	public ModelAndView boardModifyForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("boardModifyForm.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value = "/board/boardReply.do")
	public ModelAndView boardReply(HttpServletRequest request, HttpServletResponse response) {
		// 데이터 처리하기
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String board_subject = request.getParameter("subject");
		String board_content = request.getParameter("content");
		String board_pass = request.getParameter("pass");
		String board_id = (String)session.getAttribute("memId");
		
		// db 처리하기
		BoardDTO boardDTO = new BoardDTO();
		
		boardDTO.setBoard_id(board_id);
		boardDTO.setBoard_pass(board_pass);
		boardDTO.setBoard_subject(board_subject);
		boardDTO.setBoard_content(board_content);
		System.out.println("id = " + board_id);
		System.out.println("pass = " + board_pass);
		System.out.println("subject = " + board_subject);
		System.out.println("content = " + board_content);
		System.out.println("boardDTO = " + boardDTO);
		
		//BoardDAO dao = new BoardDAO();
		int result = boardService.boardReply(boardDTO);
		System.out.println("result = " + result);
		
		// 화면네비게이션 설정하기 : 데이타 공유하기 + view처리 파일 선택하기
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("boardReply.jsp");
		return modelAndView;
	}
	@RequestMapping(value = "/board/boardReplyForm.do")
	public ModelAndView boardReplyForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("boardReplyForm.jsp");
		
		return modelAndView;
	}
}





