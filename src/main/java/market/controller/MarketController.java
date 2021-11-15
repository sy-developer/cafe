package market.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import market.bean.MarketDTO;
import member.bean.MemberDTO;
import member.controller.MemberService;
import menu.bean.MenuDTO;
import menu.controller.MenuService;

@Controller
public class MarketController {

	@Autowired
	MarketService marketService;

	@Autowired
	MenuService menuservice;

	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/market/market.do")
	public ModelAndView market(HttpServletRequest request, ModelAndView modelAndView) {
		HttpSession session = request.getSession();
		MarketDTO marketDTO = new MarketDTO();

		String id = (String) session.getAttribute("memId");
		// String a = request.getParameterValues("count")[0];

		List<MarketDTO> list = marketService.listMarket(id);// 회원id로 가져와서 list에 넣기

		int fee = 3000; // 배송비는 3000원으로 일단 고정!
		// System.out.println("a : " + a);
		modelAndView.setViewName("market.jsp"); // 이동할 페이지의 이름
		modelAndView.addObject("fee", fee); // 데이터 저장
		modelAndView.addObject("list", list); // 데이터 저장
		modelAndView.addObject("memId", id);
		modelAndView.addObject("cnt", list.size()); // 장바구니에 물건이 없으면 0, 물건이 1개면 1, 물건이 n개면 n

		return modelAndView; // 장바구니 목록으로 이동
	}

	@RequestMapping(value = "/market/cart_cnt_change.do")
	public ModelAndView market_change(HttpServletRequest request, ModelAndView modelAndView) {
		HttpSession session = request.getSession();
		MarketDTO marketDTO = new MarketDTO();
		String id = (String) session.getAttribute("memId");

		int cart_no = Integer.parseInt(request.getParameter("cart_no"));
		int cart_cnt = Integer.parseInt(request.getParameter("cart_cnt"));

		MenuDTO menuDTO = menuservice.menuView(cart_no); // stock_num물품 정보 dto담기 완료
		int price = menuDTO.getPrice(); // 해당메뉴의 가격
		MemberDTO memberDTO = memberService.memberView(id); // id를 사용하여 member정보 가져오기

		marketDTO.setStock_num(cart_no);
		marketDTO.setAmount(cart_cnt);
		marketDTO.setId(id);
		marketDTO.setName(memberDTO.getName());
		marketDTO.setMenu_name(menuDTO.getMenu_name());
		marketDTO.setPrice(price);
		marketDTO.setMoney(price * cart_cnt);
		marketDTO.setImage(menuDTO.getImage());
		marketDTO.setInfo(menuDTO.getInfo());

		int result = marketService.update(marketDTO);

		System.out.println("result : " + result);

		List<MarketDTO> list = marketService.listMarket(id);// 회원id로 가져와서 list에 넣기

		int fee = 3000; // 배송비는 3000원으로 일단 고정!

		modelAndView.setViewName("market.jsp"); // 이동할 페이지의 이름
		modelAndView.addObject("fee", fee); // 데이터 저장
		modelAndView.addObject("list", list); // 데이터 저장
		modelAndView.addObject("memId", id);
		modelAndView.addObject("cnt", list.size()); // 장바구니에 물건이 없으면 0, 물건이 1개면 1, 물건이 n개면
													// nmodelAndView.setViewName("market.jsp"); // 이동할 페이지의 이름

		return modelAndView; // 장바구니 목록으로 이동
	}

	@RequestMapping(value = "/market/market_buy.do") // HandlerMapping 클래스 실행
	public ModelAndView market_buy(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelAndView modelAndView) {
		// 데이터
		String id = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.memberView(id);
		String arrvalue = (String) request.getParameter("array");
		String total_cost = (String) request.getParameter("total_aaa");
		String[] arr_stock_num = arrvalue.split(",");

		int stock_num = 0;
		MarketDTO marketDTO = null;
		Map< Object, Object> marketMap = new HashMap<>();

		for (int j = 0; j < arr_stock_num.length; j++) {
			String aaa = arr_stock_num[j];
			stock_num = Integer.parseInt(aaa);
			marketDTO = marketService.marketView(id, stock_num);
			marketMap.put(j, marketDTO);
		}

		modelAndView.addObject("id", id);
		modelAndView.addObject("marketMap", marketMap);
		modelAndView.addObject("total_cost", total_cost);
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("length", arr_stock_num.length);
		modelAndView.addObject("fee", 3000);

		modelAndView.setViewName("../checkout/buy_page.jsp");

		return modelAndView;

	}

	@RequestMapping(value = "/market/market_delete.do") // HandlerMapping 클래스 실행
	public ModelAndView market_delete(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// 데이터
		String arrvalue = (String) request.getParameter("array");
		String[] arr_stock_num = arrvalue.split(",");
		
		int stock_num = 0;
		int result = 0;
		Map< Object, Object> marketMap = new HashMap<>();

		String id = (String) session.getAttribute("memId");

		for (int j = 0; j < arr_stock_num.length; j++) {
			String aaa = arr_stock_num[j];
			stock_num = Integer.parseInt(aaa);
			result = marketService.delete(stock_num, id);
			if (result == 0) {
				result=0;
				break;
			}
			result = 1;
		}

		// 화면 네비게이션 : 데이터 공유 + view 처리 파일 선택
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);

		modelAndView.setViewName("marketDeleteOk.jsp");
		return modelAndView;
	}

	@RequestMapping("/market/insert.do") // 세부적인 url mapping
	public ModelAndView insert(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		String sep = request.getParameter("sep");
		int stock_num = Integer.parseInt(request.getParameter("stock_num"));

		int result = marketService.countMarket(id, stock_num);

		if (id == null) {
			// 로그인하지 않은 상태이면 로그인 화면으로 이동
			modelAndView.setViewName("redirect:/member/loginForm.jsp");
			return modelAndView;
		}

		if (result == 0) {
			int amount = Integer.parseInt(request.getParameter("cart_cnt")); // 선택수량

			MenuDTO menuDTO = menuservice.menuView(stock_num); // stock_num물품 정보 dto담기 완료
			int price = menuDTO.getPrice(); // 해당메뉴의 가격

			MemberDTO memberDTO = memberService.memberView(id); // id를 사용하여 member정보 가져오기

			MarketDTO marketDTO = new MarketDTO();

			marketDTO.setId(id);
			marketDTO.setName(memberDTO.getName());
			marketDTO.setStock_num(stock_num);
			marketDTO.setMenu_name(menuDTO.getMenu_name());
			marketDTO.setPrice(price);
			marketDTO.setAmount(amount);
			marketDTO.setMoney(price * amount);
			marketDTO.setImage(menuDTO.getImage());
			marketDTO.setInfo(menuDTO.getInfo());

			marketService.insert(marketDTO); // 장바구니 테이블에 저장됨

			List<MarketDTO> list = marketService.listMarket(id);// 회원id로 가져와서 list에 넣기

			int fee = 3000; // 배송비는 3000원으로 일단 고정!

			modelAndView.setViewName("marketOk.jsp"); // 이동할 페이지의 이름
			modelAndView.addObject("stock_num", stock_num); // 데이터 저장
			modelAndView.addObject("sep", sep); // 데이터 저장
			modelAndView.addObject("result", result); // 데이터 저장
		} else if (result == 1) {
			modelAndView.setViewName("marketOk.jsp");
			modelAndView.addObject("stock_num", stock_num);
			modelAndView.addObject("sep", sep);
			modelAndView.addObject("result", result);
		}

		return modelAndView; // 장바구니 목록으로 이동
	}
}
