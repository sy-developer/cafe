package notice.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import notice.bean.NoticeDTO;

@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/notice/noticeDelete.do")	// handlerMapping 설정하기
	public ModelAndView noticeDelete(HttpServletRequest request, HttpServletResponse response) {
		// 데이터 처리하기
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// db 처리하기
		int result = noticeService.noticeDelete(notice_num);
		// 화면네비게이션 설정하기 : 데이타 공유하기 + view처리 파일 선택하기
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("noticeDelete.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value= "/notice/noticeList.do")
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) {
		// boardList.jsp의 데이타 코드처리하기
		// 데이타 읽어오기 
		int pg = 1;
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));	
		}
		System.out.println("pg =" + pg);
		// db 처리하기
		// 목록 : 한 페이지당 5개씩 보이기
		int limit = 10;
		int endNum = pg * limit;
		int startNum = endNum - (limit - 1);

		List<NoticeDTO> list = noticeService.noticeList(startNum, endNum);
		System.out.println("list");
		/* 페이징 처리하기 */
		// 목록 : 한 페이지당 10개씩
		int totalA = noticeService.getTotal();	// 총 글 수 구하기
		int totalP = (totalA + (limit - 1)) / limit;	// 총 페이지 수 구하기
		
		// 페이징 숫자 설정하기
		// 다섯 블럭
		int startPage = (pg-1) / 5 * 5 + 1;
		int endPage = startPage + 2;
		if(endPage > totalP) endPage = totalP;
		
		// 화면 네비게이션 처리하기
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg );
		modelAndView.addObject("list", list);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		
		modelAndView.setViewName("noticeList.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value = "/notice/noticeView.do")
	public ModelAndView boardView(HttpServletRequest request, HttpServletResponse response) {
		// 데이터 처리하기
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// db 처리하기
		NoticeDTO noticeDTO = new NoticeDTO();
		System.out.println("noticeDTO = " + noticeDTO);
		
		// 조회수 증가하기
		noticeService.updateHit(notice_num);
		noticeDTO = noticeService.noticeView(notice_num);
				
		// 화면네비게이션 설정하기 : 데이타 공유하기 + view처리 파일 선택하기
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("notice_num", notice_num);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("noticeDTO", noticeDTO);
		modelAndView.setViewName("noticeView.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value = "/notice/noticeWriteForm.do")
	public ModelAndView boardWriteForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("noticeWriteForm.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value = "/notice/noticeWrite.do")
	public ModelAndView noticeWrite(HttpServletRequest request, HttpServletResponse response) {
		// 데이터 처리하기
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String notice_subject = request.getParameter("notice_subject");
		String notice_content = request.getParameter("notice_content");
		String notice_id = (String)session.getAttribute("adminId");
		
		// db 처리하기
		NoticeDTO noticeDTO = new NoticeDTO();
		
		noticeDTO.setNotice_id(notice_id);
		noticeDTO.setNotice_subject(notice_subject);
		noticeDTO.setNotice_content(notice_content);
		System.out.println("id = " + notice_id);
		System.out.println("subject = " + notice_subject);
		System.out.println("content = " + notice_content);
		System.out.println("noticeDTO = " + noticeDTO);
	
		int result = noticeService.noticeWrite(noticeDTO);
		System.out.println("result = " + result);
		
		// 화면네비게이션 설정하기 : 데이타 공유하기 + view처리 파일 선택하기
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("noticeWrite.jsp");
		return modelAndView;
	}
	@RequestMapping(value = "/notice/noticeModify.do")
	public ModelAndView noticeModify(HttpServletRequest request, HttpServletResponse response) {
		// 데이터 처리하기
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String notice_subject = request.getParameter("notice_subject");
		String notice_content = request.getParameter("notice_content");
		String notice_id = (String)session.getAttribute("adminId");
		
		// db 처리하기
		NoticeDTO noticeDTO = new NoticeDTO();

		noticeDTO.setNotice_id(notice_id);
		noticeDTO.setNotice_subject(notice_subject);
		noticeDTO.setNotice_content(notice_content);
		System.out.println("id = " + notice_id);
		System.out.println("subject = " + notice_subject);
		System.out.println("content = " + notice_content);
		System.out.println("noticeDTO = " + noticeDTO);
		
		//BoardDAO dao = new BoardDAO();
		int result = noticeService.noticeModify(noticeDTO);
		System.out.println("result = " + result);
		
		// 화면네비게이션 설정하기 : 데이타 공유하기 + view처리 파일 선택하기
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("noticeModify.jsp");
		return modelAndView;
	}
	@RequestMapping(value = "/notice/noticeModifyForm.do")
	public ModelAndView boardModifyForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("noticeModifyForm.jsp");
		
		return modelAndView;
	}
}
