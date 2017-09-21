<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
								<li><a href="/goods/list?dsp_ctgr=C0203">피클&소스</a></li>
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
								<li><a href="/goods/hnh">하프&하프</a></li>
								<li><a href="/goods/mykitchen">마이 키친</a></li>
								<li><a href="/goods/topping">추가 토핑 안내</a></li>
							</ul>
						</div>
					</li>


					<li>
						<a href="/event/list?gubun=E0200" class="menu05">이벤트&할인</a>
						<div class="depth2">
							<ul class="list_depth2">
								<!-- li><a href="/event/list?gubun=E0100">오늘의 핫딜</a></li-->
								<li><a href="/event/list?gubun=E0200">오늘의 이벤트</a></li>
								<li><a href="/event/mania">매니아 혜택</a></li>
								<li><a href="/event/discount">할인&제휴</a></li>
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
								<li><a href="/goods/list?dsp_ctgr=C0203">피클&소스</a></li>
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
								<li><a href="/goods/hnh">하프&하프</a></li>
								<li><a href="/goods/mykitchen">마이 키친</a></li>
								<li><a href="/goods/topping">추가 토핑 안내</a></li>
							</ul>
						</li>
						<li>
							<a href="/event/list?gubun=E0200">이벤트&할인</a>
							<ul class="list_depth2">
								<!-- li><a href="#">오늘의 핫딜</a></li-->
								<li><a href="/event/list?gubun=E0200">오늘의 이벤트</a></li>
								<li><a href="/event/mania">매니아 혜택</a></li>
								<li><a href="/event/discount">할인&제휴</a></li>
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
							<a href="/bbs/faqList?view_gubun=W&bbs_cd=online">고객센터</a>
							<ul class="list_depth2">
								<li>
									<a href="/bbs/faqList?view_gubun=W&bbs_cd=online">FAQ</a>
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
								<li><a href="/event/view?seq=84&gubun=E0200">DomiChat이란?</a></li>
							</ul>
						</li>						
					</ul>
					<a href="/event/view?seq=84&gubun=E0200" class="btn_ico btn_close2">닫기</a>
				</div>
			</div>
		
		