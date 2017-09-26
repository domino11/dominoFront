package pizza.web;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pizza.service.PizzaMenuList;
import pizza.service.impl.ServiceImpl;
import pizza.service.impl.UserDto;
import pizza.service.impl.UserServiceImpl;

@Controller
public class Android {
	
	@Resource(name="service")
	private ServiceImpl service;
	
	@Resource(name="userServiceImpl")
	private UserServiceImpl uservice;
	
	@ResponseBody
	@RequestMapping(value="/Login.pz",produces="text/html;charset=UTF-8")
	public String login(@RequestParam Map map) 
			throws Exception{
		//비지니스 로직 호출]
		System.out.println("들어옴!!");
		UserDto dto= new UserDto();
		dto.setId(map.get("id").toString());
		dto.setPwd(map.get("pwd").toString());
		String name = uservice.loginCheck(dto);
		boolean flag=false;
		
		if(name!=null&&name.trim().length()>0)
			flag=true;
			
		//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
		JSONObject json = new JSONObject();
		//JSON객체의 put("키값","값")메소드로 저장하면
		//{"키값":"값"} JSON형태의 데이타로 저장됨.
		json.put("isLogin",flag ? "Y" : "N");
		
		System.out.println(json.toJSONString());
		return json.toJSONString();
	}//////////////////////ajaxJson()
	
	
	
	@ResponseBody
	@RequestMapping(value="/AndroidMenu.pz",produces="text/html;charset=UTF-8")
	public String androidMenu(@RequestParam Map map,HttpServletRequest req) 
			throws Exception{
		

		String sel = " S_NAME,S_PRICE,S_IMG,S_NO ";
		String fro = " SIDE S ";
		map.put("sel", sel);
		map.put("fro", fro);
		
		List<Map> list = new Vector<>();
		System.out.println("들어는 오냐");
		map.put("ty", "104");
		List<PizzaMenuList> plist = service.menuList(map);
		
		int lidx=req.getRequestURL().toString().lastIndexOf("/");
		String url = req.getRequestURL().toString().substring(0,lidx);
		System.out.println(url+"/Pizza/Image/pizzalist/");
		for(PizzaMenuList dto : plist) {
			
			Map map2 = new HashMap<>();
			map.put("name", dto.getP_name());
			map.put("url", url+dto.getP_img());
		}
		//URL url = new URL(req.getServletContext().getRealPath("/Pizza/Image"));
		//System.out.println(url);
		
		
		
		System.out.println(JSONArray.toJSONString(list));
		return JSONArray.toJSONString(list);
	
	}
	


}
