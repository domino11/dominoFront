<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<html lang="ko">
<head>
<!-- 2] CDN(Content Deliver Network)주소 사용-->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- Deprecated 된 함수사용 -->
<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
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

	/* 
	var myOrderDetail = function() {
		var order_no = $('#tracker_order_no').val();
		location.href="/mypage/myOrderView?order_no="+order_no+"&pageNo=1"
	};
 */
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

	
<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="login_wrap">
	
		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="<c:url value='/Pizza/MainPage.pz'/>">HOME</a></li>
				<li><span>로그인</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>로그인</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="tab_type">
			<ul class="btn_tab">
				<li class="active"><a>회원 로그인</a></li>
			</ul>
		</div>

		<div class="login_area">
			<form id="loginFrm" name="loginFrm" action="<c:url value='"/User/LoginCheck.pz"'/>" method="post">
				<input type="hidden" name="redirectUrl" id="redirectUrl" value="/main" />
				<input type="hidden" name="partycar_seq" id="partycar_seq" value="" />
				<input type="hidden" name="event_gubun" id="event_gubun" value="" />
				<fieldset>
					<div class="form_box">
						<ul>
							<li>
								<div class="form_item">
									<label for="id" class="i_label"></label>
									<input type="text" name="id" id="id" maxlength="20" class="i_text" placeholder="아이디">
								</div>
							</li>
							<li>
								<div class="form_item">
									<label for="passwd" class="i_label"></label>
									<input type="password" name="pwd" id="pwd" maxlength="20" placeholder="비밀번호" class="i_text" >
								</div>
							</li>
						</ul>
						<a href="javascript:doLoginSSL();" class="btn btn_mdle btn_red"><span class="btn_txt">로그인</span></a>
					</div>
					<span class="custom_form">
						<input type="checkbox" name="idcheck" id="idcheck">
						<label for="idcheck" class="ip_chk">
							<em></em><span>아이디 저장</span>
						</label>
					</span>
					<div class="lst_type_dot">
						<ul>
							<li>
								<span>아직 도미노피자 회원이 아니세요?</span>
								<a href="<c:url value='/User/Join.pz'/>" class="btn"><span class="btn_txt">회원가입하기</span></a>
							</li>
							<li>
								<span>아이디와 비밀번호를 잊으셨나요?</span>
								<a href="<c:url value='/User/DominoSearchforIDorPWD.pz'/>" class="btn"><span class="btn_txt">아이디/비밀번호 찾기</span></a>
							</li>
						</ul>
					</div>
				</fieldset>
			</form>

			<!-- 2017-03-27 // benefits_area 추가(s)-->
			<span></span>
			<div class="benefits_area">
				<div class="tit_box">
					<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/img_benefits.png" alt="온라인 회원이면 누구나 누릴 수 있는 도미노 온라인 매니아!">
				</div>
				<div class="tbl_benefits">
					<dl>
						<dt>도미노피자 온라인 매니아 혜택</dt>
						<dd>
							<ul>
								<li>* 회원가입 시 온라인 매니아 Regular 등급 혜택 즉시 제공</li>
								<li>* 가입 시 E-mail과 SMS 수신동의 또는 기존 정보 업데이트 시, 방문포장 40% 할인 제공</li>
							</ul>
						</dd>
					</dl>
					<span>2017년 5월 1일 기준</span>
					<!-- 2017-04-24 // table 수정(s) -->
					<table class="tbl_type">
						<caption>혜택 리스트</caption>
						<colgroup>
							<col width="16%">
							<col width="21%">
							<col width="21%">
							<col width="21%">
							<col width="21%">
						</colgroup>
						<thead>
							<tr>
								<th>등급</th>
								<th><span class="ico_benefits"></span></th>
								<th><span class="ico_benefits2"></span></th>
								<th><span class="ico_benefits3"></span></th>
								<th><span class="ico_benefits4"></span></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>등급 산정 조건</td>
								<td>최근 3개월 주문횟수<br>0~1회 구매고객</td>
								<td>최근 3개월 주문횟수<br>2~5회 구매고객</td>
								<td>최근 3개월 주문횟수<br>6회 이상 구매고객</td>
								<td>2010년 이후<br>200만원 이상 구매고객</td>
							</tr>
							<tr>
								<td rowspan="4">혜택<br>(매월제공)</td>
								<td colspan="3">배달주문 20% 할인쿠폰</td>
								<td>상시 배달주문 20% 할인</td>
							</tr>
							<tr>
								<td>배달주문<br>20% 할인쿠폰</td>
								<td>배달주문<br>25% 할인쿠폰</td>
								<td>배달주문<br>30% 할인쿠폰</td>
								<td>배달주문<br>30% 할인쿠폰</td>
							</tr>
							<tr>
								<td>-</td>
								<td>방문포장<br>35% 할인쿠폰</td>
								<td>방문포장<br>40% 할인쿠폰</td>
								<td>방문포장<br>40% 할인쿠폰</td>
							</tr>
							<tr>
								<td>-</td>
								<td>-</td>
								<td>생일 방문포장<br>50% 할인쿠폰</td>
								<td>생일 방문포장<br>50% 할인쿠폰</td>
							</tr>
						</tbody>
					</table>
					<!-- 2017-04-24 // table 수정(e) -->
					<p>※ 등급 선정은 온라인 구매내역으로 산정됩니다.</p>

					<dl>
						<dt>인터넷 방문포장 할인 혜택 (PC 웹사이트, 모바일 웹, 앱)</dt>
						<dd>
							<ul>
								<li>* 인터넷 방문포장 주문 시 매장 별 최대 30% 할인<br>(매장 별 할인율 다름)</li>
							</ul>
						</dd>
					</dl>
				</div>
			</div>
			
		</div>

		

	</div>
	<!-- //content -->
</div>
<!-- //container -->

<div class="pop_layer pop_type" id="login_fail">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>로그인 실패</h2>
		</div>
		<div class="pop_content">
			<strong>로그인에 실패하셨습니다.</strong>
			<p>
				회원정보를 다시 확인해주시고, 정상적으로 진행되지 않을 경우<br>
				아래 아이디/비밀번호 찾기로 확인해주시기 바랍니다.
				
			</p>
			<a href="<c:url value='/User/DominoSearchforIDorPWD.pz'/>" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">아이디/비밀번호 찾기</span></a>
			<div class="lst_type v5">
				<ul>
					<li>전화문의 : <em>080-860-3082 </em></li>
					<li>E-mail 문의 : <a href="mailto:webmaster@dominos.co.kr"><em>webmaster@dominos.co.kr</em></a></li>
				</ul>
			</div>
		</div>
		<a href="#" class="btn_ico btn_close">닫기</a>
	</div>
</div>
<iframe name="nonLogin" id="nonLogin" frameborder="0" src="" width="0" height="0" style="display:none" title="비회원 로그인"></iframe>

<form name="chgPasswdFrm" id="chgPasswdFrm" action="/main" method="post">
<input type="hidden" name="redirectUrl" id="redirect_url" value=""/>
<input type="hidden" name="changePwd" id="changePwd" value="Y"/>
</form>

<script type="text/javascript">

//탭 이동
function goTab(idx){
	$(".login_area").hide();
	$(".btn_tab li").removeClass("active");
	$(".btn_tab li").eq(idx).addClass("active");
	$(".login_area").eq(idx).show();
}

//로그인 처리

function doLoginSSL() {
	
	var loginId = $('#id').val();
	var loginPwd = $('#pwd').val();
	
	if (loginId.length == 0){
		alert("아이디를 입력해주세요.");
		$('#id').focus();
		return;
	}
	if (loginPwd.length == 0){
		alert("비밀번호를 입력해주세요.");
		$('#pwd').focus();
		return;
	}
	else{
		$.ajax({
			type: "POST",
			url: "<c:url value='/User/LoginCheck.pz'/>",
			data:   { 
					"id" : loginId,
					"pwd" : loginPwd,
					},
					success:function(data) {
						if(data == "http://localhost:8080/DominoPizza/User/Login.pz"){
							alert('존재하지 않는 계정 입니다');
						}
						else{
							
						}
						location.href=data;
					}
		});
		
	}
	
	
	
	
}


 





</script>

		

		
		
		<%@include file="/WEB-INF/Pizza/template/foot.jsp" %>
		
	

</html>
