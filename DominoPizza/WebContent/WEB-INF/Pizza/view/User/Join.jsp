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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
	 <!-- CSS 파일 불러오기 -->
    <link rel="stylesheet" href="<c:url value='/Pizza/css/JoinForm.css'/>">
    <link rel="stylesheet" href="<c:url value='/Pizza/css/JoinForm_Size.css'/>">


	<meta charset="euc-kr">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>도미노피자</title>
	<meta name="viewport" id="viewport" content="width=1119px, user-scalable=yes">
	<meta http-equiv='cache-control' content='no-cache'>
	<meta http-equiv='expires' content='0'>
	<meta http-equiv='pragma' content='no-cache'>
	<link rel="shortcut icon" href="https://cdn.dominos.co.kr/renewal2016/ko/w/img/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/resources/css/font.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css?v1.0">
	<!-- 2] CDN(Content Deliver Network)주소 사용-->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<!-- Deprecated 된 함수사용 -->
	<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="/resources/js/selectbox.js"></script><!-- js 수정함. -->
	<script type="text/javascript" src="/resources/js/d2CommonUtil.js"></script>
	<script type="text/javascript" src="/resources/js/Cookie.js"></script>
	<script type="text/javascript" src="/resources/js/basket_w.js"></script>
	
	<script>
	$("#send").css("background","pink")
	
	
	</script>
	<script type="text/javascript">
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";
	var a,b,c,d,e;
	
	function CheckPwd(){
		
		
		var pwd = $("#password").val();
		var cpwd = $("#cpassword").val();
		
		if(pwd != cpwd){
			$("#CheckPwd").get(0).innerHTML = "비밀번호 가 일치하지 않습니다.";
			$("#CheckPwd2").get(0).innerHTML = "";
			a=0;
			
		}
		else{
			
			$("#CheckPwd").get(0).innerHTML = "";
			$("#CheckPwd2").get(0).innerHTML = "비밀번호 가 일치 합니다.";
			
			a=1;
		}
	}
	
	function CheckId(){
		var id = $("#id").val();
		if(id.length == 0){
			$("#CheckId").get(0).innerHTML = "아이디를 입력 하세요.";
			b=0;
		}
		else if(id.length > 15){
			$("#CheckId").get(0).innerHTML = "아이디는 15자 이하로 입력해 주세요."
			b=0;
		}
		else{
			$("#CheckId").get(0).innerHTML = "";
			b=1;
			
		}
	}
	
	function CheckEmail(){
		var email = $("#email").val();
		if(email.length == 0){
			$("#Checkemail").get(0).innerHTML = "이메일을 입력 하세요.";
			
			c=0;
			
		}
		else if(email.length > 50){
			$("#Checkemail").get(0).innerHTML = "이메일 은 50자 이내로 입력 하세요.";
			c=0;
			
		}
		else if(email.indexOf('@') == -1){
			$("#Checkemail").get(0).innerHTML = "@ 를 포함해서 입력해 주세요.";
			c=0;
			
		}
		else{
			$("#Checkemail").get(0).innerHTML = "";			
			c=1;
			
		}
	}
	
	function CheckName(){
		var name = $("#name").val();
		if(name.length == 0){
			$("#CheckName").get(0).innerHTML = "이름을 입력 하세요.";
			d=0;
		}
		else if(name.length > 20){
			$("#CheckName").get(0).innerHTML = "이름 은 20자 이내로 입력 하세요.";
			d=0;
		}
		else{
			$("#CheckName").get(0).innerHTML = "";
			
			d=1;
		}
		
		
	}
	
	function CheckTel(){
		var tel2 = $('#tel2').val();
		var tel3 = $('#tel3').val();
		if(tel2 == '' || tel3 == ''){
			$("#CheckTel").get(0).innerHTML = "휴대전화번호 를 입력 하세요.";
			}
		else{
			$("#CheckTel").get(0).innerHTML = "";
			c = 1;
			}
		}// CheckTel()
		
		function getCookie(cname) {
        	    var name = cname + "=";
        	    var decodedCookie = decodeURIComponent(document.cookie);
        	    var ca = decodedCookie.split(';');
        	    for(var i = 0; i <ca.length; i++) {
        	        var c = ca[i];
        	        while (c.charAt(0) == ' ') {
        	            c = c.substring(1);
        	        }
        	        if (c.indexOf(name) == 0) {
        	            return c.substring(name.length, c.length);
        	        }
        	    }
        	    return "";
        	}
		
		
	function CheckEmailNum(){
			var randomnum = getCookie("NO");
			var CheckEmailNum = $("#captcha").val()
	          if($("#captcha").val().length==4){
	        	if(randomnum == $("#captcha").val()){
	        		$("#CheckEmailNum").get(0).innerHTML = "인증번호 와 일치 합니다.";
	        	  }//if
	        	  else{
	        		  $("#CheckEmailNum").get(0).innerHTML = "인증번호 와 일치하지 않습니다.";
	        		  }//else
	        		 }///if
	        		 
	        	 }///function
	        	 
	 
			
		
		
	function clicks(){
		
		if($("#Checkemail").get(0).innerHTML.length+$("#CheckTel").get(0).innerHTML.length+$("#CheckName").get(0).innerHTML.length+
				$("#CheckPwd").get(0).innerHTML.length+$("#CheckId").get(0).innerHTML.length+$("#CheckEmailNum").get(0).innerHTML.length ==14){
			signup.submit();
		}
		else{
			alert("회원가입 정보를 정확히 입력해 주세요.");
		}
	}
	
	

	</script>
	<!-- Naver Anlytics 공통-->
	<script>
	var WCSLOG_URL = location.protocol == "https:" ? "https://wcs.naver.net/wcslog.js" : "http://wcs.naver.net/wcslog.js";
	document.write(unescape("%3Cscript type='text/javascript' src='" + WCSLOG_URL +"' %3E%3C/script%3E"));
	</script>
	<!-- // Naver Anlytics 공통-->

	<!-- 카이젠 공통-->
	<script data-kz-key="7944084e2b522564"
	data-kz-namespace="kzs"
	src="//cdn.kaizenplatform.net/s/79/44084e2b522564.js" charset="utf-8">
	</script> 
	<!-- 카이젠 공통-->

	</head>
	<body>
		<!-- top_event_bnr -->
		<div class="top_bnr top_event" id="lineBanner">
			<div class="top_event_wrap">
				<a href="javascript:;" class="btn_ico btn_event_close" onclick="lineBannerClose(); return false;">close</a>
			</div>
		</div>
		<%@include file="/WEB-INF/Pizza/template/Top.jsp" %>
		
		<br><br><br><br><br><br><br><br>
<div class="container">
	<div class="row">
    <div class="col-md-8">
    <div>
      <section>      
      
        <h1 class="entry-title"><span>회원가입 <small style="font-weight: bold;">(Register)</small></span> </h1>
        <hr>
            <form class="form-horizontal" method="post" name="signup" id="signup"  action="<c:url value='/User/Insert.pz'/>" >        
        <div class="form-group">
          <label class="control-label col-sm-3">이메일<span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="email" class="form-control" name="email" id="email" placeholder="이메일 아이디 입력" onkeyup="javascript:CheckEmail()">
               <span id="Checkemail" style="color: red; font-weight: 600;"></span>
            </div>
            <small>귀하의 이메일 ID는 본인인증에 사용됩니다.</small> </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">아이디<span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="text" class="form-control" name="id" id="id" placeholder="아이디 입력" value="" onkeyup="javascript:CheckId()">
              <span id="CheckId" style="color: red; font-weight: 600;"></span>
            </div>
            </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호<span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="pwd" id="password" placeholder="비밀번호 입력 (5-15 글자)" value="">
           </div>   
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 확인<span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" name="cpassword" id="cpassword" placeholder="비밀번호 확인" value="" onkeyup="javascript:CheckPwd()">
              <span id="CheckPwd" style="color: red; font-weight: 600;"></span>
              <span id="CheckPwd2" style="color: red; font-weight: 600;"></span>
            </div>  
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">이름<span class="text-danger">*</span></label>
          <div class="col-sm-6">
            <input type="text" class="form-control" name="name" id="name" placeholder="이름 입력" onkeyup="javascript:CheckName()">
            <span id="CheckName" style="color: red; font-weight: 600;"></span>
          </div>
        </div>
              <label class="control-label col-sm-3"  for="email">생년월일</label>
               <div class="form-group">
            <div class="form-inline">
            &nbsp;
                  <select name="yyyy" class="form-control">
                     <option value="0">년도</option>
                     <c:forEach begin="1920" end="2017" var="i">
                        <option value="${i}">${i}</option>
                     </c:forEach>
                  </select>

                     <select name="mm" class="form-control">
                        <option value="0">월</option>
                        <c:forEach begin="1" end="12" var="i">
                           <option value="${i}">${i}</option>
                        </c:forEach>
                     </select>
 
                     <select name="dd" class="form-control">
                        <option value="0">일</option>
                        <c:forEach begin="1" end="31" var="i">
                           <option value="${i}">${i}</option>
                        </c:forEach>
                     </select>
                  </div>    
            </div>
           <!-- 우편번호 -->
         <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">우편 번호</label>

        <div class="col-sm-6">
        <input id="post1" class="poststyle" readonly="" size="5" name="post1"> - <input id="post2" class="poststyle"  readonly="" size="5" name="post2">
      <input onclick="openDaumPostcode()" type="button" class="btn btn-sm btn-info"  value="우편번호찾기"><br>
      <span id="CheckPost" style="color: red; font-weight: 600;"></span>
        </div>
        </div>
        
        <!--  주소 -->
         <div class="form-group">
         <label class="col-sm-3 control-label" for="inputEmail">집 주소</label>

        <div class="col-sm-6">
      <input id="addr1" class="poststyle2" readonly="" size="40" name="addr1" placeholder="도로명주소">

        </div>
        </div>

        <!--  상세주소 -->
         <div class="form-group">
         <label class="col-sm-3 control-label" for="inputEmail">집 상세주소</label>

        <div class="col-sm-6">
      <input id="addr2" class="poststyle2" size="40" name="addr2" placeholder="상세 주소">
        </div>
        </div>       
        <div class="form-group">
          <label class="control-label col-sm-3">성별<span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <label>
            <input name="gender" type="radio" value="M" checked>
            남성 </label>
               
            <label>
            <input name="gender" type="radio" value="W" >
            여성 </label>
          </div>
        </div>
							<div class="form_group">       
							<label class="control-label col-sm-3">휴대전화 번호<span class="text-danger">*</span></label>
								<div class="form_field">
									<div class="sel_box">
										<select name="tel1" id="tel1">
											<option value="010"/>010</option>
											<option value="011"/>011</option>
											<option value="016"/>016</option>
											<option value="017"/>017</option>
											<option value="018"/>018</option>
											<option value="019"/>019</option>
										</select>
									</div>
								</div>
								<div class="form_field">
									<div class="form_item">
										<input type="text" name="tel2" id="tel2" maxlength="4" class="i_text" onkeyup="javascript:CheckTel()">
									</div>
								</div>
								<div class="form_field">
									<div class="form_item">
										<input type="text" name="tel3" id="tel3" maxlength="4" class="i_text" onkeyup="javascript:CheckTel()">
									</div>
								</div>
								<span id="CheckTel" style="color: red; font-weight: 600;"></span>
							</div>
							
						<br/>
        <div class="form-group">
          <label class="control-label col-sm-3">이메일 인증번호 입력</label>
         	
         	
         	
          <div class="col-md-5 col-sm-8">
            <div>
                
                <input type="text" name="captcha" id="captcha" class="form-control label-warning" maxlength="4" onkeyup="javascript:CheckEmailNum()" />
                 <span id="CheckEmailNum" style="color: red; font-weight: 600;"></span>               
              </div>
              
         	&nbsp;<br/>
              <input type="button" name="emailcode" value="인증번호 전송" class="btn btn-primary" onclick="sendEmail();"/>
              
          </div>
          
        </div>
        <div class="form-group">
          <div class="col-xs-offset-3 col-md-8 col-sm-9"><span class="text-muted"><span class="label label-danger">Memo</span>가입 완료를 누르실 경우 모든 약관에 모두 동의합니다.</a>.</span> </div>
        
        </div>
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input name="Submit" type="button" onclick="clicks();" value="가입 완료" class="btn btn-primary">
          </div>
          
        </div>
      </form>
    </div>
    </div>
</div>
</div>
<br><br><br>
<%@include file="/WEB-INF/Pizza/template/foot.jsp" %>

         <script>
         
        
         
         
         
         
         function sendEmail(){
        	 
        	 if($("#email").val() == ""){
        		 alert('먼저 이메일을 입력해 주세요');
        		 return false;
        	 }
        	 
        	 var result = confirm('인증 메일을 발송하실 경우 이메일 은 수정하지 못합니다.'); 
        	  if(result) {  
        		 
        		 $("#email").attr("readonly",true).attr("disabled",false); //입력불가
        		 
        	 } else { 
        		 
        		 return false;
        	 }


        	  
        	 $.ajax(
        			 {url: '<c:url value="/SendEmail.jsp"/>',
        		        type: 'POST',
        		        data:"email="+$("#email").val(),
        		        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
        		        
        		        success: function (result) {
        		        	alert("입력하신 이메일로 인증번호를 전송하였습니다.");
        		        }        			 
        		 
        			
        		 
        		 
        			 });
        	
        	
        	
         }
         
         
         
         
         
function openDaumPostcode() {
    var width = 500; //팝업창이 실행될때 위치지정
    var height = 600; //팝업창이 실행될때 위치지정
    new daum.Postcode({
        width : width, //팝업창이 실행될때 위치지정
        height : height, //팝업창이 실행될때 위치지정
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 			
            
            
            
            // 법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
             
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("post1").value = data.postcode1;
            document.getElementById("post2").value = data.postcode2;
            document.getElementById("addr1").value = fullRoadAddr;
            document.getElementById("addr2").value = data.jibunAddress;
 
            document.getElementById('addr2').focus();
        }
    }).open({
        left : (window.screen.width / 2 ) - ( width / 2), //팝업창이 실행될때 위치지정
        top : (window.screen.height / 2 ) - ( height /2) //팝업창이 실행될때 위치지정
    });
}
</script>
   
   
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


</body>
</html>