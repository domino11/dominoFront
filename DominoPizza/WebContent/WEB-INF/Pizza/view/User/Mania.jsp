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
		
			$.ajax({
				type: "POST",
				url: "/mypage/mainMyCouponInfoAjax",
				dataType : "json",
				success:function(data) {
				 	if (data.resultData.status == "success") {
				 		$('#myMonth').text(data.resultData.myMonth+'월');
				 		$('#myLevel').text(data.resultData.myLevel);
				 		if(data.resultData.myCouponCnt > 0) {
				 			$(".none_coupon").hide();
					 		$(".exist_coupon").show();
					 		$('#myCouponCnt').html(data.resultData.myCouponCnt+"<span>개</span>");
					 		$('#gnbCoupon').text("("+data.resultData.myCouponCnt+")");
				 		}
					} else {
// 						console.log("마이쿠폰 정보 가져오기 실패");
					}
				}
			});
			

		// 주문&주문트레커 조회(가입회원/인증회원)
		
				$.ajax({
					type: "POST",
					url: "/mypage/leftMyOrderInfoAjax",
					dataType : "json",
					success:function(data) {
					 	if (data.resultData.status == "success") {
					 		// 현재 주문 진행중인건이 있으면
					 		if(data.resultData.ingOrderCnt > 0){
					 			var stateCode = data.resultData.state_code;
					 			$('#ingOrderInfo').show();
						 		$('#gnbOrderCnt').text("("+data.resultData.ingOrderCnt+")");
						 		$('#tracker_order_no').val(data.resultData.order_no);

						 		if(stateCode == '1' || stateCode == '2'){
						 			$(".tracker_step").parent().addClass("active");  // 접수완료
						 		}else if(stateCode == '3'){
						 			$(".tracker_step2").parent().addClass("active"); // 요리중
						 		}else if(stateCode == '4'){
						 			$(".tracker_step3").parent().addClass("active"); // 배달중
						 		}else if(stateCode == '5'){
						 			$(".tracker_step4").parent().addClass("active"); // 배달완료
						 		}else{
// 						 			console.log("Left 주문내역 가져오기 실패");
						 		}
					 		}
						} else {
// 							console.log("Left 주문내역 가져오기 실패");
						}
					}
				});
			
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
						<li><a href="/global/logout">로그아웃</a></li>
							<li><a href="/mypage/myLevel">나의정보</a></li>
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
		</div>
		<!-- //header -->

<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="mypage">
		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><a href="/mypage/myOrderList">나의 정보</a></li>
				<li><span>매니아 등급</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>나의 정보</h2>
			</div>
		</div>
		<!-- //sub_title -->


		<div class="tab tab_type4">
			<ul class="btn_tab">
				<li class="active"><a href="/mypage/myLevel">매니아 등급</a></li>
				<li class=""><a href="/mypage/myOrderList">주문조회</a></li>
				<li class=""><a href="/mypage/myCoupon">쿠폰</a></li>
				<li class=""><a href="/mypage/qustionList">문의 게시판</a></li>
				<li class=""><a href="/member/modMember">설정변경</a></li>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content">1</div>
				<!-- //tab_content -->
				<div class="tab_content">2</div>
				<div class="tab_content active">

					<div class="wrapper">
						<!-- 2017-03-27 // 문구 수정 (s)-->
						<div class="mania_intro">
							<p class="title"><span>온라인 회원이면 누구나 누릴 수 있는</span> 도미노 온라인 매니아!</p>

							<div class="lst_type">
								<ul>
									<li><strong>등급 반영 기준 :</strong> 최근 3개월간의 온라인 주문 내역으로 매 월 1일 적용</li>
									<li>제공된 쿠폰은 온라인 주문(홈페이지, 모바일 웹, 앱)만 사용 가능 (전화주문 불가)</li>
								</ul>
							</div>
							<!-- //lst_type -->
						</div>
						<!-- 2017-03-27 // 문구 수정 (e)-->
					</div>
				</div>
				<div class="tab_content">4</div>
			</div>
		</div>
		<!-- //tab -->

		<!-- 사용자 등급 -->
		<div class="container">
			<div class="wrapper">
				<div class="grade_intro">
					<span class="ico_grade regular">REGULAR</span>
					<p class="grade_desc">
						8월, <strong>김동준 님</strong>의<br>
						온라인등급은 <em>REGULAR</em>입니다.
					</p>
					<ul class="my_status">
						<li><p class="title"><span class="ico ico_purchase"></span>구매건수 : </p><p class="value">0건</p></li>
						<li><p class="title"><span class="ico ico_date"></span>산정기준 : </p><p class="value">2017.05~2017.07</p></li>
					
						<!-- 2017-04-26 // 문구 추가 (s)-->
						<li class="status_num"><p class="title"><span class="ico ico_calculator"></span>총 구매금액 : </p><p class="value">0원</p><em>(2010년 이후 ~ 2017.07 까지의 총 구매금액)</em></li>
						<!-- 2017-04-26 // 문구 추가 (e)-->					
					</ul>
				</div>
				<!-- //사용자 등급 -->
				<!-- 사용자 혜택 -->
				<!-- 다음 달 도달 가능 등급 계산 (현재 등급보다 한단계 높은 등급 노출) -->
				<!-- 필요건수 = 다음 달 도달 가능 등급의 필요 건수  - 실시간(2개월+현재달) 주문 건수 -->
				<!-- //grade_intro -->
				<ul class="grade_benefit_list">
					<li>
						<p class="grade_title"><em>김동준</em> <strong>님</strong>께서 받으실 수 있는<br> 스페셜한 혜택은?</p>
						<ul class="ico_benefit_list">
							<li class="pizza">배달주문 20% 할인쿠폰 2매</li>
							</ul>
						<div class="btn_wrap">
							<div class="btn_fix_rgt">
								<a href="javascript:myCouponDown();" class="btn"><span class="btn_txt">쿠폰 받기</span></a>
							</div>
						</div>
						<!-- //btn_wrap -->
					</li>
					<!-- 2017-03-27 // 문구 수정(s)-->
					<li>
						<div class="lst_type">
							<ul>
								<li>쿠폰은 나의 정보 > 쿠폰 페이지에서 확인 가능합니다.<br>(쿠폰 유효기간은 매월 말일까지입니다.)</li>
								<li><i>매니아 등급 및 혜택은 매월 변경될 수 있습니다.</i></li>
								<li><i>ROYAL 및 VIP 등급에게만</i> 발급되는 생일 50%쿠폰은 당월 생일자에게만 발급되며, 방문포장 주문 시 사용 가능합니다.<br>(50% 할인은 피자 1판에만 적용됩니다.)</li>
							</ul>
						</div>
					</li>
					<!-- 2017-03-27 // 문구 수정(e)-->
				</ul>

			</div>
		</div>
		<!-- //container -->

		<div class="container grade premium">
			<div class="wrapper">
				<div class="grade_upgrade">
					 <div class="upgrade_title">다음 달, <em>김동준</em> 님은 <em>PREMIUM</em> 등급으로 업그레이드 가능합니다.</div>
					 <ul class="upgarde_condition">
					 	<li class="condition_list">
					 		<p class="title"><em>PREMIUM</em>으로 업그레이드 하려면?</p>
					 		
					 		<div class="lst_type">
								<ul>
									<li>필요구매건수&nbsp;<em>2건</em></li>
								</ul>
								<div class="lst_notice">
									※ 위 조건은 최근 2개월+ 당일 주문내역 기준입니다.
								</div>
							</div>
							</li>
					 	<li class="upgrade_benefit">
					 		<p class="title">다음 달, <em>김동준 님</em>이 <strong>PREMIUM</strong> 업그레이드 후<br>받을 수 있는 혜택</p>
					 		<ul class="ico_benefit_list">
					 		<li class="pizza">배달주문 20% 할인쿠폰 1매</li>
								<li class="pizza">배달주문 25% 할인쿠폰 1매</li>
								<li class="pizza">방문포장 35% 할인쿠폰 1매</li>							
							</ul>
					 	</li>
					 </ul>
				</div>
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //content -->
</div>
<!-- //container -->
<script type="text/javascript">
$(document).ready(function(){
	$('.btn_tab a').unbind("click");
});

var ajaxCupnRequest = null;
//쿠폰 다운로드
function myCouponDown(){
	if(ajaxCupnRequest != null) {
		alert("처리중인 작업이 있습니다. 잠시후에 다시 시도해 주세요.");
		return;
	}
	
	$.ajax({
		type: "POST",
		url: "/mypage/myCouponDownAjax",
		dataType : "json",
		success:function(data) {
			if(data.msg == "SUCCESS"){
				alert("쿠폰이 발급되었습니다. 나의 정보 > 쿠폰 페이지에서 확인 가능합니다.");
			}else {
				alert("당월 쿠폰을 이미 받으셨습니다. 나의 정보 > 쿠폰 페이지에서 확인해주시기 바랍니다.");
			}
		},
		error: function (error){
			alert("다시 시도해주세요.");
		},
		beforeSend: function() {
			ajaxCupnRequest = "Y";
			$("#defaultLoading").show();
	    },
	    complete: function() {
	    	ajaxCupnRequest = null;
	    	$("#defaultLoading").hide();
	    }
	});
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
