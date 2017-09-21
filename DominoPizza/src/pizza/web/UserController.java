package pizza.web;



import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import pizza.resource.UserDao;
import pizza.service.impl.UserDto;

import pizza.service.impl.UserServiceImpl;

@Controller
public class UserController {
	
	@Resource(name="userServiceImpl")
	private UserServiceImpl service;
	
	//회원가입 Insert
	@RequestMapping("/User/Insert.pz")
	public String insert(UserDto dto,HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		//�븳湲� 泥섎━
		req.setCharacterEncoding("UTF-8");
		
		
		//�깮�뀈�썡�씪 �빀移섍린
		String y = req.getParameter("yyyy");
		
		  String m = req.getParameter("mm").length() ==1 ? "0" + req.getParameter("mm") : req.getParameter("mm");
	      String d = req.getParameter("dd").length() ==1 ? "0" + req.getParameter("dd") : req.getParameter("dd");
	      String Birth = req.getParameter("yyyy")+ m + d;
		
		
		
		//二쇱냼 �긽�꽭二쇱냼 �빀移섍린
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		
		//�슦�렪踰덊샇 �빀移섍린
		String post1 = req.getParameter("post1");
		String post2 = req.getParameter("post2");
		
		dto.setPost(post1+post2);
		dto.setAddr(addr1+"%&@#*^$@!"+addr2);
		dto.setBirth(y+m+d);
		
		
		
		service.insert(dto);
		
		return "/WEB-INF/Pizza/view/User/DominoLogin.jsp";
	}
	
	//회원가입 폼으로 
	@RequestMapping("/User/Join.pz")
	public String joinView(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		
		
		return "/WEB-INF/Pizza/view/User/Join.jsp";
	}

	
	@RequestMapping("/User/Login.pz")
	public String loginView() throws Exception{
		return "/WEB-INF/Pizza/view/User/DominoLogin.jsp";
	}
	
	@RequestMapping("/User/DominoSearchforIDorPWD.pz")
	public String SearchIDorPw() throws Exception{
		return "/WEB-INF/Pizza/view/User/DominoSearchforIDorPWD.jsp";
	}
	
	@RequestMapping("/User/Message.pz")
	public String message() throws Exception{
		return "/WEB-INF/Pizza/view/User/Message.jsp";
	}
	
	@RequestMapping("/User/Logout.pz")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "/Pizza/MainPage.pz";
	}
	
	
	@RequestMapping("/User/LoginCheck.pz")
	public void LoginCheck(HttpServletRequest req,HttpSession session ,HttpServletResponse resp,UserDto dto,UserDao dao) throws Exception{
		PrintWriter pw = resp.getWriter();
		
		
		JSONObject json = new JSONObject();
		System.out.println("id : "+dto.getId());
		System.out.println("pwd : "+dto.getPwd());
		String id = dto.getId();
		String result = "";
		
		result = service.loginCheck(dto);	
		
		req.setAttribute("WHERE","SEC");
		req.setAttribute("SUC_FAIL",result);
	
		if(result!=null && result.length()>0) {	
			pw.write("/DominoPizza/Pizza/MainPage.pz");
			session.setAttribute("ID", id);
			System.out.println(session.getAttribute("ID")+"@@");
			session.setAttribute("NAME", result);
		}
		else {
			pw.write("http://localhost:8080/DominoPizza/User/Login.pz");
			
		}
		pw.flush();
		pw.close();
		
		
	}
	
}//// class