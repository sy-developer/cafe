package member.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import menu.bean.MenuDTO;

@Controller
public class MemberController {
	@Autowired
	MemberService service;

	@RequestMapping(value = "/member/login.do")
	public ModelAndView login(HttpServletRequest request) {
		// 데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		// DB
		String name = service.login(id, pwd);

		// 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();

		HttpSession session = request.getSession();

		if (name != null) {
			// 세션에 공유 데이터 저장
			session.setAttribute("memPwd", pwd);
			session.setAttribute("memId", id);

			// 화면 이동 (= 페이지 이동)
			modelAndView.setViewName("redirect:../main/main.do");
		} else {
			modelAndView.setViewName("loginFail.jsp");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/member/logout.do")
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		// 세션 삭제
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		// 모든 세션 삭제하기 : 무효화
		session.invalidate();
		// 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("logout.jsp");
		return modelAndView;
	}

	// **********************************오후수업***************************************//

	@RequestMapping(value = "/member/join.do")
	public ModelAndView write(HttpServletRequest request) {
		// 데이터 읽어오기
		try {
			request.setCharacterEncoding("utf-8"); // 한글 엔코딩 설정
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id = request.getParameter("member_id");
		String pwd = request.getParameter("member_pw");
		String name = request.getParameter("member_name");
		String post = request.getParameter("post");
		String base_addr = request.getParameter("base_addr");
		String extra_addr = request.getParameter("extra_addr");
		String member_phone = request.getParameter("member_phone");
		String member_email = request.getParameter("member_email");
		String member_birth = request.getParameter("member_birth");
		String logtime = request.getParameter("logtime");

		// DB 처리
		MemberDTO dto = new MemberDTO(); // 클라이언트로부터 전달된 데이터를 dto에 저장
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setName(name);
		dto.setAge(member_birth);
		dto.setEmail(member_email);
		dto.setTel(member_phone);
		dto.setAddr1(post);
		dto.setAddr2(base_addr);
		dto.setAddr3(extra_addr);
		dto.setLogtime(logtime);

		int result = service.write(dto);

		String result_str = "";
		if (result > 0)
			result_str = "회원가입완료입니다!!!";
		else
			result_str = "엥 무언가 잘못되었어요 메인으로 이동합니다!!!";

		// 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result_str", result_str);
		modelAndView.setViewName("write.jsp");
		return modelAndView;
	}

	@RequestMapping(value = "/member/checkId.do")
	public ModelAndView checkId(HttpServletRequest request) {
		// 데이터
		String id = request.getParameter("id");
		// DB
		boolean result = service.isExistId(id);
		// 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("id", id);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("checkId.jsp");
		return modelAndView;
	}

	@RequestMapping(value = "/mypage/mypage.do")
	public ModelAndView memberView(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();

		String id = (String) session.getAttribute("memId");

		MemberDTO dto = service.memberView(id);
		modelAndView.addObject("dto", dto);
		modelAndView.setViewName("../mypage/mypage.jsp");

		return modelAndView;
	}

	@RequestMapping(value = "/mypage/mypageUpdate.do")
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();

		String id = (String) session.getAttribute("memId");

		MemberDTO dto = service.memberView(id);
		modelAndView.addObject("dto", dto);

		modelAndView.setViewName("../mypage/mypageUpdate.jsp");

		return modelAndView;
	}

	@RequestMapping(value = "/mypage/mypageModify.do")
	public ModelAndView modify(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int memberNum = Integer.parseInt(request.getParameter("memberNum"));
		String who = request.getParameter("who");
		String id = (String) session.getAttribute("memId");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String member_birth = request.getParameter("member_birth");
		String member_phone = request.getParameter("member_phone");
		String member_email = request.getParameter("member_email");
		String member_post = request.getParameter("member_post");
		String member_base_addr = request.getParameter("member_base_addr");
		String member_extra_addr = request.getParameter("member_extra_addr");

		MemberDTO dto = new MemberDTO();
		dto.setMemberNum(memberNum);
		dto.setId(id);
		dto.setWho(who);
		dto.setPwd(pwd);
		dto.setName(name);
		dto.setAge(member_birth);
		dto.setTel(member_phone);
		dto.setEmail(member_email);
		dto.setAddr1(member_post);
		dto.setAddr2(member_base_addr);
		dto.setAddr3(member_extra_addr);

		int result = service.modify(dto);
		String result_str = "";

		if (result > 0)
			result_str = "회원정보가 수정되었습니다.";
		else
			result_str = "회원정보 수정 실패하였습니다.";

		// 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("result_str", result_str);
		modelAndView.setViewName("mypageUpdateOk.jsp");
		return modelAndView;
	}

	@RequestMapping(value = "/mypage/change_pw.do")
	public ModelAndView modify_pw(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();
		
		String id = (String) session.getAttribute("memId");
		String pw = request.getParameter("member_pw");
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPwd(pw);
		
		int result = service.modify_pw(dto);

		System.out.println("id = " + id);
		System.out.println("pw = " + pw);
		System.out.println("result = " + result);
				
		if (result==1) {
			String warning = "비밀번호변경이 성공하였습니다";
			modelAndView.addObject("result", result);
			modelAndView.addObject("warning", warning);
			modelAndView.setViewName("change_pw.jsp");
		}
		if (result==0) {
			String warning = "비밀번호변경이 실패하였습니다";
			modelAndView.addObject("result", result);
			modelAndView.addObject("warning", warning);
			modelAndView.setViewName("change_pw.jsp");
		}
	
		return modelAndView;
	}

	@RequestMapping(value = "/mypage/check_pw.do")
	public ModelAndView check_pw(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();

		String id = (String) session.getAttribute("memId");
		String pwd = request.getParameter("member_pw");
		
		String result = service.check_pw(id, pwd);
		
		if (result.equals("1")) {
			modelAndView.setViewName("change_pw.jsp");
		}
		if (result.equals("0")) {
			String warning = "비밀번호를 제대로 입력해주세요";
			modelAndView.addObject("result", result);
			modelAndView.addObject("warning", warning);
			modelAndView.setViewName("check_pw.jsp");
		}

		return modelAndView;
	}
	
	@RequestMapping(value = "/member/find_id.do")
	public ModelAndView find_id(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String name = request.getParameter("member_name");
		String tel = request.getParameter("re_member_tel");

		String search_id = service.find_id(name, tel);
		
		int result = 0;
		if (search_id == null) {
			modelAndView.addObject("result", result);
			modelAndView.addObject("name", name);
			modelAndView.setViewName("id_find_ok.jsp");
		}
		if (search_id != null) {
			result = 1;
			modelAndView.addObject("search_id", search_id);
			modelAndView.addObject("result", result);
			modelAndView.addObject("name", name);
			modelAndView.setViewName("id_find_ok.jsp");
		}

		return modelAndView;
	}
	
	@RequestMapping(value = "/member/find_pw.do")
	public ModelAndView find_pw(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id = request.getParameter("member_id");
		String name = request.getParameter("member_name");
		String tel = request.getParameter("member_tel");
		System.out.println("id : " + id);
		System.out.println("name : " + name);
		System.out.println("tel : " + tel);

		String search_pw = service.find_pw(id, name, tel);
		System.out.println("search_pw : " + search_pw);
		
		int result = 0;
		if (search_pw == null) {
			modelAndView.addObject("result", result);
			modelAndView.addObject("name", name);
			modelAndView.setViewName("pw_find_ok.jsp");
		}
		if (search_pw != null) {
			result = 1;
			modelAndView.addObject("search_pw", search_pw);
			modelAndView.addObject("result", result);
			modelAndView.addObject("name", name);
			modelAndView.setViewName("pw_find_ok.jsp");
		}

		return modelAndView;
	}
	
	@RequestMapping(value = "/mypage/drop_id.do")
	public ModelAndView drop_id(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();
		
		String id = (String) session.getAttribute("memId");
		String pw = request.getParameter("member_pw");
		
		int result = service.drop_id(id, pw);

		System.out.println("id = " + id);
		System.out.println("pw = " + pw);
		System.out.println("result = " + result);
				
		if (result==1) {
			String warning = "회원탈퇴에 성공하였습니다";
			modelAndView.addObject("result", result);
			modelAndView.addObject("warning", warning);
			modelAndView.setViewName("drop_id_ok.jsp");
		}
		if (result==0) {
			String warning = "입력하신 비밀번호가 올바르지 않습니다";
			modelAndView.addObject("result", result);
			modelAndView.addObject("warning", warning);
			modelAndView.setViewName("drop_id.jsp");
		}
	
		return modelAndView;
	}


}
