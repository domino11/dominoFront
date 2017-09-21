<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<link rel="shortcut icon" href="<c:url value='/Pizza/Image/favicon.ico'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/font.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css'/>">
<script type="text/javascript" src="<c:url value='/Pizza/js/jquery1.11.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery.flexslider.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/selectbox.js'/>"></script><!-- js 수정함. -->
	<script type="text/javascript" src="<c:url value='/Pizza/js/d2CommonUtil.js'/>"></script>
	<%-- <script type="text/javascript" src="<c:url value='/Pizza/js/Cookie.js'/>"></script> --%> <!-- 오류 부분 -->
	<script type="text/javascript" src="<c:url value='/Pizza/js/basket_w.js'/>"></script>
	<script type="text/javascript">
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";

	$(document).ready(function() {
		$.ajaxSetup({cache:false});
		$(".gnb_menu .menu04").addClass("on");
		setBasketCnt();

		// 마이쿠폰 정보 조회(가입회원)
		

		// 주문&주문트레커 조회(가입회원/인증회원)
		
	});

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

</script>
<!-- // Naver Anlytics 공통-->

<!-- 카이젠 공통-->
<script data-kz-key="7944084e2b522564" data-kz-namespace="kzs"
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

	<!-- wrap  -->
	<div id="wrap">
	<jsp:include page="/WEB-INF/Pizza/template/Top.jsp" />
	

	<script>
$(document).ready(function() {
	$(".gnb_menu .menu04").addClass("on");
});
</script>
<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="event">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><a href="<c:url value='/Pizza/BuyPizza/hnh.pz'/>">내맘대로 피자</a></li>
				<li><span>추가 토핑 안내</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>내맘대로 피자</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="tab_type4">
			<ul class="btn_tab">
				<li><a href="<c:url value='/Pizza/BuyPizza/hnh.pz'/>">하프&하프</a></li>
				<li><a href="<c:url value='/Pizza/BuyPizza/mykitchen.pz'/>">마이 키친</a></li>
				<li class="active"><a href="<c:url value='/Pizza/BuyPizza/topping.pz'/>">추가 토핑 안내</a></li>
			</ul>
			<div class="tab_content_wrap pizza">
				<div class="tab_content">
					<span class="mykitchen_obj"></span>
				</div>
				<div class="tab_content">2</div>
				<div class="tab_content active">

					<div class="added_topping_container">
						<h3 class="title">추가 토핑</h3>
						<p class="desc">피자 옵션을 선택하시면, ‘토핑 추가하기’ 버튼이 보입니다. 토핑 추가하기 버튼을 클릭하셔서 아래의 토핑을 마음껏 추가하세요~</p>
						<div class="information_img">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/topping_infomation.jpg" alt="">
						</div>
						<div class="table_group">
							<div class="table_col">
									<div class="table_default">
										<table>
											<colgroup>
												<col style="width: 200px">
												<col>
												<col>
											</colgroup>
											<thead>
												<th>제품명</th>
												<th><span class="ico ico_large"></span><em>가격/용량</em></th>
												<th><span class="ico ico_medium"></span><em>가격/용량</em></th>
											</thead>
											<tbody>
												<c:forEach items="${toppingList}" var="toppingList">
												<tr>
													<td>${toppingList.t_name}</td><!-- 제품명 -->
													<td><fmt:formatNumber value="${toppingList.LPrice}" type="currency"/> (${toppingList.LGram}g)</td>
													<td><fmt:formatNumber value="${toppingList.MPrice}" type="currency"/> (${toppingList.MGram}g)</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							<!-- //table_col -->
						</div>
					</div>

					<div class="caution_notice">
						<p class="notice_title">추가 토핑 이용 시 주의사항</p>
						<ol>
							<li>추가 토핑은 한 판당 최대 5개만 담을 수 있습니다.</li>
							<li>추가 토핑은 할인 적용이 되지 않습니다.</li>
							<li>같은 피자를 2판 이상 주문할 경우, 추가 토핑은 피자 별 동일하게 적용됩니다.<br>피자마다 다른 토핑을 원하실 경우, 주문완료 후 해당 매장에 전화하여 주문 수정을 요청하셔야 합니다.<br>(온라인 선결제 및 포인트 승인을 하여 주문완료 시 주문은 수정되지 않습니다)<br>온라인 주문 후 수정 희망 시 "배달 시 결제"를 선택하셔야 합니다.</li>
							<li>하프&amp;하프 주문 시 추가 토핑은 전체에 고르게 분배됩니다. 특정 피자 부분에만 추가 토핑을 원하실 경우 주문서 작성 페이지 "기타 요청사항"<br> 입력란에 요청사항을 기재해주시기 바랍니다.</li>
						</ol>
					</div>

				</div>
			</div>
		</div>
		<!-- //tab -->
	</div>
	<!-- //content -->
</div>
<!-- //container -->

<!-- LOGGER 환경변수 설정 -->
<script type="text/javascript">
	_TRK_PI = "PLV";		// 웹페이지의 성격 정의
    _TRK_CP = "/메뉴/추가토핑";	// 카테고리명 전달
</script>
<!-- // LOGGER 환경변수 설정 -->
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
		<!-- //장바구니(e) -->

		<div id="footer">
			<div class="footer_wrap">
				<div class="company_info">
					<dl class="order_phone">
						<dt>전화주문</dt>
						<dd><span class="ico ico_phone"></span>1577-3082</dd>
					</dl>
					<ul class="list_sns">
						<li><a href="https://www.facebook.com/dominostory/" target="_blank" class="btn_facebook">facebook</a></li>
						<li><a href="https://twitter.com/dominostory" target="_blank" class="btn_twitter">twitter</a></li>
						<li><a href="http://blog.naver.com/dominostory" target="_blank" class="btn_blog">blog</a></li>
						<li><a href="https://www.instagram.com/dominostory/" target="_blank" class="btn_instar">instargram</a></li>
					</ul>
					<div class="footer_menu">
						<ul class="list_terms">
							<li><a href="/company/contents/overview">회사소개</a></li>
							<li><a href="/contents/privacy"><strong>개인정보 처리방침</strong></a></li>
							<li><a href="/contents/law">이용약관</a></li>
							<li><a href="/bbs/faqList?view_gubun=W&bbs_cd=online">고객센터</a></li>
						</ul>
						<ul class="list_company">
							<li>135-928 서울특별시 강남구 언주로 315 청오디피케이㈜</li>
							<li>문의 : <a href="mailto:webmaster@dominos.co.kr">webmaster@dominos.co.kr</a></li>
							<li>사업자 등록번호: 220-81-03371</li>
							<li>통신판매업신고: 강남 5064호</li>
							<li>개인정보 보호책임자 : 이명윤</li>
							<li>대표이사: 오광현</li>
						</ul>
						<address>Copyrightsⓒ2017 by Domino’s Pizza. All rights reserved.</address>
						<!-- a href="/contents/familySite" class="btn_family">family_brand</a  -->
					</div>
				</div>
				<div class="awards_area">
					<ul class="list_awards">
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards.png" alt="">
							<p>식품안전<br>경영시스템 인증</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards2.png" alt="">
							<p>지식경제부<br>우수디자인 선정</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards3.png" alt="">
							<p>고객이 가장 추천하는 기업<br/>피자전문점 부문 4년 연속 1위</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards4.png" alt="">
							<p>2016년 「대한민국인터넷소통대상」<br/>「대한민국소셜미디어대상」<br/>Leading Star (7년 연속 종합 1위)</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards5.png" alt="">
							<p>2016 한국산업의 고객만족도<br/>피자전문점 부문 2년 연속 1위</p>
						</li>
					</ul>
				</div>
			</div>
			<a href="#" class="btn_top">Top</a>
		</div>
		<!-- //footer -->
	</div>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-40278626-1', 'auto');
  ga('send', 'pageview');

</script>
<!-- LOGGER(TM) TRACKING SCRIPT V.40 FOR logger.co.kr / 21550 : COMBINE TYPE / DO NOT ALTER THIS SCRIPT. -->
<script type="text/javascript">var _TRK_LID="21550";var _L_TD="ssl.logger.co.kr";var _TRK_CDMN=".dominos.co.kr";</script>
<script type="text/javascript">var _CDN_DOMAIN = location.protocol == "https:" ? "https://fs.bizspring.net" : "http://fs.bizspring.net";
(function(b,s){var f=b.getElementsByTagName(s)[0],j=b.createElement(s);j.async=true;j.src='//fs.bizspring.net/fs4/bstrk.1.js';f.parentNode.insertBefore(j,f);})(document,'script');</script>
<noscript><img alt="Logger Script" width="1" height="1" src="http://ssl.logger.co.kr/tracker.tsp?u=21550&amp;js=N" /></noscript>
<!-- END OF LOGGER TRACKING SCRIPT -->

<!-- AceCounter Log Gathering Script V.70.2012031601-->
<script type="text/javascript" src="/resources/js/acecounter.js"></script>
<!-- AceCounter Log Gathering Script End -->

<!-- Naver Anlytics 공통-->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
<script type="text/javascript">
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_273c36e36e8a";
if (!_nasa) var _nasa={};
wcs.inflow("dominos.co.kr");
wcs_do(_nasa);
</script>
<!-- // Naver Anlytics 공통 -->
<!-- 2017-05-08 // 챗봇 추가(s) -->

<div class="layer_chat">
	<div class="dim"></div>
	<div class="layer_content">
		<iframe id="chatUrl" src="" frameborder="0"></iframe>
		<a href="#" class="btn_close">닫기</a>
	</div>
</div>
<!-- 2017-05-08 // 챗봇 추가(e) -->
		
</body>
<script>
cookieManager.makePCID("PCID", 10);
</script>
</html>
/html>