package pizza.web;



import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import pizza.resource.UserDao;
import pizza.service.impl.CouponDto;
import pizza.service.impl.OrderDto;
import pizza.service.impl.UserDto;

import pizza.service.impl.UserServiceImpl;

@Controller
public class UserController {
	
	@Resource(name="userServiceImpl")
	private UserServiceImpl service;
	
	
	//회원가입 폼으로 
	@RequestMapping("/User/Join.pz")
	public String joinView(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		return "/WEB-INF/Pizza/view/User/Join.jsp";
	}
	
	//로그인 폼으로
	@RequestMapping("/User/Login.pz")
	public String loginView(HttpServletRequest req) throws Exception{
		req.getSession().getAttribute("NAME");
		
		return "/WEB-INF/Pizza/view/User/DominoLogin.jsp";
	}
	
	//아이디 패스워드 찾기 폼으로
	@RequestMapping("/User/DominoSearchforIDorPWD.pz")
	public String SearchIDorPw() throws Exception{
		return "/WEB-INF/Pizza/view/User/DominoSearchforIDorPWD.jsp";
	}
		
	//message 폼으로
	@RequestMapping("/User/Message.pz")
	public String message() throws Exception{
		return "/WEB-INF/Pizza/view/User/Message.jsp";
	}	
	
	//나의정보_매니아 폼으로
	@RequestMapping("/User/MyPage_Mania.pz")
	public String Mania(HttpServletRequest req,CouponDto dto) throws Exception{
		
		req.getSession().getAttribute("NAME");
		String id = (String)req.getSession().getAttribute("ID");
		System.out.println("아이디 : "+id);
		dto.setId(id);
		
		List<String> MyRatingCoupon = service.MyRatingCoupon(dto);
		req.setAttribute("MyRatingCoupon",MyRatingCoupon);
		System.out.println("레이팅 쿠폰: "+MyRatingCoupon);
		return "/WEB-INF/Pizza/view/User/Mania.jsp";
	}
	
	//설정변경 게이트 폼으로
	@RequestMapping("/User/Mypage_ChangeSetting.pz")
	public String settingGate() throws Exception{
		return "/WEB-INF/Pizza/view/User/ChangeSettingGate.jsp";
	}
	
	//비밀번호 변경 폼으로
	@RequestMapping("/User/ChangePasswordForm.pz")
	public String ChangePassword() throws Exception{
		return "/WEB-INF/Pizza/view/User/ChangePassword.jsp";
	}
	
	//설정변경  폼으로
	@RequestMapping("/User/Mypage_ChangeSettings.pz")
	public String setting(HttpServletRequest req) throws Exception{
		req.getSession().getAttribute("NAME");
		req.getSession().getAttribute("ID");
		System.out.println("이름 세션 체크 : "+req.getSession().getAttribute("NAME"));
		return "/WEB-INF/Pizza/view/User/Changesettings.jsp";
	}	
	
	//마이페이지 쿠폰 조회 및 폼 이동
	@RequestMapping("/User/Mypage_coupon.pz")
	public String Mycoupon(HttpServletRequest req,HttpServletResponse resp,CouponDto Cdto,UserDto dto) throws Exception{
		String id = (String)req.getSession().getAttribute("ID");
		String name = (String)req.getSession().getAttribute("NAME");
		Cdto.setId(id);
		List<CouponDto> coupons= service.coupons(Cdto);
		dto.setName(name);
		dto.setId(id);
		req.setAttribute("List",coupons);
		req.setAttribute("CountUnCoupon",service.UnCouponnum(Cdto));	
		req.setAttribute("CountCoupon",service.Couponnum(dto));		
		return "/WEB-INF/Pizza/view/User/Mypage_Coupon.jsp";
	}
	
	//사용기간 지난 쿠폰 조회 및 폼 이동
	@RequestMapping("/User/Mypage_Uncoupon.pz")
	public String UnCoupon(HttpServletRequest req,HttpServletResponse resp,CouponDto Cdto,UserDto dto) throws Exception{
		String id = (String)req.getSession().getAttribute("ID");
		String name = (String)req.getSession().getAttribute("NAME");
		Cdto.setId(id);
		List<CouponDto> coupons= service.Uncoupons(Cdto);
		dto.setName(name);
		dto.setId(id);
		req.setAttribute("List",coupons);
		req.setAttribute("CountUnCoupon",service.UnCouponnum(Cdto));	
		req.setAttribute("CountCoupon",service.Couponnum(dto));						
		return "/WEB-INF/Pizza/view/User/UnavailableCoupons.jsp";
	}
	
	//주문조회 폼으로
	@RequestMapping("/User/Mypage_OrderHistory.pz")
	public String OrderHistory(HttpServletRequest req,HttpServletResponse resp,OrderDto Odto,UserDto dto) throws Exception{
		String name = (String)req.getSession().getAttribute("NAME");
		String id = (String)req.getSession().getAttribute("ID");
		dto.setId(id);
		dto.setName(name);
		Odto.setId(id);
		List<OrderDto> orders = service.Order(Odto);
		req.setAttribute("List",orders);
		return "/WEB-INF/Pizza/view/User/OrderHistory.jsp";
	}
	
	//회원가입 Insert
	@RequestMapping("/User/Insert.pz")
	public String insert(UserDto dto,HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		//한글깨짐 방지
		req.setCharacterEncoding("UTF-8");
		
		//전화번호
		String tel1 = req.getParameter("tel1");
		String tel2 = req.getParameter("tel2");
		String tel3 = req.getParameter("tel3");
		//생년월일 
		String y = req.getParameter("yyyy");
		String m = req.getParameter("mm");
		String d = req.getParameter("dd");
		
		//주소 상세주소 
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		
		//우편번호
		String post1 = req.getParameter("post1");
		String post2 = req.getParameter("post2");
		
		dto.setTel(tel1+"-"+tel2+"-"+tel3);
		dto.setPost(post1+post2);	
		dto.setAddr(addr1+"%&@#*^$@!"+addr2);
		dto.setBirth(y+m+d);
		
		//아이디 존재여부 쿼리 0 이면 아이디 없음 1 이면 존재
		int check = service.showMember(dto);
		
		if(check == 1) {
			check = 0;
			req.setAttribute("WHERE","EXIST");
			req.setAttribute("SUC_FAIL",check);	
			return "/WEB-INF/Pizza/view/User/Message.jsp";
		}
		else {
			check = 1;
			req.setAttribute("WHERE","EXIST");
			req.setAttribute("SUC_FAIL",check);
			service.insert(dto);
			return "/WEB-INF/Pizza/view/User/Message.jsp";
		}
		
	}
	
	//아이디 찾기-이메일 인증
	@RequestMapping("/User/SendEmailBySearchID.pz")
	public void SearchByIdOfEmail(HttpServletRequest req,HttpServletResponse resp,UserDto dto) throws Exception{
		
	String email = req.getParameter("email");
	String name = req.getParameter("name");
	String emails = (String)req.getAttribute("email");
		System.out.println("이메일 파람 체크 입니s다 : "+email+"asdasd : "+emails);
		System.out.println("이름 파람 체크 입니다 : "+name);
	}
	
	//로그인-회원여부 판단 
	@RequestMapping("/User/LoginCheck.pz")
	public void LoginCheck(HttpServletRequest req,HttpServletResponse resp,UserDto dto,UserDao dao) throws Exception{
		PrintWriter pw = resp.getWriter();
		//한글깨짐 방지
		req.setCharacterEncoding("UTF-8");
		JSONObject json = new JSONObject();
		String id = dto.getId();
		String result = "";
		
		try {
			result = service.loginCheck(dto);
			if(result==null)
				result="";
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("WHERE","SEC");
		req.setAttribute("SUC_FAIL",result);
		
		if(result.length() > 0) {	
			req.getSession().setAttribute("ID",dto.getId());
			req.getSession().setAttribute("NAME",result);
			pw.write("http://localhost:8080/DominoPizza/Pizza/MainPage.pz");
		}
		else {
			System.out.println("asdsad");
			pw.write("http://localhost:8080/DominoPizza/User/Login.pz");
		}
		pw.flush();
		pw.close();
	}
	
	//회원 로그아웃 처리
	   @RequestMapping("/User/Logout.pz")
	   public String logout(HttpSession session) throws Exception{
	      session.invalidate();
	      return "/Pizza/MainPage.pz";
	   }
	
	//ID 찾기 
	@RequestMapping("/User/Search_id.pz")
	public String SearchId(HttpServletResponse resp,HttpServletRequest req,UserDao dao,UserDto dto) throws Exception{
		System.out.println("asdadsada");
		//한글깨짐 방지
		req.setCharacterEncoding("UTF-8");	
		
		String y = req.getParameter("yyyy");
		String m = req.getParameter("mm");
		String d = req.getParameter("dd");
		
		String tel1 = req.getParameter("tel1");
		String tel2 = req.getParameter("tel2");
		String tel3 = req.getParameter("tel3");
		
		dto.setBirth(y+m+d);
		dto.setTel(tel1+"-"+tel2+"-"+tel3);
		
		String name = dto.getName();
		String result = service.SearchId(dto);
		req.setAttribute("WHERE", "S_ID");
		if(result != null) {
			req.setAttribute("name",name);
			req.setAttribute("ids",result);
			//id값 끝 2자리 ** 처리
			String ids = req.getAttribute("ids").toString();
			req.setAttribute("id",ids.replace(ids.substring(ids.length()-2,ids.length()),"**"));
			return "/WEB-INF/Pizza/view/User/CompleateForSearchId.jsp";
		}
		else {
			req.setAttribute("SUC_FAIL",0);
			return "/WEB-INF/Pizza/view/User/Message.jsp";
		}
		
	}
	//비밀번호 변경
	@RequestMapping("User/CkIdForSearchPwd.pz")
	public String CheckIdForSearchPwd(HttpServletRequest req,HttpServletResponse resp,UserDao dao,UserDto dto) throws Exception{
		
		int result=0;
		result = service.SearchPwd(dto);
		req.setAttribute("WHERE", "S_PWD");
		if(result != 0) {
			
			req.setAttribute("SUC_FAIL",1);
		}
		else {
			
			req.setAttribute("SUC_FAIL",0);
		}
		return "/WEB-INF/Pizza/view/User/Message.jsp";
	}
	
	//설정변경 전 비밀번호 확인
	@RequestMapping("User/CheckIdPwd.pz")
	public void CheckPwd(HttpServletRequest req,HttpServletResponse resp,UserDto dto) throws Exception{
		PrintWriter pw = resp.getWriter();
		//한글깨짐 방지
		req.setCharacterEncoding("UTF-8");
		JSONObject json = new JSONObject();
		String result = "";
		String id = (String) req.getSession().getAttribute("ID");
		String pwd = req.getParameter("pwd");
		dto.setId(id);
		
		result = service.loginCheck(dto);
		if(result==null)
				result="";
		
	System.out.println("id = "+id);
	System.out.println("pwd = "+pwd);
	req.getSession().getAttribute("ID");
	if(result != "") {
		System.out.println("쿼리문 값 : "+result);
		System.out.println("if");
		pw.write("http://localhost:8080/DominoPizza/User/Changesettings.jsp");
	}
	else {
		System.out.println("else");
		pw.write("http://localhost:8080/DominoPizza/User/ChangeSettingGate.jsp");
	}
	pw.flush();
	pw.close();
	}
	
	//비밀번호 수정처리
	@RequestMapping("User/ChangePwd.pz")
	public String ChangePwd(HttpServletRequest req,UserDto dto) throws Exception{
		System.out.println("컨트롤러 들어옴");
		String id = (String)req.getSession().getAttribute("ID");
		System.out.println("세션 아이디 : "+id);
		dto.setId(id);
		
		//변경전 기존 비밀번호 일치 확인
		String nowpwd = req.getParameter("oldpwd");
		dto.setPwd(nowpwd);
		String result = service.loginCheck(dto);
		
		if(result != null) {
			String pwd = req.getParameter("pwd");
			dto.setPwd(pwd);
			int compleate = 0;
		    compleate = service.UpdatePwd(dto);
			if(compleate != 0) {
				req.setAttribute("WHERE","OKPWD");
				req.setAttribute("SUC_FAIL",1);
			}
		}
		else {
			req.setAttribute("WHERE","CHKPWD");
			req.setAttribute("SUC_FAIL",0);
		}
		
		return "/WEB-INF/Pizza/view/User/Message.jsp";
	}
	
	//비밀번호 수정후 이동 수정해야함
	@RequestMapping("/User/PwdCompleate.pz")
	public String EditPwdCompleate() throws Exception {
		
		return "window.close()";
	}
	
	//수정 처리 
	@RequestMapping("User/ChangeSetting.pz")
	public String ChangeSetting(HttpServletRequest req,HttpServletResponse resp,UserDto dto,UserDao dao) throws Exception{
		
		//전화번호
		String tel1 = req.getParameter("tel1");
		String tel2 = req.getParameter("tel2");
		String tel3 = req.getParameter("tel3");
		
		//생년월일 
		String y = req.getParameter("yyyy");
		String m = req.getParameter("mm");
		String d = req.getParameter("dd");
		
		//이메일
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		
		//아이디
		String id = (String) req.getSession().getAttribute("ID");
		
		//DTO 설정
		dto.setTel(tel1+"-"+tel2+"-"+tel3);
		dto.setBirth(y+m+d);
		dto.setEmail(email1+"@"+email2);
		dto.setId(id);
		System.out.println("id : "+id);
		System.out.println("전화번호"+tel1);
		System.out.println("전화번호"+tel2);
		System.out.println("전화번호"+tel3);
		System.out.println("생년월일 : "+y);
		System.out.println("생년월일 : "+m);
		System.out.println("생년월일 : "+d);
		System.out.println("이메일 : "+email1);
		System.out.println("이메일 : "+email2);
		int result = 0;
		result = service.UpdateCustomer(dto);
		req.setAttribute("WHERE","CHG");
		if(result != 0) {
			req.setAttribute("SUC_FAIL",1);
		}
		else {
			req.setAttribute("SUC_FAIL",0);
		}
		return "/WEB-INF/Pizza/view/User/Message.jsp";
	}
	
	//등급별 쿠폰 다운로드
	@RequestMapping("/User/CouponDownLoad.pz")
	public void CouponDownLoad(HttpServletRequest req,CouponDto dto,HttpServletResponse resp) throws Exception{
		PrintWriter pw = resp.getWriter();
		
		//한글깨짐 방지
		JSONObject json = new JSONObject();
		
		req.getSession().getAttribute("NAME");
		String id = (String)req.getSession().getAttribute("ID");
		dto.setId(id);
		
		List<String> MyRatingCoupon = service.MyRatingCoupon(dto);
		List<CouponDto> MyCouponList = service.coupons(dto);
		
		boolean get = true;
		for(CouponDto cdto  : MyCouponList) {
			
			for(String mrc : MyRatingCoupon) {
				if(cdto.getC_name().trim().equals(mrc.trim()))
					get=false;
				if(!get)
					break;
			}
			if(!get) break;
		}
		
		
		if(get == true) {
			service.MyCouponByRatingForDownLoad(dto);
		}
		else {
			pw.write("Get");
		}
		pw.flush();
		pw.close();
		System.out.println("쿠폰다운됨");
		
	}
	
}//// class
