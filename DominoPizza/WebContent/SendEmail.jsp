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
   
    String body = "<div style='font-family: Helvetica Neue, Helvetica, Helvetica, Arial, sans-serif;'><table style='width: 100%;'><tr><td></td><td bgcolor='#FFFFFF '><div style='padding: 15px; max-width: 600px;margin: 0 auto;display: block; border-radius: 0px;padding: 0px; border: 1px solid lightseagreen;'><table style='width: 100%;background: #00b6e2 ;'><tr><td></td><td><div><table width='100%'><tr><td rowspan='2' style='text-align:center;padding:10px;'><img style='float:left;'src='"+url+"/Pizza/Image/logo.png'  width='300' height='100'/><span style='color:white;float:right;font-size: 13px;font-style: italic;margin-top: 20px; padding:10px; font-size: 14px; font-weight:normal;'>'We Know the Pizza, Domino's Pizza'<span></span></span></td></tr></table></div></td><td></td></tr></table><table style='padding: 10px;font-size:14px; width:100%;'><tr><td style='padding:10px;font-size:14px; width:100%;'><p>안녕하십니까 도미노 피자 입니다,</p><p><br />회원가입을 응해주셔서 정말 감사드립니다.</p><p><h3>회원가입 관련 인증번호는 </h3><h2 style='color: red;'>"+randoms+"</h2> <h3>입니다.</h3></p><p> </p><p>Thank you for using DominoPizza,</p><p>-DominoPizza Team-</p></td></tr><tr><td><div align='center' style='font-size:12px; margin-top:20px; padding:5px; width:100%; background:#eee;'>ⓒ2017 by Domino’s Pizza. All rights reserved.</div></td></tr></table></div>";
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