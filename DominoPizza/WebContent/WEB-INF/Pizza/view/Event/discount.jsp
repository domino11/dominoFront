<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/font.css' />">
	
	<!-- Style - 모든 예제 공통 사용하는 css-->
<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/style.css'/>" />
<!--  basic 용 css -->
	
	
	<link rel="stylesheet" type="text/css" href="<c:url value='https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css' />">
	
	<!--  베너용 -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery.jcarousel.min.js'/>"></script>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/jcarousel.connected-carousels.css' /> ">
	<script type="text/javascript" src="<c:url value='/Pizza/js/jcarousel.connected-carousels.js' /> "></script>
	
	
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery1.11.1.js' />"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/ui.js' />"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery.flexslider.js' />"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/selectbox.js' />"></script><!-- js 수정함. -->
	<script type="text/javascript" src="<c:url value='/Pizza/js/d2CommonUtil.js' />"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/Cookie.js' />"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/basket_w.js' />"></script>
	<script type="text/javascript">
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";

	$(document).ready(function() {
		$.ajaxSetup({cache:false});

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
	
	//페이코 회원 가입
	function goLoginPop() 
	{
		if(location.pathname !== '/global/login')
			location.href = '/global/login';
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
	<!-- //top_event_bnr -->

	<!-- wrap  -->
	<div id="wrap">
		<!-- header -->
			<jsp:include page="/WEB-INF/Pizza/template/Top.jsp" />
		<!-- //header -->
		

<script>
$(document).ready(function() {
	$(".gnb_menu .menu06").addClass("on");
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
						<li><span>할인</span></li>
					</ul>

				</div>
				<!-- //sub_title -->

				<!-- tab -->
				<div class="tab_type4 event">

				</div>
				<!-- //tab -->

				<div class="discount_container">
					<div class="intro_title">
						<p class="main_title">도미노를 더욱 즐겁게 이용하는 방법!</p>
						<p class="sub_desc">다양한 할인 혜택으로 도미노피자를 더 실속 있게 즐기세요!</p>
					</div>
					<!-- //intro_title -->

					<div class="discount_list">
						<p class="discount_lst_title">상시 할인</p>
						<ul class="benefit_list">
							<li>
								<div class="badge_area">
									<span class="badge_benefit"><em>1</em>혜택</span>
								</div>
								<div class="list_container">
									<div class="list_title">
										<div class="list_title"><p>온라인 회원대상 할인 혜택</p></div>
									</div>
								</div>
								<div class="benefit_table">
									가입 시 E-mail과 SMS 수신동의 또는 기존정보 업데이트 시, 방문포장 40% 할인쿠폰 제공(분기(6개월) 1회에 한함)<br>
								</div>
							</li>
							<li>
								<div class="badge_area v2">
									<span class="badge_benefit"><em>2</em>혜택</span>
								</div>
								<div class="list_content">
									<div class="list_title">
										<p class="align_l">방문포장 주문 시 피자금액의 최대 30% 할인 (매장 차등 적용)</p>
										<div class="align_r">
											<a href="/branch" class="btn"><span class="btn_txt">매장 포장할인율 확인하러가기</span></a>
										</div>
									</div>
									<div class="benefit_table">
										<table class="tbl_type">
											<caption>table</caption>
											<colgroup>
												<co style="width:250px;">
												<col style="width:190px;">
												<col style="width:190px;">
												<col>
											</colgroup>
											<thead>
												<tr>
													<th rowspan="2">제품명</th>
													<th rowspan="2">정상가</th>
													<th colspan="2">방문포장할인가</th>
												</tr>
												<tr>
													<th>30% 할인</th>
													<th>20% 할인</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>치즈피자(M)</td>
													<td>14,500</td>
													<td>10,150</td>
													<td>11,600</td>
												</tr>
												<tr>
													<td>포테이토(M) 2판</td>
													<td>37,000</td>
													<td>25,900</td>
													<td>29,600</td>
												</tr>
												<tr>
													<td>더블크러스트 치즈멜팅(L)</td>
													<td>32,900</td>
													<td>23,030</td>
													<td>26,320</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</li>
							<li>
								<div class="badge_area">
									<span class="badge_benefit"><em>3</em>혜택</span>
								</div>
								<div class="list_content">
									<div class="list_title"><p>세트(피자+사이드디시+음료) 주문 시 최대 20% 할인</p></div>
								</div>
							</li>
							<li>
								<div class="badge_area">
									<span class="badge_benefit"><em>4</em>혜택</span>
								</div>
								<div class="list_content">
									<div class="list_title"><p><화끈한 화요일>로 방문포장 피자 40% 할인 등 스페셜 할인</p></div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- //discount_container -->

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
		<!-- footer -->
		<jsp:include page="/WEB-INF/Pizza/template/foot.jsp"></jsp:include>
		<!-- //footer -->	
</body>
<script>
cookieManager.makePCID("PCID", 10);
</script>
</html>

