<%@page import="java.util.Random"%>
<%@page import="com.sun.javafx.binding.SelectBinding.AsDouble"%>
<%@page import="java.util.Properties" %>
<%@page import="javax.mail.Message" %>
<%@page import="javax.mail.MessagingException" %>
<%@page import="javax.mail.Session" %>
<%@page import="javax.mail.Transport" %>
<%@page import="javax.mail.internet.InternetAddress" %>
<%@page import="javax.mail.internet.MimeMessage" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
	//인증번호 랜덤
	Random random = new Random();
    
	int result = random.nextInt(10000)+1000;
	 
	
	
	if(result>10000){
	    result = result - 1000;
	}
	String randoms = Integer.toString(result);
	
	
	
	// 메일 관련 정보
    String host = "smtp.gmail.com";
    String username = "DongJun7351@gmail.com";
    String password = "ehdwns7351";
    
    // 메일 내용
    String recipient = request.getParameter("email");
    String subject = "[DominoPizza]도미노 피자 입니다";
    
	int lidx=request.getRequestURL().toString().lastIndexOf("/");
	String url = request.getRequestURL().toString().substring(0,lidx);
    
    String body = "<img src='"+url+"/Pizza/Image/dominos_pizza.png' width='300' height='200'/><h3>회원가입 관련 인증번호는 </h3><h2 style='color: red;'>"+randoms+"</h2> <h3>입니다.</h3>";
    //properties 설정
    Properties props = new Properties();
    props.put("mail.smtps.auth", "true");
    // 메일 세션
    Session sess = Session.getDefaultInstance(props);
    MimeMessage msg = new MimeMessage(sess);

    // 메일 관련
    msg.setSubject(subject);
    msg.setContent(body, "text/html; charset=utf-8"); 
    msg.setFrom(new InternetAddress(username,"DominoPizza"));
    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
	
    // 발송 처리
    Transport transport = sess.getTransport("smtps");
    transport.connect(host, username, password);
    transport.sendMessage(msg, msg.getAllRecipients());
    transport.close();		

    //System.out.println("이메일:"+request.getParameter("email"));
    
    //쿠키에 저장
	Cookie cookie = new Cookie("NO",randoms);
	cookie.setPath(request.getContextPath());
	response.addCookie(cookie);
    
    
    %>