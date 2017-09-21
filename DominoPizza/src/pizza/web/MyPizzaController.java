package pizza.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pizza.service.DoughDTO;
import pizza.service.MyPizzaDTO;
import pizza.service.PNutrientDTO;
import pizza.service.PizzaSauceDTO;
import pizza.service.SideDish_BeverageDTO;
import pizza.service.SideDish_PickleDTO;
import pizza.service.SideDish_SauceDTO;
import pizza.service.ToppingDTO;
import pizza.service.impl.DoughServiceImpl;
import pizza.service.impl.MyPizzaServiceImpl;
import pizza.service.impl.PizzaSauceServiceImpl;
import pizza.service.impl.SideDish_BeverageServiceImpl;
import pizza.service.impl.SideDish_PickleServiceImpl;
import pizza.service.impl.SideDish_SauceServiceImpl;
import pizza.service.impl.ToppingServiceImpl;


@Controller
public class MyPizzaController {
	@Resource(name="myPizzaService")
	private MyPizzaServiceImpl pizzaService;
	@Resource(name="toppingService")
	private ToppingServiceImpl toppService;
	@Resource(name="sideDish_BeverageService")
	private SideDish_BeverageServiceImpl sdds_Bvrg;
	@Resource(name="sideDish_PickleService")
	private SideDish_PickleServiceImpl sdds_Pickle;
	@Resource(name="sideDish_SauceService")
	private SideDish_SauceServiceImpl sdds_Sauce;
	@Resource(name="doughService")
	private DoughServiceImpl douService;
	@Resource(name="pizzaSauceService")
	private PizzaSauceServiceImpl pizzaSauceService;
	
	//사이드 디쉬-음료페이지
	@RequestMapping("/Pizza/Menu/sidedish_beverage.pz")
	public String sidedish_beverage(Map map) throws Exception{
		List<SideDish_BeverageDTO> list = sdds_Bvrg.selectList();
		map.put("bvrg", list);
		return "/WEB-INF/Pizza/view/Menu/list_siddsh_bvrg.jsp";
	}
	
	//사이드 디쉬-피클&소스페이지
	@RequestMapping("/Pizza/Menu/sidedish_pickleNSouce.pz")
	public String sidedish_pickleNSouce(Map map) throws Exception{
		List<SideDish_PickleDTO> pickleList = sdds_Pickle.selectList();
		List<SideDish_SauceDTO> sauceList = sdds_Sauce.selectList();
		map.put("pickle", pickleList);
		map.put("sauce", sauceList);
		return "/WEB-INF/Pizza/view/Menu/list_siddsh_picNsce.jsp";
	}
	
	//하프앤하프 메뉴 - 첫번째 피자 리스트&피자 도우  출력용
	@RequestMapping("/Pizza/BuyPizza/hnh.pz")
	public String halfNHalf(Map map) throws Exception{
		List<MyPizzaDTO> list = pizzaService.selectList();
		List<MyPizzaDTO> pizzaList = new Vector();
		for(MyPizzaDTO dto : list) {
			if(!dto.getP_kind().equals("마이키친") && !dto.getP_kind().equals("하프앤하프")) {
				MyPizzaDTO dto2=new MyPizzaDTO();
				dto2.setP_name(dto.getP_name());
				pizzaList.add(dto2);
			}
		}
		map.put("firstPizzaList", pizzaList);
		return "/WEB-INF/Pizza/view/BuyPizza/hnh.jsp";
	}
	
	//하프앤하프 메뉴 - 첫번째 피자 선택에 따른 두번째 피자 리스트 출력용
	@ResponseBody
	@RequestMapping(value="/Pizza/BuyPizza/hnhSecondPizza.pz", produces="text/html; charset=UTF-8")
	public String halfNHalfSecondPizza(@RequestParam Map map, Model model) throws Exception{
		List<MyPizzaDTO> SecondPizzaList=null;
		if(map.get("choiceFstPizza").toString() != null || map.get("choiceFstPizza").toString() != "") {
			MyPizzaDTO dto = new MyPizzaDTO();
			dto.setP_name(map.get("choiceFstPizza").toString());
			SecondPizzaList = pizzaService.selectSecondPizzaList(dto);
		}
		List<Map> list = new Vector<Map>();
		Map secondmap =null;
		for(MyPizzaDTO dto1 : SecondPizzaList) {
			secondmap = new HashMap();
			secondmap.put( "p_name", dto1.getP_name());
			list.add(secondmap);
		}
		return JSONArray.toJSONString(list);
	}	
	
	//하프앤하프 메뉴 - 피자 도우 리스트 출력용
	@ResponseBody
	@RequestMapping(value="/Pizza/BuyPizza/dough.pz", produces="text/html; charset=UTF-8")
	public String dough() throws Exception{
		List<DoughDTO> Doughlist = douService.selectList();
		List<Map> list = new Vector<Map>();
		Map map =null;
		for(DoughDTO dto : Doughlist) {
			map = new HashMap();
			map.put( "Dough_name", dto.getDough_name());
			list.add(map);
		}
		return JSONArray.toJSONString(list);
	}
	
	//하프앤하프 메뉴 - 피자 2개, 도우, 사이즈 선택에 따른 가격 출력용
	@ResponseBody
	@RequestMapping(value="/Pizza/BuyPizza/pizzaPrice.pz", produces="text/html; charset=UTF-8")
	public String pizzaPrice(@RequestParam Map map) throws Exception{
		Map choicemap = new HashMap<>();
		choicemap.put("fstPizza", map.get("fstPizza"));
		choicemap.put("scdPizza", map.get("scdPizza"));
		choicemap.put("dough", map.get("dough"));
		choicemap.put("price", map.get("size").equals("M") ? "P_SPRICE" : "P_LPRICE" );
		return pizzaService.hnhAddPriceSelectOne(choicemap);
	}
	
	//하프앤하프 & 마이키친 메뉴 - pauseCheck
	@ResponseBody
	@RequestMapping(value="/Pizza/BuyPizza/choice.pz", produces="text/html; charset=UTF-8")
	public String pauseCheck(@RequestParam Map map) throws Exception{
		//System.out.println("하프앤하프 페이지 선택 : "+map.get("goods_code"));
		//System.out.println("마이키친 페이지 선택 : "+map.get("goods_code")+" / "+map.get("topping"));
		return "success";
	}	
	
	//하프앤하프 & 마이키친 메뉴 - 토핑 리스트(토핑 추가하기) 출력용
	@RequestMapping(value= {"/Pizza/BuyPizza/toppingLayer.pz","/Pizza/BuyPizza/mykitchen_mkToppingLayer.pz"}, produces="text/html; charset=UTF-8")
	public String toppingList(@RequestParam String where, Map map) throws Exception{
		List<ToppingDTO> kindList = toppService.selectToppingKindList();
		Map deliverymap = new HashMap();
		ToppingDTO dto4;
		List saveList = new Vector();
		for(ToppingDTO dto1 : kindList) {
			deliverymap.put("toppingKind", dto1.getT_kind());
			List<ToppingDTO> nameList = toppService.selectToppingNameList(deliverymap);
			for(ToppingDTO dto2 : nameList) {
				deliverymap.put("toppingName", dto2.getT_name());
				List<ToppingDTO> toppingList = toppService.selectAddToppingList(deliverymap);
				dto4 = new ToppingDTO();
				for(ToppingDTO dto3 : toppingList) {
					switch(dto3.getT_size()) {
					case "S": dto4.setT_Ssize(dto3.getT_size()); dto4.setT_Sprice(dto3.getT_price());
						break;
					case "M": dto4.setT_Msize(dto3.getT_size()); dto4.setT_Mprice(dto3.getT_price());
						break;
					default : dto4.setT_Lsize(dto3.getT_size()); dto4.setT_Lprice(dto3.getT_price());
						dto4.setT_kind(dto3.getT_kind()); dto4.setT_name(dto3.getT_name()); dto4.setT_img(dto3.getT_img()); dto4.setTs_no(dto3.getTs_no());
					}
				}
				saveList.add(dto4);
			}
			map.put("list", saveList);
		}
		if(where.equals("mk")) return "/WEB-INF/Pizza/view/BuyPizza/mkToppingLayer.jsp";
		else return "/WEB-INF/Pizza/view/BuyPizza/toppingLayer.jsp";
	}	
	
	//하프앤하프 & 마이키친 메뉴 - 토핑 알레르기 유발성분 표 출력용
	@RequestMapping(value="/Pizza/BuyPizza/toppingAllergic.pz", produces="text/html; charset=UTF-8")
	public String toppingAllergicList(Map map) throws Exception{
		List<ToppingDTO> toppingList = toppService.selectToppingallergyList();
		map.put("toppingList", toppingList);
		return "/WEB-INF/Pizza/view/BuyPizza/toppingAllergic.jsp";
	}		
	
	//하프앤하프 & 마이키친 메뉴 - 토핑 정량 확인하기 표 출력용
	@RequestMapping(value="/Pizza/BuyPizza/mkToppingQuantity.pz", produces="text/html; charset=UTF-8")
	public String mkToppingQuantityList(Map map) throws Exception{
		List<ToppingDTO> toppingList = toppService.selectAddToppingList(null);
		map.put("toppingList", toppingList);
		return "/WEB-INF/Pizza/view/BuyPizza/mkToppingQuantity.jsp";
	}		

	//마이키친 메뉴 - 사용자가 선택한 값 받아오기용
	@ResponseBody
	@RequestMapping(value="/Pizza/BuyPizza/mkChoiceVal.pz", produces="text/html; charset=UTF-8")
	public String mkChoiceVal(@RequestParam Map map, Model model) throws Exception{

		//System.out.println("<mkChoiceVal>doughName : " + map.get("doughName"));
		//System.out.println("<mkChoiceVal>size : " + map.get("size"));
		//System.out.println("<mkChoiceVal>sauce : " + map.get("sauce"));
		
		return "아무거나~~";
	}	
	
	
	//하프앤하프&마이키친페이지에서 장바구니 담기
	@RequestMapping("/Pizza/BuyPizza/addCart.pz")
	public String addCart(HttpSession session, Map map) throws Exception{
		if(session.getAttribute("id") == null || session.getAttribute("id") == ""){
			return "/WEB-INF/Pizza/view/BuyPizza/login.jsp";
		}
		
		return "/WEB-INF/Pizza/view/BuyPizza/basket.jsp";
	}	
	
	//마이키친 메뉴 - 마이키친 기본 피자 가격, 도우, 소스 출력용
	@RequestMapping("/Pizza/BuyPizza/mykitchen.pz")
	public String myKitchen(Map map) throws Exception{
		List<MyPizzaDTO> list = pizzaService.selectList();
		List<MyPizzaDTO> myPizzaPriceList = new Vector();
		for(MyPizzaDTO dto : list) {
			if(dto.getP_kind().equals("마이키친")) {
				map.put("Mprice", dto.getP_sprice());
				map.put("Lprice", dto.getP_lprice());
			}
		}
		List<DoughDTO> Doughlist = douService.selectList();
		map.put( "doughList", Doughlist);
		List<PizzaSauceDTO> Saucelist = pizzaSauceService.selectList();
		map.put( "sauceList", Saucelist);
		return "/WEB-INF/Pizza/view/BuyPizza/mykitchen.jsp";
	}
	
	//마이키친 영양성분 표
	@RequestMapping("/Pizza/BuyPizza/mkIngredient.pz")
	public String mykitchen_mkIngredient(Map map) throws Exception{
		List<ToppingDTO> toppNutrlist = toppService.selectToppingNutrientList();
		map.put("toppingNutrientList", toppNutrlist);
		List<PNutrientDTO> pizzNutrlist = pizzaService.PizzaNutrientSelectList();
		map.put("pizzaNutrientList", pizzNutrlist);
		return "/WEB-INF/Pizza/view/BuyPizza/mkIngredient.jsp";
	}
	
	//추가토핑안내 메뉴
	@RequestMapping("/Pizza/BuyPizza/topping.pz")
	public String addTopping(Map map1) throws Exception{
		//토핑 리스트 출력용]
		List<ToppingDTO> list = toppService.selectList();
		List list1 = new Vector();
		String name = "";
		Map map = null;
		for(ToppingDTO dto: list){
			if( !name.equals(dto.getT_name().toString())){ //t_name에 값이 있다면
				map = new HashMap();
				map.put("t_name",dto.getT_name());
				map.put(dto.getT_size()+"Price",dto.getT_price());
				map.put(dto.getT_size()+"Gram",dto.getT_gram());
				name = dto.getT_name();
				list1.add(map);
			}else{
				map.put(dto.getT_size()+"Price",dto.getT_price());
				map.put(dto.getT_size()+"Gram",dto.getT_gram());
				name = dto.getT_name();
			}
		}
		map1.put("toppingList", list1);
		return "/WEB-INF/Pizza/view/BuyPizza/topping.jsp";
	}
	
	//기프트콘
	@RequestMapping("/Pizza/BuyPizza/ecoupon.pz")
	public String ecoupon() throws Exception{
		
		
		return "/WEB-INF/Pizza/view/BuyPizza/ecoupon.jsp";
	}	
	
	
	
	
	
	
}