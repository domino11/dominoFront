<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
   String sucfail = (String) session.getAttribute("SUC_FAIL");
    
     %>
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
	<script type="text/javascript" src="/resources/js/jquery1.11.1.js"></script>
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
	<div id="content" class="mypage">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><a href="/mypage/myOrderList">나의 정보</a></li>
				<li><span>설정변경</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>나의 정보</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="tab tab_type4">
		
		
			<ul class="btn_tab" onclick="none" >
				<li class=""><a href="<c:url value='/User/MyPage_Mania.pz'/>">매니아 등급</a></li>
				<li class=""><a href="<c:url value='/User/Mypage_OrderHistory.pz'/>">주문조회</a></li>
				<li class=""><a href="<c:url value='/User/Mypage_coupon.pz'/>">쿠폰</a></li>
				<li class="active"><a href="<c:url value='/User/Mypage_ChangeSetting.pz'/>">설정변경</a></li>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content">
				<jsp:include page="/User/MyPage_Mania.pz" />
				</div>
				<!-- //tab_content -->
				<div class="tab_content">2</div>
				<div class="tab_content">3</div>
				<div class="tab_content active">
					<div class="join_area">
						<div class="join_info_guide">
							<dl>
								<dt>개인정보 입력 안내문</dt>
								<dd>회원정보를 정확히 기입하셔야 주문이나 이벤트에 대한 불이익이 없습니다.</dd>
							</dl>
						</div>
						 <form class="form-horizontal" method="post" name="signup" id="signup"  action="<c:url value='/User/ChangeSetting.pz'/>" > 
						<div class="join_form">
							<ul>
								<li class="form_name">
									<label for="">이름</label>
									${NAME}
									<span class="u_text" id="name_area"></span>
								</li>
								<li class="form_id">
									<label for="">아이디</label>
									${ID}
									<span class="u_text"></span>
								</li>
								<li class="form_pw v2">
									<label for="">비밀번호</label>
									<a href="javascript:showPwdPop()" class="btn"><span class="btn_txt">비밀번호 변경</span></a>
								</li>
								<li class="form_birth">
									<label for="birth_s">생년월일</label>
									<div class="form_group">

										<div class="form_field">
											<div class="sel_box" style="width:120px;">
												 <select name="yyyy" id="yyyy" class="form-control" onclick="javascript:CheckBirth()">
                     								<option value="0">년도</option>
                     								<c:forEach begin="1920" end="2017" var="i">
                        							<option value="${i}">${i}</option>
                    								 </c:forEach>
                  										</select>
											</div>
										</div>
										<div class="form_field">
											<div class="sel_box" style="width:120px;">
												<select name="mm" id="mm" class="form-control" onclick="javascript:CheckBirth()">
                        							<option value="0">월</option>
                        								<c:forEach begin="1" end="12" var="i">
                           									<option value="${i}">${i}</option>
                        								</c:forEach>
                     							</select>
											</div>
										</div>
										<div class="form_field">
											<div class="sel_box" style="width:120px;">
												<select name="dd" id="dd" class="form-control" onclick="javascript:CheckBirth()">
                        							<option value="0">일</option>
                        								<c:forEach begin="1" end="31" var="i">
                           							<option value="${i}">${i}</option>
                        								</c:forEach>
                     							</select>
											</div>
										</div>
										<span id="CheckBirth" style="color: red; font-weight: 600;"></span>
									</div>
								</li>
								<li class="form_phone">
									<label for="u_phone">휴대전화</label>
									<div class="form_group">
										<div class="form_field">
											<div class="sel_box" style="width:120px;">
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
												<span class="i_label" style="position: absolute;"></span>
												<input type="text" name="tel2" id="tel2" maxlength="4" class="i_text" onkeyup="javascript:CheckTel()">
											</div>
										</div>
										<div class="form_field">
											<div class="form_item">
												<span class="i_label" style="position: absolute;"></span>
													<input type="text" name="tel3" id="tel3" maxlength="4" class="i_text" onkeyup="javascript:CheckTel()">
											</div>
										</div>
										<span id="CheckTel" style="color: red; font-weight: 600;"></span>
									</div>
								</li>
								<li class="form_email">
									<label for="u_email">이메일</label>
									<div class="form_group">
										<div class="form_field">
											<div class="form_item">
												<label for="" class="i_label" style="position: absolute;"></label>
												<input type="text" name="email1" id="email1" value="" class="i_text" onkeyup="javascript:CheckEmail()">
											</div>
										</div>
										<div class="form_field"><span class="txt_at">@</span></div>
										<div class="form_field">
											<div class="form_item">
												<label for="" class="i_label" style="position: absolute;"></label>
												<input type="text" name="email2" id="email2" value="" class="i_text" onkeyup="javascript:CheckEmail()">
											</div>
										</div>
										
						</div>			
						<span id="CheckEmail" style="color: red; font-weight: 600;"></span>			
								</li>
								
						<div class="btn_wrap">
							<div class="btn_fix_center">
								<a href="javascript:reload();" class="btn btn_mdle btn_blue btn_basic"><span class="btn_txt">초기화</span></a>
								<a href="javascript:compleate();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">수정</span></a>
							</div>
						</div>
						<!-- //btn_wrap -->
						<div class="withdraw">
							도미노피자를 더 이상 이용하지 않는다면 <a href="javascript:;"><em>회원탈퇴 바로가기<span class="ico ico_more"></span></em></a>
						</div>
						</ul>
					</div>
						</form>
					<!-- //join_area -->
					</div>
				</div>
				<!-- //tab_content -->
			</div>
			<!-- //tab_content_wrap -->
		</div>
		<!-- //tab -->
	</div>
	<!-- //content -->
</div>
<!-- //container -->

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
		<div class="pop_layer pop_type" id="userinfo_confirm_change">
	<form name="popPwdForm" id="popPwdForm" action="<c:url value='/User/ChangePwd.pz'/>" method="post">
	<div class="bg"></div>
	<div class="pop_wrap" style="top: 30px;">
		<div class="pop_header">
			<h2>비밀번호 변경</h2>
		</div>
		<div class="pop_content">
			<div class="lst_type_dot pw">
				<ul>
					<li>
						<label for="old_passwd">현재 비밀번호</label>
						<div class="form_group">
							<div class="form_field">
								<div class="form_item">
									<input type="password" name="oldpwd" id="oldpwd" maxlength="16" class="i_text" onkeyup="javascript:CheckOldPwd()">
								</div>
							</div>
							<span id="CheckOldPwd" style="color: red; font-weight: 600;"></span>
						</div>
					</li>
					<li>
						<label for="passwd">새 비밀번호</label>
						<div class="form_group">
							<div class="form_field">
								<div class="form_item">
									<span for="passwd" class="i_label" style="position: absolute;"></span>
									<input type="password" name="pwd" id="pwd" maxlength="16" class="i_text" onkeyup="javascript:CheckPwd()">
								</div>
							</div>
							<span id="Checkpwd" style="color: red; font-weight: 600;"></span>
						</div>
					</li>
					<li>
						<label for="confirmpw">새 비밀번호 확인</label>
						<div class="form_group">
							<div class="form_field">
								<div class="form_item">
									<span for="confirmpw" class="i_label" style="position: absolute;"></span>
									<input type="password" name="newpwd" id="newpwd" maxlength="16" class="i_text" onkeyup="javascript:CheckNewPwd()">
								</div>
							</div>
							<span id="CheckNewpwd" style="color: red; font-weight: 600;"></span>
						</div>
					</li>
				</ul>
			</div>

			<div class="btn_wrap">
				<div class="btn_fix_center">
					<a href="javascript:updateChangePasswd();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">수정하기</span></a>
				</div>
			</div>
		</div>
		<a href="javascript:;" class="btn_ico btn_close">닫기</a>
	</div>
	</form>
</div>
	<script>
	
	//비밀번호 변경
	function showPwdPop(){
	$("#popPwdForm")[0].reset();
	$("#userinfo_confirm_change").addClass("open");
}
	
	//유효성 검사
	
	function CheckOldPwd(){
		var pwd = $("#oldpwd").val();
		if(pwd.length == 0){
			$("#CheckOldPwd").get(0).innerHTML="현재 비밀번호 를 입력해 주세요";
		}
		else{
			$("#CheckOldPwd").get(0).innerHTML="";
		}
	}
	
	function CheckPwd(){
		var pwd = $("#pwd").val();
		if(pwd.length == 0){
			$("#Checkpwd").get(0).innerHTML = "변경하실 비밀번호를 입력해 주세요";
		}
		else{
			$("#Checkpwd").get(0).innerHTML = "";
		}
	}
	
	function CheckNewPwd(){
		var pwd = $("#pwd").val();
		var newpwd = $("#newpwd").val();
		if(newpwd.length == 0){
			$("#CheckNewpwd").get(0).innerHTML = "새 비밀번호 확인 를 입력해 주세요";
		}
		else if(pwd != newpwd){
			$("#CheckNewpwd").get(0).innerHTML ="비밀번호가 일치하지 않습니다";
		}
		else{
			$("#CheckNewpwd").get(0).innerHTML ="";	
		}
		
	}
	
	//비밀번호 변경 수정 처리
	function updateChangePasswd(){
	if($("#CheckNewpwd").get(0).innerHTML="" || $("#Checkpwd").get(0).innerHTML == "" || $("#CheckOldPwd").get(0).innerHTML == ""){
		popPwdForm.submit(); 
		
	}		
	else{
		alert('비밀번호 수정 정보를 정확하게 입력해 주세요');
	}
	
		
	}
	
	//초기화 메소드
	function reload(){
		$("#tel1").val('010');
		$("#tel2").val('');
		$("#tel3").val('');
		$("#yyyy").val('0');
		$("#mm").val('0');
		$("#dd").val('0');
		$("#email1").val('');
		$("#email2").val('');
	}
	
	
	
	//유효성 검사 
	
	function CheckBirth(){
		var year = $("#yyyy").val();
		var month = $("#mm").val();
		var day = $("#dd").val();
		if(year == 0 || month == 0 || day == 0){
			$("#CheckBirth").get(0).innerHTML = "수정할 생년월일을 선택 하세요";
		}
		else{
			$("#CheckBirth").get(0).innerHTML = "";
		}
	}
	
	function CheckTel(){
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();
		if(tel2 == '' || tel3 == ''){
			$("#CheckTel").get(0).innerHTML = "수정할 전화번호를 입력 하세요";
		}
		else{
			$("#CheckTel").get(0).innerHTML = "";
		}
	}
	
	function CheckEmail(){
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		if(email1 == '' || email2 == ''){
			$("#CheckEmail").get(0).innerHTML = "수정할 이메일을 입력 하세요";
		}
		else{
			$("#CheckEmail").get(0).innerHTML = "";
			}
		}///CheckEmail()
	//유효성 검사 및 Submit 메소드
	function compleate(){
		if($("#CheckEmail").get(0).innerHTML.length+$("#CheckTel").get(0).innerHTML.length+$("#CheckBirth").get(0).innerHTML.length==0){
			signup.submit();
		}
		else{
			alert("수정하실 정보를 정확히 입력해 주세요.");
		}
	}

	
	</script>
		
</body>
</html>
