package checkout.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.controller.MemberService;
import menu.bean.MenuDTO;
import menu.controller.MenuService;

@Controller
public class CheckoutController {
	@Autowired
	MenuService menuService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/checkout/buy_page.do")
	public ModelAndView buy_page(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		// 데이터
		String id = (String)session.getAttribute("memId");
		int stock_num = Integer.parseInt(request.getParameter("stock_num"));
		int cart_cnt = Integer.parseInt(request.getParameter("cart_cnt"));
		String one = "one";
		System.out.println(id); 
		System.out.println(stock_num); 
		System.out.println(cart_cnt); 
		
		// DB
		MemberDTO memberDTO = memberService.memberView(id);
		MenuDTO menuDTO = menuService.menuView(stock_num);
		
		int total_cost = menuDTO.getPrice() * cart_cnt;
		// 화면 네비게이션 : 데이터 공유 + view처리 파일 선택
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("id",id);
		modelAndView.addObject("stock_num", stock_num);
		modelAndView.addObject("cart_cnt", cart_cnt);
		modelAndView.addObject("total_cost", total_cost);
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("menuDTO", menuDTO);
		modelAndView.addObject("one", one);
		modelAndView.setViewName("../checkout/buy_page.jsp");
		
		return modelAndView;
	}
}
