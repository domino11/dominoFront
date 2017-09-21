<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko"><head>
	<meta charset="euc-kr">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>도미노피자</title>
	<meta name="viewport" id="viewport" content="width=1119px, user-scalable=yes">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="pragma" content="no-cache">
	<link rel="shortcut icon" href="https://cdn.dominos.co.kr/renewal2016/ko/w/img/favicon.ico">
	<link rel="stylesheet" type="text/css" href="https://web.dominos.co.kr/resources/css/font.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css?v1.0">
<script async="" src="http://fs.bizspring.net/fs4/logger.v4.1.js">
</script><script async="" src="http://fs.bizspring.net/fs4/bstrk.1.js"></script>
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/jquery1.11.1.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/selectbox.js"></script><!-- js 수정함. -->
	<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/d2CommonUtil.js"></script>
	<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/Cookie.js"></script>
	<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/basket_w.js"></script>
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

</script>
<!-- Naver Anlytics 공통-->

<style>



</style>

<script>
var WCSLOG_URL = location.protocol == "https:" ? "https://wcs.naver.net/wcslog.js" : "http://wcs.naver.net/wcslog.js";
document.write(unescape("%3Cscript type='text/javascript' src='" + WCSLOG_URL +"' %3E%3C/script%3E"));
</script><script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<!-- // Naver Anlytics 공통-->

<!-- 카이젠 공통-->
<script data-kz-key="7944084e2b522564" data-kz-namespace="kzs" src="http://cdn.kaizenplatform.net/s/79/44084e2b522564.js" charset="utf-8" data-kz-loaded-sitejs-id="7944084e2b522564" data-kz-applied-sitejs-id="7944084e2b522564">
</script> 
<!-- 카이젠 공통-->

</head>
<body style="">
	<!-- top_event_bnr -->
	<div class="top_bnr top_event" id="lineBanner" style="background-color: rgb(238, 72, 74);">
		<div class="top_event_wrap">
			<a href="javascript:goBannerLink('/event/view?seq=84&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170719_VbL2JZQ3.jpg" alt="7월_띠배너_도미챗" onmousedown="try{_trk_clickTrace('EVT','띠 배너/7월_띠배너_도미챗');}catch(e){}"></a><a href="javascript:;" class="btn_ico btn_event_close" onclick="lineBannerClose(); return false;">close</a>
		</div>
	</div>
	<!-- //top_event_bnr -->

	<!-- wrap  -->
	<div id="wrap">
		<!-- header -->
		<div id="header">
			<div class="header_top">
				<div class="logo_area">
					<div class="util_left">
						<a href="javascript:;" class="btn_ico btn_menu">GNB</a>
						<ul class="util_menu">
							<li><a href="/main?locale=en">English</a></li>
							<li style=""><a href="/mypage/myCoupon">쿠폰 <span id="gnbCoupon"></span></a></li>
							<li><a href="/mypage/myOrderList">주문조회 <span id="gnbOrderCnt"></span></a></li>
						</ul>
					</div>
					<h1 class="logo"><a href="/main"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/logo.png" alt="Domino"></a></h1>
					<div class="util_right">
						<ul class="util_menu">
						<li><a href="/global/login">로그인</a></li>
							<li><a href="/member/regStep1">회원가입</a></li>
							</ul>
						<a href="javascript:goCart();" class="btn_ico btn_cart"><span class="cart_count"></span>장바구니</a>
					</div>
				</div>
			</div>
			<div class="menu_area">
				<ul class="gnb_menu">
					<li>
						<a href="/goods/list?dsp_ctgr=C0101" class="menu01">피자</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="/goods/list?dsp_ctgr=C0101">곡물 도우</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0102">프리미엄</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0104">클래식</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="/goods/list?dsp_ctgr=C0201" class="menu02">사이드디시</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="/goods/list?dsp_ctgr=C0201">사이드디시</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0202">음료</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0203">피클&amp;소스</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="/event/list?gubun=E0100" class="menu03">특가제품</a>
						<!--div class="depth2">
							<ul class="list_depth2">
								<li><a href="/event/list?gubun=E0100">오늘의 핫딜</a></li>
								<li><a href="/event/list?gubun=E0200">오늘의 이벤트</a></li>
								<li><a href="/event/mania">매니아 혜택</a></li>
								<li><a href="/event/discount">할인&제휴</a></li>
							</ul>
						</div-->
					</li>
					<li>
						<a href="/goods/hnh" class="menu04">내맘대로 피자</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="/goods/hnh">하프&amp;하프</a></li>
								<li><a href="/goods/mykitchen">마이 키친</a></li>
								<li><a href="/goods/topping">추가 토핑 안내</a></li>
							</ul>
						</div>
					</li>


					<li>
						<a href="/event/list?gubun=E0200" class="menu05">이벤트&amp;할인</a>
						<div class="depth2">
							<ul class="list_depth2">
								<!-- li><a href="/event/list?gubun=E0100">오늘의 핫딜</a></li-->
								<li><a href="/event/list?gubun=E0200">오늘의 이벤트</a></li>
								<li><a href="/event/mania">매니아 혜택</a></li>
								<li><a href="/event/discount">할인&amp;제휴</a></li>
<!-- 								<li><a href="/event/pizzaSchoolView">피자교실</a></li> -->
							</ul>
						</div>
					</li>
					<li>
						<a href="/ecoupon/index" class="menu06">쇼핑몰 쿠폰</a>
					</li>
					<li>
						<a href="/contents/present" class="menu07">선물하기</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="/contents/present">전체</a></li>
								<li><a href="/voucher/list?gubun=J">지류상품권</a></li>
								<li><a href="/voucher/list?gubun=M">모바일상품권</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			<div class="whole_menu_area">
				<div class="whole_menu_wrap">
					<ul class="whole_menu">
						<li>
							<a href="/goods/list?dsp_ctgr=C0101">피자</a>
							<ul class="list_depth2">
								<li><a href="/goods/list?dsp_ctgr=C0101">곡물 도우</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0102">프리미엄</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0104">클래식</a></li>
							</ul>
						</li>
						<li>
							<a href="/goods/list?dsp_ctgr=C0201">사이드디시</a>
							<ul class="list_depth2">
								<li><a href="/goods/list?dsp_ctgr=C0201">사이드디시</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0202">음료</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0203">피클&amp;소스</a></li>
							</ul>
						</li>
						<li>
							<a href="/event/list?gubun=E0100">특가제품</a>
							<ul class="list_depth2">
								<li><a href="/event/list?gubun=E0100">특가제품</a></li>
							</ul>
						</li>
						<li>
							<a href="/goods/hnh">내맘대로 피자</a>
							<ul class="list_depth2">
								<li><a href="/goods/hnh">하프&amp;하프</a></li>
								<li><a href="/goods/mykitchen">마이 키친</a></li>
								<li><a href="/goods/topping">추가 토핑 안내</a></li>
							</ul>
						</li>
						<li>
							<a href="/event/list?gubun=E0200">이벤트&amp;할인</a>
							<ul class="list_depth2">
								<!-- li><a href="#">오늘의 핫딜</a></li-->
								<li><a href="/event/list?gubun=E0200">오늘의 이벤트</a></li>
								<li><a href="/event/mania">매니아 혜택</a></li>
								<li><a href="/event/discount">할인&amp;제휴</a></li>
							</ul>
						</li>
						<li>
							<a href="/ecoupon/index">쇼핑몰 쿠폰</a>
							<ul class="list_depth2">
								<li><a href="/ecoupon/index">쇼핑몰 쿠폰</a></li>
							</ul>
						</li>
						<li>
							<a href="/contents/present">선물하기</a>
							<ul class="list_depth2">
								<li><a href="/contents/present">전체</a></li>
								<li><a href="/voucher/list?gubun=J">지류상품권</a></li>
								<li><a href="/voucher/list?gubun=M">모바일상품권</a></li>
							</ul>


						</li>
						<li>
							<a href="/branch">매장찾기</a>
							<ul class="list_depth2">
								<li><a href="/branch">매장찾기</a></li>
							</ul>
						</li>
						<li>
							<a href="/quickOrder/index">퀵 오더</a>
							<ul class="list_depth2">
								<li><a href="/quickOrder/index">퀵 오더 설정</a></li>
							</ul>
						</li>

						<li>
							<a href="/bbs/faqList?view_gubun=W&amp;bbs_cd=online">고객센터</a>
							<ul class="list_depth2">
								<li>
									<a href="/bbs/faqList?view_gubun=W&amp;bbs_cd=online">FAQ</a>
									<ul class="list_depth3">
										<li><a href="/bbs/faqList?bbs_cd=online9">단체주문</a></li>
									</ul>
								</li>
								<li><a href="/bbs/qnaForm">온라인 신문고</a></li>
							</ul>
						</li>
						<li>
							<a href="/bbs/newsList?type=N">공지사항</a>
							<ul class="list_depth2">
								<li><a href="/bbs/newsList?type=N">도미노 뉴스</a></li>
								<li><a href="/bbs/newsList?type=P">Press</a></li>
							</ul>
						</li>
						<li>
							<a href="/company/contents/overview">회사소개</a>
							<ul class="list_depth2">
								<li><a href="/company/contents/overview">한국도미노피자</a></li>
								<li><a href="/company/tvcfList">광고갤러리</a></li>
								<li><a href="/company/contents/society">사회공헌활동</a></li>
								<li><a href="/company/contents/chainstore1">가맹점 모집</a></li>
								<li><a href="/company/jobList?type=R">인재채용</a></li>
							</ul>
						</li>
						<li>
							<a href="#">DomiChat</a>
							<ul class="list_depth2">
								<li><a href="/event/view?seq=84&amp;gubun=E0200">DomiChat이란?</a></li>
							</ul>
						</li>						
					</ul>
					<a href="/event/view?seq=84&amp;gubun=E0200" class="btn_ico btn_close2">닫기</a>
				</div>
			</div>
		</div>
		<!-- //header -->

<div id="container">
	<div class="main_floating">
		<div class="quick_menu">
			<a href="javascript:goOrder('O');" class="quick_order"><span>온라인<br>주문하기</span></a>
		</div>
		<div class="quick_menu2">
			<a href="javascript:goOrder('Q');" class="quick_order2"></a>
		</div>
		<div class="quick_menu4 chat_order active">
<a href="javascript:goChat()" class="quick_order4" data-kz-track-on-click="17590"></a>
		</div>
		<div class="quick_menu3">
			<a href="/contents/present" class="quick_order3"></a>
		</div>		
		
<!-- 2017-07-05 // 챗봇 수정(e) -->
		<!-- 2017-07-05 // 플로팅 추가(s) -->
			<!-- 2017-07-05 // 플로팅 추가(e) -->
		</div>
	<div class="main_visual">
		<div class="slide_wrap btn_center btn_type">
			
		<div class="viewport" style="overflow: hidden; position: relative;"><ul class="slides" id="main_visual" style="width: 2000%; transition-duration: 0s; transform: translate3d(-538px, 0px, 0px);"><li class="clone" aria-hidden="true" style="width: 538px; float: left; display: block;"><a href="javascript:goBannerLink('/event/view?seq=77&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170628_7riOo53A.jpg" alt="현대카드 발급이벤트" onmousedown="try{_trk_clickTrace('EVT','메인빅배너/현대카드 발급이벤트');}catch(e){}" draggable="false"></a></li>
			<li class="active" style="width: 538px; float: left; display: block;"><a href="javascript:goBannerLink('/hotdeal/specialEdition');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170718_59q99OJK.jpg" alt="7월_빅배너_하프앤하프" onmousedown="try{_trk_clickTrace('EVT','메인빅배너/7월_빅배너_하프앤하프');}catch(e){}" draggable="false"></a></li><li class="" style="width: 538px; float: left; display: block;"><a href="javascript:goBannerLink('/hotdeal/specialSet');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170720_2B7N6HoT.jpg" alt="7월_빅배너_스페셜세트" onmousedown="try{_trk_clickTrace('EVT','메인빅배너/7월_빅배너_스페셜세트');}catch(e){}" draggable="false"></a></li><li style="width: 538px; float: left; display: block;" class=""><a href="javascript:goBannerLink('/event/view?seq=82&amp;gubun=E0100');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170714_o12WizPc.jpg" alt="7월_빅배너_사이드반값" onmousedown="try{_trk_clickTrace('EVT','메인빅배너/7월_빅배너_사이드반값');}catch(e){}" draggable="false"></a></li><li style="width: 538px; float: left; display: block;" class=""><a href="javascript:goBannerLink('/hotdeal/freshCombo');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170720_Z3MyO57A.jpg" alt="7월_프레시콤보" onmousedown="try{_trk_clickTrace('EVT','메인빅배너/7월_프레시콤보');}catch(e){}" draggable="false"></a></li><li style="width: 538px; float: left; display: block;" class=""><a href="javascript:goBannerLink('/event/view?seq=84&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170807_sDJkFODF.jpg" alt="7월_빅배너_도미챗" onmousedown="try{_trk_clickTrace('EVT','메인빅배너/7월_빅배너_도미챗');}catch(e){}" draggable="false"></a></li><li style="width: 538px; float: left; display: block;" class=""><a href="javascript:goBannerLink('/event/view?seq=56&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170713_JG0QL4iy.jpg" alt="KT3040_시즌2" onmousedown="try{_trk_clickTrace('EVT','메인빅배너/KT3040_시즌2');}catch(e){}" draggable="false"></a></li><li style="width: 538px; float: left; display: block;" class=""><a href="javascript:goBannerLink('https://web.dominos.co.kr/event/view?seq=74&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170728_2pdE144q.jpg" alt="6월_빅배너_G9" onmousedown="try{_trk_clickTrace('EVT','메인빅배너/6월_빅배너_G9');}catch(e){}" draggable="false"></a></li><li style="width: 538px; float: left; display: block;" class=""><a href="javascript:goBannerLink('/event/view?seq=77&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170628_7riOo53A.jpg" alt="현대카드 발급이벤트" onmousedown="try{_trk_clickTrace('EVT','메인빅배너/현대카드 발급이벤트');}catch(e){}" draggable="false"></a></li><li class="clone" aria-hidden="true" style="width: 538px; float: left; display: block;"><a href="javascript:goBannerLink('/hotdeal/specialEdition');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170718_59q99OJK.jpg" alt="7월_빅배너_하프앤하프" onmousedown="try{_trk_clickTrace('EVT','메인빅배너/7월_빅배너_하프앤하프');}catch(e){}" draggable="false"></a></li></ul></div><div class="btn_slide"><ul><li class="active"><a href="#">1</a></li><li class=""><a href="#">2</a></li><li class=""><a href="#">3</a></li><li class=""><a href="#">4</a></li><li class=""><a href="#">5</a></li><li class=""><a href="#">6</a></li><li class=""><a href="#">7</a></li><li class=""><a href="#">8</a></li></ul></div><ul class="direction-nav"><li class="nav-prev"><a class="prev" href="#">Previous</a></li><li class="nav-next"><a class="next" href="#">Next</a></li></ul></div>
	</div>
	<!-- content -->
	<div id="content" class="main">
		<!-- delivery_tracker -->
		<div class="delivery_tracker" style="display:none;" id="ingOrderInfo">
			<input type="hidden" id="tracker_order_no" value="">
			<p class="customer_tracker">현재 <strong></strong> 님의<br>주문상태는?</p>
			<ul class="list_tracker">
				<li>
					<span class="tracker_step" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
					<p>접수완료</p>
				</li>
				<li>
					<span class="tracker_step2" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
					<p>요리 중</p>
				</li>
				<li>
					<span class="tracker_step3" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
					<p>배달 중</p>
				</li>
				<li>
					<span class="tracker_step4" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
					<p>배달완료</p>
				</li>
			</ul>
		</div>
		<!-- //delivery_tracker -->

		<!-- customer_info -->
		<div class="customer_info">
		<ul>
			<li>
						<a href="/global/login">
							<div class="img_info">
								<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info_2.png" alt="">
							</div>
							<div class="txt_info">
								<p>로그인하시면<br>풍성한 혜택이 가득!</p>
								<div class="txt_info_right">
									<span class="blue_box">로그인</span>
								</div>
							</div>
						</a>
					</li>
				<li>
					<a href="/event/mania">
						<div class="img_info">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info2_2.png" alt="" style="width: 100%; height: 100%; margin: 0px;">
						</div>
						<div class="txt_info">
							<p>온라인 회원만의<br>매니아 혜택</p>
							<div class="txt_info_right">
								<span class="ico ico_mania"></span>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a href="/branch">
						<div class="img_info">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info3_2.png" alt="" style="width: 100%; height: 100%; margin: 0px;">
						</div>
						<div class="txt_info">
							<p>내 주변<br>이벤트 매장 찾기</p>
							<div class="txt_info_right">
								<span class="ico ico_store"></span>
							</div>
						</div>
					</a>
				</li>
			</ul>
			</div>
		<!-- //customer_info -->

		<!-- main_bnr_wrap -->
		<div class="main_bnr_wrap">
			<div class="bnr_section">
				<div class="bnr_slide">
					<div class="slide_wrap btn_center btn_type">
						
					<div class="viewport" style="overflow: hidden; position: relative;"><ul class="slides" id="bnr_section" style="width: 600%; transition-duration: 0s; transform: translate3d(-492px, 0px, 0px);"><li class="clone" aria-hidden="true" style="width: 492px; float: left; display: block;"><a href="javascript:goBannerLink('/goods/list?dsp_ctgr=C0101');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170609_9AXHFLnf.jpg" alt="6월_메인신제품" onmousedown="try{_trk_clickTrace('EVT','메인신제품/6월_메인신제품');}catch(e){}" draggable="false"></a></li>
						<li class="active" style="width: 492px; float: left; display: block;"><a href="javascript:goBannerLink('/goods/list?dsp_ctgr=C0101');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170609_9AXHFLnf.jpg" alt="6월_메인신제품" onmousedown="try{_trk_clickTrace('EVT','메인신제품/6월_메인신제품');}catch(e){}" draggable="false" style="width: 100%; height: 100%; top: 0%; left: 0%;"></a></li><li class="clone" aria-hidden="true" style="width: 492px; float: left; display: block;"><a href="javascript:goBannerLink('/goods/list?dsp_ctgr=C0101');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170609_9AXHFLnf.jpg" alt="6월_메인신제품" onmousedown="try{_trk_clickTrace('EVT','메인신제품/6월_메인신제품');}catch(e){}" draggable="false"></a></li></ul></div><div class="btn_slide"><ul></ul></div></div>
				</div>
			</div>



			<div class="bnr_section evt bnr_section_right"><div class="bnr_img"><a href="javascript:goBannerLink('/hotdeal/specialEdition');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170718_8c2kOlj9.jpg" alt="7월_하단_하프앤하프" onmousedown="try{_trk_clickTrace('EVT','메인하단/7월_하단_하프앤하프');}catch(e){}"></a></div></div><div class="bnr_section evt"><div class="bnr_img"><a href="javascript:goBannerLink('/hotdeal/specialSet');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170720_SJKqTxLN.jpg" alt="7월_하단_스페셜세트" onmousedown="try{_trk_clickTrace('EVT','메인하단/7월_하단_스페셜세트');}catch(e){}"></a></div></div><div class="bnr_section evt bnr_section_right"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=82&amp;gubun=E0100');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170714_T4GPpHn5.jpg" alt="7월_하단_사이드반값" onmousedown="try{_trk_clickTrace('EVT','메인하단/7월_하단_사이드반값');}catch(e){}"></a></div></div><div class="bnr_section evt"><div class="bnr_img"><a href="javascript:goBannerLink('/hotdeal/freshCombo');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170720_Uk9KRVen.jpg" alt="7월_프레시콤보" onmousedown="try{_trk_clickTrace('EVT','메인하단/7월_프레시콤보');}catch(e){}"></a></div></div><div class="bnr_section evt bnr_section_right"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=84&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170807_fno2Cs50.jpg" alt="7월_하단_도미챗" onmousedown="try{_trk_clickTrace('EVT','메인하단/7월_하단_도미챗');}catch(e){}"></a></div></div><div class="bnr_section evt"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=78&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170629_XqtFm7z2.jpg" alt="7월_OK" onmousedown="try{_trk_clickTrace('EVT','메인하단/7월_OK');}catch(e){}"></a></div></div><div class="bnr_section evt bnr_section_right"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=47&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170615_wkiGkI2W.jpg" alt="내 피자의 위치가 궁금하다면!? '주문 트래커'를 실시간으로 확인해보세요!" onmousedown="try{_trk_clickTrace('EVT','메인하단/내 피자의 위치가 궁금하다면!? '주문 트래커'를 실시간으로 확인해보세요!');}catch(e){}"></a></div></div><div class="bnr_section evt"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=56&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170713_7JR03Mb7.jpg" alt="KT 고객이라면 누구나 누릴 수 있는 특별한 더블할인 혜택!" onmousedown="try{_trk_clickTrace('EVT','메인하단/KT 고객이라면 누구나 누릴 수 있는 특별한 더블할인 혜택!');}catch(e){}"></a></div></div><div class="bnr_section evt bnr_section_right"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=77&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170801_4v8Bs7bS.jpg" alt="현대카드 ZERO/M Edition2 신규발급시 피자할인쿠폰 증정" onmousedown="try{_trk_clickTrace('EVT','메인하단/현대카드 ZERO/M Edition2 신규발급시 피자할인쿠폰 증정');}catch(e){}"></a></div></div><div class="bnr_section evt"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=11&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170307_00v2azqt.jpg" alt="KT VIP 회원 20% 포인트 차감할인" onmousedown="try{_trk_clickTrace('EVT','메인하단/KT VIP 회원 20% 포인트 차감할인');}catch(e){}"></a></div></div><div class="bnr_section evt bnr_section_right"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=15&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170413_M6du4J9W.jpg" alt="Domino's Survey 참여방법!" onmousedown="try{_trk_clickTrace('EVT','메인하단/Domino's Survey 참여방법!');}catch(e){}"></a></div></div><div class="bnr_section evt"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=16&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170206_VgUv0BdZ.jpg" alt="화요일에는 40%할인! 화끈한 화요일" onmousedown="try{_trk_clickTrace('EVT','메인하단/화요일에는 40%할인! 화끈한 화요일');}catch(e){}"></a></div></div><div class="bnr_section evt bnr_section_right"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=17&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170203_MDgQZ710.jpg" alt="우리 농가에서 키운 우리 피클 출시" onmousedown="try{_trk_clickTrace('EVT','메인하단/우리 농가에서 키운 우리 피클 출시');}catch(e){}"></a></div></div><div class="bnr_section evt"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=20&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170203_xXRN3DbG.jpg" alt="도미노 희망나눔세트" onmousedown="try{_trk_clickTrace('EVT','메인하단/도미노 희망나눔세트');}catch(e){}"></a></div></div><div class="bnr_section evt bnr_section_right"><div class="bnr_img"><a href="javascript:goBannerLink('/event/view?seq=18&amp;gubun=E0200');"><img src="https://cdn.dominos.co.kr/admin/upload/banner/20170203_7ghUaeqB.jpg" alt="돌아온 도미노 facebook만의 깜짝 타임어택! 도미노 페이스북 해피아워!" onmousedown="try{_trk_clickTrace('EVT','메인하단/돌아온 도미노 facebook만의 깜짝 타임어택! 도미노 페이스북 해피아워!');}catch(e){}"></a></div></div><div class="bnr_section" id="notice_area">
				<div class="bnr_notice">
					<dl>
						<dt>공지사항</dt>
						<dd>
							<ul id="noticeList"><li><a href="/bbs/newsView?idx=1962&amp;type=N"><span class="ico ico_notice"></span> 꽃게 온더x스프라이트 WaterBomb 이벤트 당첨자 홈페이지 안내</a></li><li><a href="/bbs/newsView?idx=1960&amp;type=N"><span class="ico ico_notice"></span> [공지] 도미노피자 개인정보 처리방침 개정 안내</a></li><li><a href="/bbs/newsView?idx=1959&amp;type=N"><span class="ico ico_notice"></span> 2017년 온라인 리뉴얼 프로모션 이벤트 당첨자 안내</a></li></ul>
						</dd>
					</dl>
					<a href="/bbs/newsList?type=N" class="btn_ico btn_more">더보기</a>
				</div>
			</div>

			<div class="bnr_section bnr_section_right">
				<div class="bnr_fix bnr_domino">
					<a href="/company/contents/overview">
						<div class="img_bnr_fix">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_bnr_fix.png" alt="">
						</div>
						<div class="txt_bnr_fix">
							<div class="txt_fix_wrap">
								<strong>한국 도미노피자 </strong>
								<p>최고의 피자 전문가이자 피자마스터<br>한국도미노피자를 소개합니다.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="bnr_fix bnr_survey">
					<a href="javascript:goSurvey();">
						<div class="img_bnr_fix">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_bnr_fix2.png" alt="">
						</div>
						<div class="txt_bnr_fix">
							<div class="txt_fix_wrap">
								<strong>도미노피자 오픈 서베이</strong>
								<p>고객님의 의견을 들려주시고<br>20% 할인 혜택도 받으세요.</p>
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="bnr_section bnr_section_right" id="empty_area" style="display:none;">
				<div class="bnr_empty">
					<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_bnr_empty.png" alt="">
				</div>
			</div>
		</div>
		<!-- //main_bnr_wrap -->

		<div class="customer_bottom">
			<div class="customer_info">
		<!-- 로그인 전 -->
				<ul>
					<li>
						<a href="/global/login">
							<div class="txt_info">
								<p>로그인하시면<br>풍성한 혜택이 가득!</p>
								<div class="txt_info_right">
									<span class="blue_box">로그인</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="/event/mania">
							<div class="txt_info">
								<p>온라인 회원만의<br>매니아 혜택</p>
								<div class="txt_info_right">
									<span class="ico ico_mania"></span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="/branch">
							<div class="txt_info">
								<p>내 주변<br>이벤트 매장 찾기</p>
								<div class="txt_info_right">
									<span class="ico ico_store"></span>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>


	</div>
	<!-- //content -->
</div>

<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/xml2json.js"></script>
<script type="text/javascript">
var p_now = new Date();
// 헤더푸터 인크루드
$(document).ready(function(){
	

	// 공지사항
	$.ajax({
		type: "GET",
		url: "/bbs/newsListAjax?type=MAIN&blockSize=3",
		dataType : "json",
		success:function(data) {
	 		var noticeList = "";
	 		if(data.status == "success"){
		 		$.each(data.resultData.list, function (index, entry) {
		 			var newsYn = "";
			 		if(entry["type"] == "N")
			 			newsYn = "<span class='ico ico_notice'></span> ";
					noticeList += "<li><a href='/bbs/newsView?idx="+entry["idx"]+"&type="+entry["type"]+"'>"+newsYn+entry["subject"]+"</a></li>";
				});

		 		$("#noticeList").html(noticeList);
			} else {
// 				console.log("공지사항 가져오기 실패");
			}
		}
	});

	// 배너 로딩
	var t_now = new Date();
	$.ajax({
		type: "GET",
		url: "/contents/mainBanner",
		dataType: "xml",
		success:function(xml) {
			var lineBannerYn = "";
			var cnt = $(xml).find('banner').find('bitem').length;
			$(xml).find('banner').find('bitem').each(function(i) {
					var html = "";
					var sDate = stringToDate($(this).attr("sDate"));
					var eDate = stringToDate($(this).attr("eDate"));
					var useYn = $(this).attr("useYn");
					var gubun = $(this).attr("gubun");
					var fileNm = $(this).attr("fileNm");
					var linkUrl = $(this).attr("linkUrl");
					var title = $(this).attr("title");
					var gubunNm = "";
					if(gubun == "B0001")
						gubunNm = "메인빅배너";
					else if(gubun == "B0002")
						gubunNm = "메인신제품";
					else if(gubun == "B0003")
						gubunNm = "메인하단";
					else if(gubun == "B0008")
						gubunNm = "띠 배너";

					var loggerTrack = "onmousedown=\"try{_trk_clickTrace('EVT','"+gubunNm+"/"+title+"');}catch(e){}\"";

					if(t_now > sDate && t_now < eDate && useYn == "Y") {
						if(gubun == "B0001" || gubun == "B0002") {
							html = "<li><a href=\"javascript:goBannerLink('"+linkUrl+"');\"><img src=\"https://cdn.dominos.co.kr/admin/upload/banner/"+fileNm+"\" alt=\""+title+"\" "+loggerTrack+"></a></li>";
							if(gubun == "B0001")
								$(".main_visual .slides").append($(html));
							else
								$(".bnr_slide .slides").append($(html));
						} else if(gubun == "B0003") {
							html = "<div class=\"bnr_section evt\"><div class=\"bnr_img\"><a href=\"javascript:goBannerLink('"+linkUrl+"');\"><img src=\"https://cdn.dominos.co.kr/admin/upload/banner/"+fileNm+"\" alt=\""+title+"\" "+loggerTrack+"></a></div></div>";

							$("#notice_area").before($(html));
						} else if(gubun == "B0008" && lineBannerYn == "" && "true" == "true") {
							var colorKey = $(this).attr("etc");
							if(colorKey != "" && fileNm != ""){
								lineBannerYn = "Y";
								html = "<a href=\"javascript:goBannerLink('"+linkUrl+"');\"><img src=\"https://cdn.dominos.co.kr/admin/upload/banner/"+fileNm+"\" alt=\""+title+"\" "+loggerTrack+"></a>";
								$("#lineBanner .btn_event_close").before(html);
								$("#lineBanner").css("background-color", colorKey);
							}
						}
					}

					if(cnt == (i+1)) {
						$('.bnr_slide .slide_wrap').flexslider({
							animation: 'slide',
							animationSpeed: 2000,
							slideshowSpeed: 4000,
							directionNav: false
						});
						$('.main_visual .slide_wrap').flexslider({
							animation: 'slide',
							animationSpeed: 3000,
							slideshowSpeed: 4000
						});
					}
			});

			if (lineBannerYn == "Y") {
				var nDate = t_now.getFullYear() + "" + n2c(t_now.getMonth() + 1) + "" + n2c(t_now.getDate());
				var cookieName = cookieManager.getCookie('main_t_banner');
				if (cookieName != 'main_t_banner' + nDate) { // 쿠키체크
					$("#lineBanner").addClass("active");
				}
			}
		}
	});
	//메인 팝업
	getMainPopup();
	
	window.onmessage = function(e){
		if(e.data == "CHAT_CLOSE_ACCEPT"){
			e.preventDefault();
			$('.layer_chat').removeClass('active');
			$('body').removeClass('fixed');
			$('#chatUrl').attr('src', "https://domichat.dominos.co.kr:10000/pc/order.html?dominoId=&customerName=&customerHpNo=");
		}else
			alert("챗봇 서버와 통신이 원할하지 않습니다. 새로고침 후에 사용해 주세요");
	}
	// 챗봇 열기
	$('.quick_order4').click(function(e){
	
			if(!confirm("DomiChat은 로그인이 필요한 서비스입니다.\n회원/비회원 로그인해주세요!")) {
				return;
			}else
				location.href = "/global/login?returnUrl=/goods/list";
//			alert('회원 전용 서비스입니다. 로그인 후 실행 해주실 바랍니다.')
		 
	})
	$('.layer_chat .btn_close').click(function(e){
	
			if(!confirm("DomiChat은 로그인이 필요한 서비스입니다.\n회원/비회원 로그인해주세요!")) {
				return;
			}else
				location.href = "/global/login?returnUrl=/goods/list";
		 
	})
	$('.chat_order .btn_close').click(function(e){
		e.preventDefault();
		$('.chat_order').addClass('active')
		$('#chatUrl').attr('src', "https://domichat.dominos.co.kr:10000/pc/order.html?dominoId=&customerName=&customerHpNo=");
	})
});

$(document).ajaxStop(function() {
	$(".bnr_section").each(function(idx){
		if(idx%2 != 0){
			$(this).addClass("bnr_section_right");
		}
	});

	if($(".bnr_section").length%2 == 0){
		$("#empty_area").show();
	}
});

function goBannerLink(link) {
	location.href = link;
}

function goChat() {
	location.href = "/global/login?returnUrl=/main";
}

function goOrder(orderMethod) {

		if(orderMethod == "Q") location.href = "/quickOrder/index";
		else location.href = "/goods/list?dsp_ctgr=C0101";
	
}

function getMainPopup() {
	var nowDay = p_now.getFullYear() + "" + fncLPAD((p_now.getMonth() + 1)) + "" + fncLPAD(p_now.getDate()) + "";

	$.ajax({
		type: "GET",
		url: "/resources/xml/mainPopup.xml",
		dataType: "xml",
		success:function(xml) {
			$(xml).find('pop').find('pitem').each(
				function(i) {
					var seq = $(this).attr('seq');
					var width = $(this).attr('imgWidth') - 4;
					var height = parseInt($(this).attr('imgHeight')) + 22;
					var left = $(this).attr('imgLeft');
					var top = $(this).attr('imgTop');
					var s_date = $(this).attr('sDate');
					var e_date = $(this).attr('eDate');
					var lang = $(this).attr('lang');
					var use_yn = $(this).attr('useYn');
					if (nowDay >= s_date && nowDay <= e_date && lang != "EN" && use_yn == "Y") {
						if (cookieManager.getCookie('DOMINO_MAINPOPUP_' + seq).isBlank()) {
							window.open('/mainPopup?seq=' + seq, 'DOMINO_MAINPOP_' + seq, 'width=' + width + ', height=' + height + ', left='
									+ left + ', top=0, scrollbars = no');
						}
					}
			});
		}
	});
}
function fncLPAD(num) {
	if (num < 10)
		return '0'+num;
	else
		'' + num;
	return num;
}

//온라인 서베이
function goSurvey(){
	var pop = window.open('/survey/surveyForm','survey','width=780px, height=600px, left=0, top=0');
	pop.focus();
}

//띠 배너 오늘하루 다시 보지 않기
function lineBannerClose(){
	var t_now = new Date();
	var nDate = t_now.getFullYear() + "" + n2c(t_now.getMonth() + 1) + "" + n2c(t_now.getDate());
	cookieManager.setCookie('main_t_banner','main_t_banner'+nDate, 1);
}

</script>
<div class="pop_layer pop_type" id="password_ch_pop">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>비밀번호 변경 권유</h2>
		</div>
		<div class="pop_content">
			<div class="sp_bubble_left bubble_shadow">
				<div class="bubble_area">
					<p><strong>고객님의 회원정보 보호를 위해 도미노피자는<br><span class="txt_orange">6개월마다 비밀번호 변경을 권유</span>하고 있습니다.</strong></p>
					<p>비밀번호 변경을 원하지 않을 경우 ‘다음에 변경하기’<br>버튼을 눌러 1개월 동안 안내를 받지 않을 수 있습니다.<br>기존 비밀번호와 신규 비밀번호를 입력 해 주세요.</p>
				</div>
			</div>
			<div class="lst_type_dot">
				<ul>
					<li>
						<label for="old_passwd">현재 비밀번호</label>
						<div class="form_group">
							<div class="form_field">
								<div class="form_item">
									<input type="password" name="old_passwd" id="old_passwd" maxlength="16" class="i_text">
								</div>
							</div>
							<span class="i_error show" id="old_passwd_alert"></span>
						</div>
					</li>
					<li>
						<label for="passwd">새 비밀번호</label>
						<div class="form_group">
							<div class="form_field">
								<div class="form_item">
									<span for="temp_input" class="i_label" style="position: absolute;"></span>
									<input type="password" name="passwd" id="passwd" maxlength="16" class="i_text" placeholder="8 ~16자 영문대소문자, 숫자, 특수문자 사용가능">
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
									<input type="password" name="confirmpw" id="confirmpw" maxlength="16" class="i_text" placeholder="8 ~16자 영문대소문자, 숫자, 특수문자 사용가능">
								</div>
							</div>
							<span class="i_error show" id="confirmpw_alert"></span>
						</div>
					</li>
				</ul>
			</div>

			<div class="btn_wrap">
				<div class="btn_fix_center">
					<a href="javascript:goDelay();" class="btn btn_mdle btn_blue btn_basic"><span class="btn_txt">1개월 후 변경하기</span></a>
					<a href="javascript:updateChangePasswd();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">수정하기</span></a>
				</div>
			</div>
		</div>
		<a href="javascript:goDelay();" class="btn_ico btn_close" id="goDelay">닫기</a>
	</div>
</div>

<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/member.js"></script>
<script type="text/javascript">
var redirectUrl = "";
$(document).ready(function(){
	var cookieYn = cookieManager.getCookie('PwdSuggest');

	if("" == "Y" && cookieYn == ""){
		$("#password_ch_pop").addClass("open");
	}

	$("#goDelay").unbind("click");
});

//다음에 변경하기
function goDelay(){
	cookieManager.setCookie('PwdSuggest','0', 30); // 30일
	if(redirectUrl != "")
		location.href=redirectUrl;
	else
		location.href="/main";
}

//비밀번호 변경 처리
function updateChangePasswd() {
	$("#old_passwd_alert").text("");
	$("#passwd_alert").text("");
	$("#confirmpw_alert").text("");

	if ($('#old_passwd').val() == ""){
		$("#old_passwd_alert").text("현재 비밀번호를 입력해 주세요.");
		$('#old_passwd').focus();
		return;
	}
	if ($('#passwd').val() == ""){
		$("#passwd_alert").text("새 비밀번호를 입력해 주세요.");
		$('#passwd').focus();
		return;
	}
	if ($('#confirmpw').val() == ""){
		$("#confirmpw_alert").text("새 비밀번호를 입력해 주세요.");
		$('#confirmpw').focus();
		return;
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
			data: {	old_passwd : $("#old_passwd").val(),
					passwd : $('#passwd').val() },
			dataType : "json",
			success:function(data) {
				if (data.status == "success"){
					alert(data.msg);
					if(redirectUrl != "")
						location.href=redirectUrl;
					else
						location.href="/main";
					return;
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
<!-- Google 리마케팅 태그 코드 -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 956654516;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script><iframe name="google_conversion_frame" title="Google conversion frame" width="300" height="13" src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/956654516/?random=1502275907302&amp;cv=8&amp;fst=1502275907302&amp;num=1&amp;fmt=1&amp;guid=ON&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=6&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=7&amp;frm=0&amp;url=https%3A%2F%2Fweb.dominos.co.kr%2Fmain&amp;ref=https%3A%2F%2Fweb.dominos.co.kr%2Fgoods%2Flist%3Fdsp_ctgr%3DC0102&amp;tiba=%EB%8F%84%EB%AF%B8%EB%85%B8%ED%94%BC%EC%9E%90" frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no"></iframe>
<noscript>
&lt;div style="display:inline;"&gt;
&lt;img height="1" width="1" style="border-style:none;" alt="" src="http://googleads.g.doubleclick.net/pagead/viewthroughconversion/956654516/?guid=ON&amp;amp;script=0"/&gt;
&lt;/div&gt;
</noscript>
<!-- Google 리마케팅 태그 코드 -->
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
							<li><a href="/bbs/faqList?view_gubun=W&amp;bbs_cd=online">고객센터</a></li>
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
							<p>고객이 가장 추천하는 기업<br>피자전문점 부문 4년 연속 1위</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards4.png" alt="">
							<p>2016년 「대한민국인터넷소통대상」<br>「대한민국소셜미디어대상」<br>Leading Star (7년 연속 종합 1위)</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards5.png" alt="">
							<p>2016 한국산업의 고객만족도<br>피자전문점 부문 2년 연속 1위</p>
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
<noscript>&lt;img alt="Logger Script" width="1" height="1" src="http://ssl.logger.co.kr/tracker.tsp?u=21550&amp;amp;js=N" /&gt;</noscript>
<!-- END OF LOGGER TRACKING SCRIPT -->

<!-- AceCounter Log Gathering Script V.70.2012031601-->
<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/acecounter.js"></script>
<!-- AceCounter Log Gathering Script End -->

<!-- Naver Anlytics 공통-->
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"> </script>
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
		

<script>
cookieManager.makePCID("PCID", 10);
</script>

</body></html>