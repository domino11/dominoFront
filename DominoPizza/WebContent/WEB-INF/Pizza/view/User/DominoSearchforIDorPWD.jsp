<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
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
	<script type="text/javascript">
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";
	var a,b,c,d,e;
	$(document).ready(function() {
		$.ajaxSetup({cache:false});

		setBasketCnt();

		// 마이쿠폰 정보 조회(가입회원)
		

		// 주문&주문트레커 조회(가입회원/인증회원)
		
	});

	function isBlank(){
		alert('asdsasad');
	}
	
	
	function setBasketCnt() {
		var basketCnt = cookieManager.getCookie("BASKETCNT");
		var basket = cookieManager.getCookie("BASKET");
		var finish_basket = cookieManager.getCookie("FINISH_BASKET");

		if(basketCnt == "") basketCnt = "0";
		else if(basket != "" && basket == finish_basket) basketCnt = "0";
		if(basketCnt != "0")
			$(".cart_count").text(basketCnt);
	}

	var goCart = function() {
		location.href="/basket/detail";
	};

	var doLogin = function() {
		location.href="/global/login";
	};

	var myOrderDetail = function() {
		var order_no = $('#tracker_order_no').val();
		location.href="/mypage/myOrderView?order_no="+order_no+"&pageNo=1"
	};

	//유효성 체크
	
	function Name_Error(){
		var name = $('#name_i').val();
		if(name.length == 0){
			$("#name_error").get(0).innerHTML = "이름을 입력 하세요.";
		}
		else if(name.length > 20){
			$("#name_error").get(0).innerHTML = "이름은 20자 내외로 입력 하세요.";
		}
		else{
			$("#name_error").get(0).innerHTML = "";
			a = 1;
		}
	}// Name_Error()
	
	function Email_Error(){
	var email = $('#email').val();
	if(email.length == 0){
		$("#email_error").get(0).innerHTML = "이메일 을 입력 하세요.";
		}
	else if(email.indexOf('@') == -1){
		$("#email_error").get(0).innerHTML = "이메일은 @ 포함 시켜 주세요.";
		}
	else{
		$("#email_error").get(0).innerHTML = "";
		b = 1;
		}
	}// Email_Error()
	
	function Tel_Error(){
	var tel2 = $('#tel2').val();
	var tel3 = $('#tel3').val();
	if(tel2 == '' || tel3 == ''){
		$("#tel_error").get(0).innerHTML = "휴대전화번호 를 입력 하세요.";
		}
	else{
		$("#tel_error").get(0).innerHTML = "";
		c = 1;
		}
	}// Tel_Error()
	
	function Birth_Error(){
	var year = $('#yyyy').val();
	var month = $('#mm').val();
	var day = $('#dd').val();
	if(year == 0 || month == 0 || day == 0){
		$("#birth_error").get(0).innerHTML = "생년월일 을 입력해 주세요";
		}
	else{
		$("#birth_error").get(0).innerHTML = "";
		d = 1;
		}
	}// Email_Error()
	
	
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
	<!-- //top_event_bnr -->

	
		<%@include file="/WEB-INF/Pizza/template/Top.jsp" %>
<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="srch_wrap">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><a href="/global/login">로그인</a></li>
				<li><span>아이디/비밀번호 찾기</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>아이디/비밀번호 찾기</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="tab_type">
			<ul class="btn_tab">
				<li class="active"><a href="javascript:goTab(0);">아이디 찾기</a></li>
				<li><a href="javascript:goTab(1);">비밀번호 찾기</a></li>
			</ul>
		</div>

		<div class="srch_area" name="default_area">
			<div class="srch_way">

				<!-- 2017-01-13 // 회원정보 찾기 추가(s) -->
				<dl class="dl_member">
					<dt>
						<span class="ico ico_member"></span>
						회원정보로 찾기
					</dt>
					<dd>
						<a href="javascript:openIdByInside();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">회원정보 인증</span></a>
					</dd>
				</dl>
				
				
				
			</div>
			<div class="lst_type v4">
				<ul>
					<li>신용평가기관을 통해 한국도미노피자에 가입하신 아이디, 비밀번호 찾기를 진행하며, 당사는 고객의 주민등록번호를 저장하지 않습니다.</li>
					<li>회원 가입 시 등록한 휴대폰번호와 현재 보유 휴대폰번호가 다를경우 본인인증/아이핀으로 찾기를 진행해주세요.</li>
				</ul>
			</div>
		</div>

		<div class="srch_area" name="default_area" style="display:none;">
			<div class="srch_way">
<dl>
					<dt>
						<span class="ico ico_cellphone"></span>
						본인인증으로 찾기
					</dt>
					<dd>
					<form class="form-horizontal" method="post" name="searchpwd" id="searchpwd"  action="<c:url value='/User/CkIdForSearchPwd.pz'/>" >
						<div class="lst_type_dot">
							<ul>
								<li>
									<label for="kg_id">아이디</label>
									<input type="text" id="id" name="id">
								</li>
								<li>
									<label for="kg_id">이름</label>
									<input type="text" id="name" name="name">
								</li>
								<li>
									<label for="kg_id">새 암호</label>
									<input type="text" id="pwd" name="pwd">
								</li>
							</ul>
						</div>
						</form>
						<a href="javascript:findPwdByMember();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">회원정보 본인인증</span></a>
					</dd>
				</dl>

			</div>
			<div class="lst_type v4">
				<ul>
					<li>신용평가기관을 통해 한국도미노피자에 가입하신 아이디, 비밀번호 찾기를 진행하며, 당사는 고객의 주민등록번호를 저장하지 않습니다.</li>
				</ul>
			</div>
		</div>

		<div class="srch_area" name="result_passwd" style="display:none;">
			<div class="pw_edit">
				<dl>
					<dt>
						비밀번호 변경
						<p>새로 사용할 비밀번호를 입력하세요.</p>
					</dt>
					<dd class="lst_type_dot">
						<ul>
							<li>
								<label for="n_pw">새 비밀번호</label>
								<div class="form_group">
									<div class="form_field">
										<div class="form_item">
											<input type="password" id="passwd" name="passwd" class="i_text" placeholder="8~16자 영문대소문자, 숫자, 특수문자 사용가능">
										</div>
									</div>
									<span class="i_error show" id="passwd_alert"></span>
								</div>
							</li>
							<li>
								<label for="confirmpw">새 비밀번호 확인</label>
								<div class="form_group">
									<div class="form_field">
										<div class="form_item">
											<input type="password"  id="confirmpw" name="confirmpw" class="i_text">
										</div>
									</div>
									<span class="i_error show" id="confirmpw_alert"></span>
								</div>
							</li>
						</ul>
					</dd>
				</dl>
				<a href="javascript:updateChangePasswd();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">비밀번호 변경</span></a>
			</div>
		</div>

		<div class="srch_area" name="result_id" style="display:none;">
			<div class="result">
				<strong><span class="user_name">도민호</span>님의 ID는 <em class="user_id">domino</em> 입니다.</strong>
				<p>신용평가기관을 통해 실명 인증된 도미노피자 아이디입니다.</p>
				<div class="btn_wrap">
					<div class="btn_fix_center">
						<a href="javascript:doLogin();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">로그인</span></a>
						<a href="javascript:goTab(1);" class="btn btn_mdle btn_blue btn_basic"><span class="btn_txt">비밀번호 찾기</span></a>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- //content -->
</div>
<!-- //container -->

<!-- 회원정보로  찾기 -->

<div class="pop_layer pop_type open" id="certification" style="display:none;">
<form class="form-horizontal" method="post" name="signup" id="signup"  action="<c:url value='/User/Search_id.pz'/>" >
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>회원정보 인증</h2>
		</div>
		<div class="pop_content">
			<div class="certification_pop">
				<p class="txt_info_guide">회원 가입 시 등록한 이메일 를 입력해 주세요.</p>
				<div class="certification_form">
					<ul>
						<li class="form_name">
							<label for="u_name">이름</label>
							<div class="form_group">
								<div class="form_field">
									<div class="form_item">
										<input type="text" name="name" id="name_i" class="i_text" onkeyup="javascript:Name_Error()">
									</div>
									<span id="name_error" style="color: red; font-weight: 600;"></span>
								</div>
							</div>
						</li>
						<li class="form_birth">
							<label for="u_phone">생년월일</label>
							<div class="form-inline">
               <div class="form-group">
                  <select name="yyyy" id="yyyy" class="form-control" onclick="javascript:Birth_Error()">
                     <option value="0">년도</option>
                     <c:forEach begin="1920" end="2017" var="i">
                        <option value="${i}">${i}</option>
                     </c:forEach>
                  </select>

                     <select name="mm" id="mm" class="form-control" onclick="javascript:Birth_Error()">
                        <option value="0">월</option>
                        <c:forEach begin="1" end="12" var="i">
                           <option value="${i}">${i}</option>
                        </c:forEach>
                     </select>
 
                     <select name="dd" id="dd" class="form-control" onclick="javascript:Birth_Error()">
                        <option value="0">일</option>
                        <c:forEach begin="1" end="31" var="i">
                           <option value="${i}">${i}</option>
                        </c:forEach>
                     </select>
                  </div>    
                  <span id="birth_error" style="color: red; font-weight: 600;"></span>
            </div>
						</li>
						<li class="form_phone">
							<label for="u_phone">휴대전화번호</label>
							<div class="form_group">
								<div class="form_field">
									<div class="sel_box">
										<select name="tel1" id="tel1">
											<option value="010"/>010</option>
											<option value="011"/>011</option>
											<option value="016"/>016</option>
											<option value="017"/>017</option>
											<option value="018"/>018</option>
											<option value="019"/>019</option>
											<option value="1577"/>1577</option>
										</select>
									</div>
								</div>
								<div class="form_field">
									<div class="form_item">
										<input type="text" name="tel2" id="tel2" maxlength="4" class="i_text" onkeyup="javascript:Tel_Error()">
									</div>
								</div>
								<div class="form_field">
									<div class="form_item">
										<input type="text" name="tel3" id="tel3" maxlength="4" class="i_text" onkeyup="javascript:Tel_Error()">
									</div>
								</div>
								<span id="tel_error" style="color: red; font-weight: 600;"></span>
							</div>
						</li>
						<li class="form_certi_num">
							<label for="u_certi_num">이메일</label>
							<div class="form_group">
								<div class="form_field">
									<div class="form_item">
										<input type="email" name="email" id="email" maxlength="50" class="i_text" onkeyup="javascript:Email_Error()">
									</div>
									<span id="email_error" style="color: red; font-weight: 600;"></span>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="btn_wrap">
					<div class="btn_fix_center">
						<a href="javascript:findIdByInside();" class="btn btn_mdle btn_red btn_block"><span class="btn_txt">아이디찾기</span></a>
					</div>
				</div>

			</div>

		</div>

		<a href="#" class="btn_ico btn_close">닫기</a>
	</div>
	</form>
</div>

<!-- 이메일로 찾기 -->

<div class="pop_layer pop_type open" id="certification_email" style="display:none;">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>이메일 인증</h2>
			<br>
							<br>
		</div>
		<div class="pop_content">
			<div class="certification_pop">
			<br>
				<p class="txt_info_guide">회원 가입 시 등록한 이메일 를 입력해 주세요.</p>
				<br>
				<div class="certification_form">
					<ul>
						<li class="form_name">
							<label for="u_name">이름</label>
							<br>
							
							<div class="form_group">
								<div class="form_field">
									<div class="form_item">
										<input type="text" name="name_email" id="name_email" class="i_text" onkeyup="javascript:Name_Error()">
									</div>
									<span class="name_error" id="u_name_f"></span>
								</div>
							</div>
						</li>
						
						<li class="form_certi_num">
						<br>
							
							<label for="u_certi_num">이메일</label>
							<div class="form_group">
								<div class="form_field">
									<div class="form_item">
										<input type="email" name="email" id="email_email" maxlength="50" class="i_text">
									</div>
									<span class="i_error show" id="security_alert"></span>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<br>
				<div class="btn_wrap">
					<div class="btn_fix_center">
						<a href="javascript:findIdBy_EmailInside();" class="btn btn_mdle btn_red btn_block"><span class="btn_txt">아이디찾기</span></a>
					</div>
				</div>

			</div>

		</div>

		<a href="#" class="btn_ico btn_close">닫기</a>
	</div>
</div>

<script type="text/javascript" src="/resources/js/member.js"></script>
<script type="text/javascript">
//탭 이동
function goTab(idx){
	$(".srch_area").hide();
	$(".btn_tab li").removeClass("active");
	$(".btn_tab li").eq(idx).addClass("active");
	$(".srch_area").eq(idx).show();
}

$(document).ready(function(){
	goTab("0");
	$('.btn_close').bind('click', function () {
		$("#certification").hide();
	});
});

$(document).ready(function(){
	goTab("0");
	$('.btn_close').bind('click', function () {
		$("#certification_email").hide();
	});
});

//아이디 찾기 - 이메일 본인 인증
function findIdByEmail() {
	window.open('/member/regKGAuth?authType=findId', 'popupChk', 'width=500, height=550, toolbar=no, directories=no, scrollbars=no, resizable=no, status=no, menubar=no, top=0, left=0');
}

//비밀번호 찾기 - 회원정보 인증
function findPwdByMember() {
	var pwd = $("#pwd").val()
	var name = $("#name").val()
	if($("#name").val() == ''){
	alert('이름을 입력 하세요')		
	}
	else if($("#id").val() == ''){
	alert('아이디 를 입력 하세요')
	}
	else if($("#pwd").val() == ''){
		alert('변경하실 비밀번호를 입력 하세요')
	}
	else if(pwd.length > 15){
		alert('변경하실 비밀번호는 15자 내외로 입력 하세요')
	}
	else{
	searchpwd.submit();
	}
}

//이메일 인증
function findPwdByEmail() {
	if($("#name").val() == ''){
	alert('이름을 입력 하세요')		
	}
	else if($("#id").val() == ''){
	alert('아이디 를 입력 하세요')
	}
	else{
	
	}
}


// 인증번호 발송
function doSendAuthKey() {
	if($('#email_1').val() == ''){ alert("이메일을 입력해 주세요."); $('#tel2').focus(); return; }
	if($('#email_2').val() == ''){ alert("이메일 도메인 주소를 입력해 주세요."); $('#tel3').focus(); return; }
	if (confirm("인증번호 발송 후에는 이메일 수정이 불가합니다.\n인증번호를 발송하시겠습니까?")) {
		$("#tel_alert").text("");
		$("#email_alert").text("");
		var email1 = $("#email_1").val();
		var email2 = $("#email_2").val();
		hideMemberInfo();
		memberAuthSend('H', '', tel1, tel2, tel3, "Y");
	}
}


// 인증 성공 시 폼 셋팅
function hideMemberInfo() {
	$("[id^='u_phone']").parent().addClass("disabled");
	$("#tel1, #tel2, #tel3").prop("disabled", true);
}

// 인증 실패 시 폼 셋팅
function showMemberInfo() {
	$("[id^='u_phone']").parent().removeClass("disabled");
	$("#tel1, #tel2, #tel3").prop("disabled", false);
}


//세팅값 초기화 시키기 - 회원정보 인증
function delSetting(){
	$('#tel2').val('');
	$('#tel3').val('');
	$('#name_i').val('');
	$('#email').val('');
	$("#yyyy").val('0');
	$("#mm").val('0');
	$("#dd").val('0');
	$("#tel1").val('010');
}
//세팅값 초기화 시키기 - 이메일 인증
function delSetting_email(){
	$('#name').val('');
	$('#email').val('');
}
 
// 회원정보 인증 아이디 찾기 팝업
function openIdByInside(){
	$("[id='certification']").show();
	delSetting(); //초기화 메소드 
}

function openEmailByInside(){
	$("[id='certification_email']").show();
	delSetting_email(); //초기화 메소드
}

//이메일 인증 



// 회원정보 인증 아이디 찾기
function findIdByInside(){
	if(a+b+c+d == 4){
		signup.submit();
	}
	else{
		alert('정보를 정확하게 입력해 주세요');
	}
}

// 이메일 인증 아이디 찾기
function findIdBy_EmailInside(){

	$.ajax(
			 {url: '<c:url value="/User/SendEmailBySearchID.pz"/>',
		        type: 'POST',
		        data:"email="+$("#email_email").val()&"name="+$("#name_email").val(),
		        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
		        success: function (result) {
		        	alert("이메일 : "+$("#email_email").val());
		        }        			 
		
			 });

}

//비밀번호 변경 처리
function updateChangePasswd() {
	$("#passwd_alert").text("");
	$("#confirmpw_alert").text("");

	if ($('#passwd').val() == ""){
		$("#passwd_alert").text("새 비밀번호를 입력해 주세요.");
		$('#passwd').focus();
	}
	if ($('#confirmpw').val() == ""){
		$("#confirmpw_alert").text("새 비밀번호를 입력해 주세요.");
		$('#confirmpw').focus();
	}
	if (!isValidPwd($("#passwd").val())) {
		$("#passwd").focus();
		return;
	}
	if ($('#passwd').val() != $('#confirmpw').val()) {
		$("#confirmpw_alert").text('비밀번호가 일치하지 않습니다.');
		$("#confirmpw").focus();
		return;
	}

	if(confirm("해당 내용으로 수정하시겠습니까?")){
		$.ajax({
			type: "POST",
			url: "/member/changePwdAjax",
			data: { id : $("#userId").val(),
					passwd : $('#passwd').val() },
			dataType : "json",
			success:function(data) {
				if (data.status == "success"){
					alert(data.msg);
					location.href = "/global/login";
				} else {
					if(data.code != ""){
						$("#"+data.code+"_alert").text(data.msg);
						$("#"+data.code).focus();
					}else{
						alert(data.msg);
					}
					return;
				}
			},
			error: function (error){
				alert("다시 시도해주세요.");
			}
		});
	}
}
</script>
<!-- 로딩 이미지 -->
		<div class="loading" id="defaultLoading" style="display:none;">
			<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/loading.gif" alt="loading">
			<div class="dim"></div>
		</div>
		<!-- // 로딩 이미지 -->

		<!-- 장바구니 담기 토스트 팝업(s) -->
		<div class="pop_toast" id="card_add">
			<div class="bg"></div>
			<div class="pop_wrap">
				<div class="pop_content">
					<p>장바구니에 담았습니다.</p>
				</div>
			</div>
		</div>

		<!-- //장바구니 담기 토스트 팝업(e) -->

		<!-- 장바구니(s) -->
		<div class="pop_layer pop_type" id="cart_pop">
			<div class="bg"></div>
			<div class="pop_wrap">
				<div class="pop_header">
					<h2>장바구니</h2>
				</div>
				<!-- iframe src="100_cart_pop_frame.html" width="1000" height="832" frameborder="0"></iframe><!-- 2016-10-05//아이프레임대체 -->
				<a href="javascript:;" onclick="setBasketCnt();" class="btn_ico btn_close">닫기</a>
			</div>
		</div>
		
<%@include file="/WEB-INF/Pizza/template/foot.jsp" %>
		
</html>
