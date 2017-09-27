package pizza.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javafx.geometry.Side;
import pizza.service.BasketDTO;
import pizza.service.DelAddrDTO;
import pizza.service.DoughDTO;
import pizza.service.DrPnsDTO;
import pizza.service.PNutrientDTO;
import pizza.service.PizzaDTO;
import pizza.service.PizzaMenuList;
import pizza.service.SMenuDTO;
import pizza.service.SaileCouponDTO;
import pizza.service.StoresDTO;
import pizza.service.ToppingDTO;
import pizza.service.impl.Daotest;
import pizza.service.impl.ServiceImpl;
import pizza.service.impl.UserDto;

@Controller
public class Order {
   @Resource(name="service")
   private ServiceImpl service;
   
   @RequestMapping("/AddrSelect.pz")
   public String AddrSelect(@RequestParam Map map, Model model,HttpServletRequest req , HttpSession session) throws Exception{
	  
      String id = session.getAttribute("ID").toString();
      map.put("id", id);
      String url="";
      //System.out.println(map.get("pzz")+" - "+map.get("qt")+" - "+map.get("pzPrc")+" - "+map.get("tp"));

      if(session.getAttribute("DE_NO")!=null && req.getParameter("reset")==null) {
         System.out.println("매장선택 되어 있을경우 장바구니에 저장");
         //매장선택 되어 있을경우 장바구니에 저장
         BasketDTO dto = new BasketDTO();
         dto.setNo(map.get("no").toString());
         if(map.get("dough")!=null) {
        	 //피자류는 p_no 대신 d_no를 sal테이블에 저장
        	 dto.setDough(map.get("dough").toString());
        	 String d_no = service.getd_no(map);
        	 if(d_no!=null&&d_no.trim().length()>0)
        	 dto.setNo(d_no);
         }
         if(map.get("img")!=null) dto.setImg(map.get("img").toString());
         if(map.get("na")!=null) dto.setName(map.get("na").toString());
         String price="";
         char[] pri = map.get("price").toString().toCharArray();
         for(char cha : pri) {
            if(cha >= '0' && cha <= '9')
               price+=cha;
         }
         System.out.println(price);
         dto.setPrice(price);
         int totprice = 0;
         if(session.getAttribute("TOTALPRICE")!=null)
            totprice = Integer.parseInt(session.getAttribute("TOTALPRICE").toString());
         dto.setQty(map.get("qty").toString());
         
         if(map.get("size")!=null&&map.get("size").toString().trim().length()>0)
            dto.setSize(map.get("size").toString().toUpperCase().contains("L")?"L":"M");
         else dto.setSize("");
         System.out.println("size2: "+dto.getSize());

         if(map.get("mkSauce")!=null&&map.get("mkSauce").toString().trim().length()>0) {
        	 dto.setMkSauce(map.get("mkSauce").toString());
         }
         if(map.get("topping")!=null&&map.get("topping").toString().trim().length()>0) {
            String toppings[] = map.get("topping").toString().split(",");
            //String toppings[] = req.getParameterValues("topping");
            List<ToppingDTO> tlist = new Vector<ToppingDTO>();
            for(String top : toppings) {
                System.out.println(top);
                ToppingDTO tdto = new ToppingDTO();
                map.put("ts_no", top);
                tdto=service.callTopping(map);
                System.out.println(tdto.getT_name());
                tlist.add(tdto);
            }

            dto.setToppingList(tlist);
         }
         if(map.get("kind")!=null) dto.setKind(map.get("kind").toString());
         List<BasketDTO> list = new Vector<>();
         
         if(session.getAttribute("BUYLIST")!=null)
            list = (List<BasketDTO>)session.getAttribute("BUYLIST");
         
         list.add(dto);
         req.setAttribute("list", list);
         session.setAttribute("BUYLIST", list);
         session.setAttribute("BUYNUM", list.size());
         totprice += Integer.parseInt(price);
         session.setAttribute("TOTALPRICE", totprice);
         req.setAttribute("SUC_FAIL", 1);
         req.setAttribute("WHERE", "SID");

         url= "/WEB-INF/Pizza/view/Addr/Message.jsp";

      }
      else {/// 매장 선택 안 되었을경우 매장선택으로
         if(req.getParameter("reset")!=null)
         {
            System.out.println("매장 선택 안 되었을경우 매장선택으로");
            session.setAttribute("BUYLIST", null);   
            session.setAttribute("BUYNUM", null);   
            session.setAttribute("DE_ADDR",null);
            session.setAttribute("ST_NO", null);
            session.setAttribute("ST_NAME", null);
            session.setAttribute("ST_TEL", null);
            session.setAttribute("DE_NO", null);
            session.setAttribute("TOTALPRICE", null);
         }
         List<StoresDTO> list = new Vector<StoresDTO>();
         list = service.deladdrprint(map);
         System.out.println("1");
         model.addAttribute("list",list);
         //      url = "/WEB-INF/Pizza/view/Addr/AddrSelect.jsp";
         url= "/WEB-INF/Pizza/view/Addr/Message.jsp";
         req.setAttribute("SUC_FAIL", "9");
         System.out.println("url : "+url+" / "+req.getAttribute("SUC_FAIL"));
      }

      return url;

   }
   
   @RequestMapping("/AddrCh.pz")
   public String AddrCh(@RequestParam Map map,HttpServletRequest req ,HttpSession session,Model model) throws Exception{
      String id = session.getAttribute("ID").toString();
      map.put("id", id);
      String url="";
      if(req.getParameter("reset")!=null)
      {
      session.setAttribute("BUYLIST", null);   
      session.setAttribute("BUYNUM", null);   
      session.setAttribute("DE_ADDR",null);
      session.setAttribute("ST_NO", null);
      session.setAttribute("ST_NAME", null);
      session.setAttribute("ST_TEL", null);
      session.setAttribute("DE_NO", null);
      }
      
   List<StoresDTO> list = new Vector<StoresDTO>();
   list = service.deladdrprint(map);
   System.out.println("2");
   model.addAttribute("list",list);
      
      return  "/WEB-INF/Pizza/view/Addr/AddrSelect.jsp";
   }
   
   
   //음료 피클 장바구니에 저장
   @RequestMapping("/DrinkPncBuy.pz")
   public String DrinkPncBuy(@RequestParam Map map, Model model,HttpServletRequest req , HttpSession session) throws Exception{
      String url = "";
      if(session.getAttribute("ID")==null) {
         url="/User/Login.pz";
      }
      else {
      String id = session.getAttribute("ID").toString();
      map.put("id", id);
      String where="";
      String from="";
      String kind = req.getParameter("kind").toString();
      System.out.println(kind);
      System.out.println(kind.equals("4"));
      if(session.getAttribute("DE_NO")!=null && req.getParameter("reset")==null) {
         url = "/WEB-INF/Pizza/view/Addr/Message.jsp";
         if(kind.equals("3")) {
            //음료
            from = " DRINK ";
            where = " DR_NO = ";
         }
         else if(kind.equals("4")) {
            //피클
            from = " PICKLE ";
            where = " pc_no = ";
            System.out.println("들어는오냐??");
         }
         else if(kind.equals("5")) {
            //소스
            from = " sauce ";
            where = " sc_no =  ";
            
         }
         map.put("from", from);
         map.put("where", where);
         DrPnsDTO dto = service.getdpns(map);
         BasketDTO bdto = new BasketDTO();
         List<BasketDTO> list=new  Vector<>();
            if((List<BasketDTO>)session.getAttribute("BUYLIST") != null)
               list = (List<BasketDTO>)session.getAttribute("BUYLIST");
            bdto.setQty(Integer.parseInt(map.get("qty").toString())+"");
         if(kind.equals("3")) {
            //음료
            System.out.println("음료임!");
            bdto.setNo(dto.getDr_no());
            bdto.setName(dto.getD_name());
            bdto.setImg(dto.getD_img());
            bdto.setSize("");
            bdto.setKind(map.get("kind").toString());
            bdto.setPrice(Integer.parseInt(dto.getD_price())*Integer.parseInt(map.get("qty").toString())+"");
            req.setAttribute("SUC_URL", "/Pizza/Menu/sidedish_beverage.pz");
            
         }
         else if(kind.equals("4")) {
            //피클
            System.out.println("피클임!");
            bdto.setNo(dto.getPc_no());
            bdto.setName(dto.getPc_name());
            bdto.setImg(dto.getPc_img());
            bdto.setSize("");
            bdto.setKind(map.get("kind").toString());
            bdto.setPrice(Integer.parseInt(dto.getPc_price())*Integer.parseInt(map.get("qty").toString())+"");
            req.setAttribute("SUC_URL", "/Pizza/Menu/sidedish_pickleNSouce.pz");
         }
         else if(kind.equals("5")) {
            //소스
            System.out.println("소스임!");
            bdto.setNo(dto.getSc_no());
            bdto.setName(dto.getSc_name());
            bdto.setImg(dto.getSc_img());
            bdto.setSize("");
            bdto.setKind(map.get("kind").toString());
            bdto.setPrice(Integer.parseInt(dto.getSc_price())*Integer.parseInt(map.get("qty").toString())+"");
            req.setAttribute("SUC_URL", "/Pizza/Menu/sidedish_pickleNSouce.pz");
         }
            int totalpr=0;
            if(session.getAttribute("TOTALPRICE")!=null)
               totalpr = Integer.parseInt(session.getAttribute("TOTALPRICE").toString());
            totalpr+=Integer.parseInt(bdto.getPrice());
            session.setAttribute("TOTALPRICE", totalpr);
            list.add(bdto);
            int suc = 0;
            if(bdto.getNo()!=null&&bdto.getNo().length()>0)
               suc = 1;
            session.setAttribute("BUYLIST", list);
            session.setAttribute("BUYNUM", list.size());
            req.setAttribute("SUC_FAIL",suc);
            req.setAttribute("WHERE", "DPNS");
            System.out.println(bdto.getImg());
      }else {/// 매장 선택 안 되었을경우 매장선택으로
         if(req.getParameter("reset")!=null)
         {
         session.setAttribute("BUYLIST", null);   
         session.setAttribute("BUYNUM", null);   
         session.setAttribute("DE_ADDR",null);
         session.setAttribute("ST_NO", null);
         session.setAttribute("ST_NAME", null);
         session.setAttribute("ST_TEL", null);
         session.setAttribute("DE_NO", null);
         }
         
      url= "/WEB-INF/Pizza/view/Addr/Message.jsp";
      req.setAttribute("SUC_FAIL", "9");
      List<StoresDTO> list = new Vector<StoresDTO>();
      list = service.deladdrprint(map);
      System.out.println("3");
      model.addAttribute("list",list);
      }
      }
      return url;
   }
   

   @RequestMapping("/SelectAddrFrame.pz")
   public String AddrSelectFrame(@RequestParam Map map, Model model, HttpServletRequest req) throws Exception{
   
      
      return "/WEB-INF/Pizza/view/Addr/AddrSelectFrame.jsp";
      
   }

   @RequestMapping("/AddrIn.pz")
   public String AddrIn(@RequestParam Map map, Model model,HttpSession session ,HttpServletRequest req) throws Exception{
      String pos = map.get("ret").toString();
      String addr = map.get("addr").toString();
      String xposs=pos.replace(")", "").replace("(", "").split(",")[0].trim();
      String yposs=pos.replace(")", "").replace("(", "").split(",")[1].trim();
      String kind = "1";
      System.out.println("x:"+xposs+" y:"+yposs);
      float xpos = Float.parseFloat(xposs);
      float ypos = Float.parseFloat(yposs);
      System.out.println(xpos);
      System.out.println(ypos);
      StoresDTO dto = service.deladdrsel(map);
      System.out.println("4");
      int result = 0 ;
      model.addAttribute("WHERE","INS");
      if(dto!=null) {
      System.out.println(dto.getSt_name());
      System.out.println(dto.getSt());
      String id = session.getAttribute("ID").toString();
      map.put("id", id);
      map.put("st_no", dto.getSt_no());
      map.put("kind", kind);
      map.put("st_addr", dto.getSt_addr());
      result = service.deladdrin(map);
      }
      if(result==1) {
         System.out.println("입력성공");
         model.addAttribute("SUC_FAIL","1");
      }else {
         model.addAttribute("SUC_FAIL","0");
      }
      return "/WEB-INF/Pizza/view/Addr/Message.jsp";
   }
   
   
   //장바구니 삭제
   
   @RequestMapping("/sessionDelete.pz")
   public String sessionDelete(@RequestParam Map map,HttpServletRequest req, HttpSession session) {
      List<BasketDTO> list = (List<BasketDTO>)session.getAttribute("BUYLIST");
      int idx = Integer.parseInt(map.get("idx").toString());
      int a =Integer.parseInt(list.get(idx-1).getPrice());
      if(session.getAttribute("TOTALPRICE")!=null);
      session.setAttribute("TOTALPRICE",Integer.parseInt(session.getAttribute("TOTALPRICE").toString())-a);
      list.remove(idx-1);
      session.setAttribute("BUYLIST", list);
      session.setAttribute("BUYNUM", list.size()==0?null:list.size());
      return "/WEB-INF/Pizza/view/Menu/Basket.jsp";      
   }
   
   @RequestMapping("/SessionInDel.pz")
   public String sessionInDel(@RequestParam Map map,HttpServletRequest req, HttpSession session) {
      String de_no = map.get("de_no").toString();
      
      StoresDTO dto =  service.sessionInDel(map);
      
      session.setAttribute("DE_ADDR", dto.getDe_addr());
      session.setAttribute("ST_NO", dto.getSt_no());
      session.setAttribute("ST_NAME", dto.getSt_name());
      session.setAttribute("ST_TEL", dto.getSt_tel());
      
      int res=0;
      session.setAttribute("DE_NO", de_no);
      if(de_no!=null)
         res=2;
      req.setAttribute("SUC_FAIL", res);
      req.setAttribute("WHERE", "SID");
      return "/WEB-INF/Pizza/view/Addr/Message.jsp";
   }
   
   @RequestMapping("/GoBasket.pz")
   public String GoBasket(@RequestParam Map map,HttpServletRequest req, HttpSession session) {
      
      return "/WEB-INF/Pizza/view/Menu/Basket.jsp";
   }
   
   @RequestMapping("/CouponLay.pz")
   public String CallLay(@RequestParam Map map,HttpServletRequest req, HttpSession session) {
      String id = session.getAttribute("ID").toString();
      map.put("id", id);
      System.out.println(id);
      List<SaileCouponDTO> list = new Vector<SaileCouponDTO>();
      list = service.callcoupon(map);
      req.setAttribute("Slist", list);
      return "/WEB-INF/Pizza/view/Menu/CouponLay.jsp";
   }
   
   
   @RequestMapping("/LastOrder.pz")
   public String LastOrder(@RequestParam Map map,HttpServletRequest req, HttpSession session) {
      int len=0;
      List<BasketDTO> list = new Vector<BasketDTO>();
      System.out.println("@!#@!#$@!$!@$");
      if(map.get("lengths")!=null)
      len = Integer.parseInt(map.get("lengths").toString());
      System.out.println(len);
      int k=0;
      int totalPrice=0;
      list = (List<BasketDTO>)session.getAttribute("BUYLIST");
      for(int i=1 ; i<=len ; i++) {
         list.get(k).setQty(map.get("qty"+i).toString());
         list.get(k).setPrice(map.get("price"+i).toString());
         System.out.println(list.get(k).getPrice());
         totalPrice+=Integer.parseInt(list.get(k).getPrice());
         k++;
      }
      UserDto userdto = callUser(session.getAttribute("ID").toString());
      System.out.println(userdto.getName());
      req.setAttribute("callUser", userdto);
      req.setAttribute("Flist", list);
      session.setAttribute("BUYLIST", list);
      req.setAttribute("totalprice", totalPrice);
      session.setAttribute("TOTALPRICE", totalPrice);
      return "/WEB-INF/Pizza/view/Menu/info.jsp";
   }
   
   
   
   public UserDto callUser(String id) {
      UserDto dto = new UserDto();
      Map map = new HashMap<>();
      map.put("id", id);
      dto = service.callUser(map);
      
      return dto;
   }
   
   
   @RequestMapping("/finalsa.pz")
   public String finalsa(@RequestParam Map map,HttpServletRequest req, HttpSession session) {
	   List<BasketDTO> list = new Vector<>();
	  String de_addr = session.getAttribute("DE_ADDR").toString();
	   if(session.getAttribute("BUYLIST")!=null)
           list = (List<BasketDTO>)session.getAttribute("BUYLIST");
	   String st_no = session.getAttribute("ST_NO").toString();
	   String del_addr = session.getAttribute("DE_ADDR").toString();

	   map.put("id", session.getAttribute("ID").toString());
	   map.put("st_no", st_no);

	   map.put("sa_addr", del_addr);
	   
	   
	   System.out.println(map.get("sa_request"));
	   if(map.get("sa_request")!=null&&map.get("sa_request").toString().trim().length()<2){
		   map.put("sa_request", "없음");
	   }
		   
	   int i = service.insal(map);
	   for(BasketDTO dto : list) {
	   int b = service.insalmenu(dto);
	   if(dto.getKind().equals("1")) {
		   dto.setDe_no(st_no);
		   service.inPizzaRank(dto);
	   }
		   
	   if(dto.getToppingList()!=null)
	   for(ToppingDTO tdto : dto.getToppingList()) {
		   int c =service.s_topping(tdto);
	   }
	   		
	   }
	   
	   if(map.get("mc_no")!=null && !map.get("mc_no").toString().trim().equals("0")) {
		   System.out.println(map.get("mc_no")+"mc no");
		   System.out.println(map.get("st_no")+"stno");
		   service.usecoupon(map);  
	   }else {
		   map.put("mc_no", "0");
		   map.put("minprice", map.get("0"));
	   }
	   System.out.println(map.get("totalprice"));
	   System.out.println(map.get("mc_no"));
	   System.out.println(map.get("minprice"));
	   String minprice = "";
			   
	   for (char c : map.get("minprice").toString().toCharArray()) {
		   if(c>='0' && c<='9')
		   minprice += c;
	   }
	   System.out.println("fpr = "+map.get("fprice"));
	   String fprice ="";
	   for(char c : map.get("fprice").toString().toCharArray()) {
		   if(c>='0' && c<='9')
		   fprice += c;
	   }
	   
	   System.out.println(minprice);
	   map.put("minprice", minprice);
	   map.put("fprice", fprice);
	   int a = service.inSalesPrice(map);
	   
	   session.setAttribute("BUYLIST",null);
	   session.setAttribute("BUYNUM",null);

	   
      return "/Pizza/MainPage.pz";
   }
   
   
   
   
   
   
   
   
   //하프앤하프 & 마이키친 메뉴 - 토핑 리스트 출력용
   @RequestMapping(value="/Pizza/BuyPizza/toppingLayer_LEJ.pz", produces="text/html; charset=UTF-8")
   public String toppingList() throws Exception{
/*      List<ToppingDTO> toppinglist = toppService.selectAddToppingList();
      List<Map> list = new Vector<Map>();
      Map map =null;
      for(ToppingDTO dto : toppinglist) {
         map = new HashMap();
         map.put( "topping_name", dto.getT_name());
         map.put( "topping_gram", dto.getT_gram());
         map.put( "topping_img", dto.getT_img());
         map.put( "topping_kind", dto.getT_kind());
         map.put( "topping_price", dto.getT_price());
         map.put( "topping_size", dto.getT_size());
         list.add(map);
      }*/
      //return JSONArray.toJSONString(list);
      //return "/WEB-INF/Pizza/view/BuyPizza/toppingLayer.jsp";
      return "/WEB-INF/Pizza/view/BuyPizza/toppingLayer_LEJ.jsp";
   }   
   
   
   
}