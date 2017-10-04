package pizza.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pizza.service.BasketDTO;
import pizza.service.DoughDTO;
import pizza.service.PNutrientDTO;
import pizza.service.PizzaDTO;
import pizza.service.PizzaMenuList;
import pizza.service.SNutrientDTO;
import pizza.service.SideMenuList;
import pizza.service.impl.ServiceImpl;
import pizza.service.impl.UserDto;

@Controller
public class MenuList {
	
	@Resource(name="service")
	private ServiceImpl service;
	
/*	@RequestMapping("/test.pz")
	public String test() throws Exception{
		
		Map map = new HashMap();
		map.put("id", "test");
		service.test(map);
		return "/Pizza/view/Mainpage.jsp";
	}*/
	
	@RequestMapping("/Pizza/MainPage.pz")
	public String main(Map map,HttpSession session, HttpServletRequest req) throws Exception{
		
		System.out.println(req.getServletContext().getRealPath("/Pizza/Image"));
		map.put("src", req.getServletContext().getRealPath("/Pizza/Image"));
		
		service.setsrc(map);
		
		if(session.getAttribute("ID")!=null) {
			UserDto dto= new UserDto();
			String id =session.getAttribute("ID").toString();
			map.put("id", id);
			dto = service.callUser(map);
			map.put("dto", dto);
		}
			
		
		
		return "/WEB-INF/Pizza/view/Mainpage.jsp";
	}
	
	@RequestMapping("/BestList.pz")
	public String BestList(Model model, HttpServletRequest req) throws Exception{
		String sel = " P_NAME,P_SPRICE,P_LPRICE,P_IMG,P.P_NO,P.P_HIMG ";
		Map map = new HashMap<>();
		map.put("sel", sel);
		
		
		List<PizzaMenuList> list = new Vector<>();
		if(req.getParameter("kind").trim().equals("1")) {
			list = service.menuRank(map);
			model.addAttribute("bimg", "BestMenu.png");
			req.setAttribute("kind", "1");
		}
		else if(req.getParameter("kind").trim().equals("2")) {
			list = service.likeRank(map);
			req.setAttribute("kind", "2");
			model.addAttribute("bimg", "BestLike.png");
		}
		else {
			map.put("id", req.getSession().getAttribute("ID"));
			list = service.mybest(map);
			req.setAttribute("kind", "3");
			model.addAttribute("bimg", "BestLike.png");
		}
		
		for(PizzaMenuList pl : list) {
			if(pl.getD_price()!=null) {
			pl.setP_lprice((Integer.parseInt(pl.getP_lprice())+Integer.parseInt(pl.getD_price()))+"");
			pl.setP_sprice((Integer.parseInt(pl.getP_sprice())+Integer.parseInt(pl.getD_price()))+"");
			}
			sel = " P_NAME,P_SPRICE,P_LPRICE,P_IMG,P.P_NO,P.P_HIMG ";
			map.put("sel", sel);
			List<PizzaMenuList> plist = service.menuRank(map);
			
			for(PizzaMenuList best : plist) {
				if(best.getP_no().equals(pl.getP_no())) {
					pl.setBest("1");
				}
			}
			
			plist = service.likeRank(map);
			for(PizzaMenuList best : plist) {
				if(best.getP_no().equals(pl.getP_no())) {
					pl.setLike("1");
				}
			}
			
			plist = service.newPizza(map);
			for(PizzaMenuList best : plist) {
				if(best.getP_no().equals(pl.getP_no())) {
					pl.setNewpizza("1");
					
				}
			}
			
			
		}
		
		model.addAttribute("dto",list);
		return "/WEB-INF/Pizza/view/Menu/Pizza_Best.jsp";
	}
	
	
	@RequestMapping("/menuList.pz")
	public String menuList(Model model, HttpServletRequest req) throws Exception{
		int ty=0;
		
		if(req.getParameter("ty")!=null) {
			req.setAttribute("code", req.getParameter("ty"));
		ty = Integer.parseInt(req.getParameter("ty"));
		System.out.println(ty);
		}
		System.out.println(ty);
		System.out.println(req.getServletContext().getRealPath("/Mypizza"));
		String sel="";
		String fro = "";
		String whe = "";
		req.setAttribute("pages", ty);
		if(ty==101) {
			sel = " P_NAME,P_SPRICE,P_LPRICE,P_IMG,P.P_NO,D_PRICE ";
			fro = " pizza p join pizza_dough pd on p.p_no = pd.p_no join dough d on d.dough_no = pd.dough_no ";
			whe = " d.dough_no=4 AND P_KIND != '마이키친' AND P_KIND != '하프앤하프' ";
			req.setAttribute("lin", "곡물도우");
			req.setAttribute("gok", 1);
			req.setAttribute("bimg", "곡물베너.png");
		}
		else if(ty==102) {
			req.setAttribute("lin", "프리미엄");
			sel = " P_NAME,P_SPRICE,P_LPRICE,P_IMG,P.P_NO ";
			fro = " PIZZA P ";
			whe = " p_kind = '프리미엄' ";
			req.setAttribute("bimg", "프리미엄베너.png");
		}else if(ty==103) {
			req.setAttribute("lin", "글래식");
			sel = " P_NAME,P_SPRICE,P_LPRICE,P_IMG,P.P_NO ";
			fro = " PIZZA P ";
			whe = " p_kind = '클래식' ";
			req.setAttribute("bimg", "클래식베너.png");
		}else if(ty==104) {
			req.setAttribute("lin", "104");
			sel = " S_NAME,S_PRICE,S_IMG,S_NO ";
			fro = " SIDE S ";
			req.setAttribute("bimg", "사이드베너.png");
		}else if(ty==100)
		{
			req.setAttribute("lin", "NEW");
			sel = " P_NAME,P_SPRICE,P_LPRICE,P_IMG,P.P_NO ";
			fro = " PIZZA P ";
			whe += " p_no in (select p_no from pizzadate where pd_date > sysdate-31 ) ";
			req.setAttribute("bimg", "프리미엄베너.png");
		}
		Map map = new HashMap();
		String a = "1";
		map.put("P_LIST", "1");
		map.put("sel", sel);
		map.put("whe", whe);
		map.put("fro", fro);
		map.put("ty",ty);
		System.out.println("dao 전");
		if(ty!=104) {
		List<PizzaMenuList> list = service.menuList(map);
		
		//// 
		for(PizzaMenuList pl : list) {
			if(pl.getD_price()!=null) {
			pl.setP_lprice((Integer.parseInt(pl.getP_lprice())+Integer.parseInt(pl.getD_price()))+"");
			pl.setP_sprice((Integer.parseInt(pl.getP_sprice())+Integer.parseInt(pl.getD_price()))+"");
			}
			sel = " P_NAME,P_SPRICE,P_LPRICE,P_IMG,P.P_NO,P.P_HIMG ";
			map.put("sel", sel);
			
			//많이팔린 메뉴
			List<PizzaMenuList> plist = service.menuRank(map);
			for(PizzaMenuList best : plist) {
				if(best.getP_no().equals(pl.getP_no())) {
					pl.setBest("1");
				}
			}
			
			//좋아요 많이받은 메뉴
			plist = service.likeRank(map);
			for(PizzaMenuList best : plist) {
				if(best.getP_no().equals(pl.getP_no())) {
					pl.setLike("1");
				}
			}
			
			//1달 동안 나온 신메뉴
			plist = service.newPizza(map);
			for(PizzaMenuList best : plist) {
				if(best.getP_no().equals(pl.getP_no())) {
					pl.setNewpizza("1");
				}
			}
			
		}
			model.addAttribute("dto",list);
			System.out.println("사이즈 : "+list.size());
		}
		else {
			List<SideMenuList> list = service.menuList(map);
			model.addAttribute("dto",list);
		}
		String ret = "";
		
		
		if(ty==104)
		ret = "/WEB-INF/Pizza/view/Menu/Side_Menu.jsp";
		else
		ret= "/WEB-INF/Pizza/view/Menu/Pizza_Menu.jsp";
		
		return ret;
	}
	

	
	
	@RequestMapping("/PizzaView.pz")
	public String PizzaView(@RequestParam Map map, Model model, HttpServletRequest req) throws Exception{
		if(!(req.getParameter("gok").length()>0))
		req.setAttribute("listval", 1);
		else
			req.setAttribute("listval", 4);
		
		PizzaDTO dto = service.pizzaview(map);
		String sel = " P.P_NO ";
		map.put("sel", sel);
		List<PizzaMenuList> listdto = service.menuRank(map);
		
		for(PizzaMenuList mdto : listdto) {
			if(dto.getP_no().equals(mdto.getP_no()))
				req.setAttribute("best", "1");
		}
		
		listdto = service.likeRank(map);
		for(PizzaMenuList mdto : listdto) {
			if(dto.getP_no().equals(mdto.getP_no()))
				req.setAttribute("like", "1");
		}
		
		listdto = service.newPizza(map);
		for(PizzaMenuList mdto : listdto) {
			if(dto.getP_no().equals(mdto.getP_no()))
				req.setAttribute("newpizza", "1");
		}
		
		
		
		List<DoughDTO> list = new Vector<DoughDTO>();
		List<PNutrientDTO> listpn = new Vector<PNutrientDTO>();
		
		listpn = service.pnutrient(map);
		
		list = service.doughlist(map);
		
		map.put("id", req.getSession().getAttribute("ID"));
		int as=0;
		
		if(req.getSession().getAttribute("ID")!=null)
			as = service.pizzalikeSel(map);
		if(as>0)
			model.addAttribute("like","1");
		
		model.addAttribute("listpn",listpn);
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
		return "/WEB-INF/Pizza/view/Menu/PizaaView.jsp";
		
	}
	
	

	@RequestMapping("/SideView.pz")
	public String SideView(@RequestParam Map map, Model model, HttpServletRequest req) throws Exception{
		SideMenuList dto = new SideMenuList();
		SNutrientDTO sndto = new SNutrientDTO();
		System.out.println("뭡니까?");
		dto = service.Sideview(map);
		System.out.println(dto.getS_name());
		sndto = service.snprint(map);
		req.setAttribute("dto",dto);
		req.setAttribute("sndto",sndto);
		
		return "/WEB-INF/Pizza/view/Menu/SideView.jsp";
		
	}
	
	
	@RequestMapping("/Basket.pz")
	public String Basket(@RequestParam Map map, HttpServletRequest req , HttpSession session) throws Exception{
		return "/WEB-INF/Pizza/view/Menu/Basket.jsp";
	}
	
	
	
	
	
	@RequestMapping("Project.pz")
	public String Project(@RequestParam Map map,HttpServletRequest req , HttpSession session)  throws Exception {

		List<BasketDTO> list = (List<BasketDTO>)session.getAttribute("BUYLIST");
		int i = 0;
		int k = 0;
		String id=session.getAttribute("ID").toString();
		
		Map maps= new HashMap<>();
		maps.put("id", id);
		maps.put("st_no", session.getAttribute("ST_NO").toString());
		maps.put("sa_addr", session.getAttribute("DE_ADDR").toString());
		i = service.sinsert(maps);
		for(BasketDTO dto : list ) {
			System.out.println("??");
	
			String price="";
			char[] pri = dto.getPrice().toCharArray();
			for(char cha : pri) {
				if(cha >= '0' && cha <= '9')
					price+=cha;
			}
			dto.setPrice(price);
			System.out.println(price);
			System.out.println(dto.getDoughno());
			
			
			// 5 - 2 - 4  직화스테이크 곡물도우

			System.out.println(dto.getQty());
			System.out.println("ASD");
			System.out.println("kind="+dto.getKind());
			System.out.println("");
			System.out.println("dougno="+dto.getDoughno());
			
			if(i==1) {
				k = service.stinsert(dto);
			}
			System.out.println("ASDasdasd");
		}
		if(k==1) {
			session.removeAttribute("BUYLIST");
			session.removeAttribute("BUYNUM");
		}
		
		req.setAttribute("SUC_FAIL", k);
		req.setAttribute("WHERE", "BF");
		return "/WEB-INF/Pizza/view/Addr/Message.jsp";
		
	}
	
	
}
