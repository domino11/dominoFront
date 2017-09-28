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
	<!-- 2] CDN(Content Deliver Network)주소 사용-->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<!-- Deprecated 된 함수사용 -->
	<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
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
				<li><span>매니아 등급</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>나의 정보</h2>
			</div>
		</div>
		<!-- //sub_title -->


		<div class="tab tab_type4">
			<ul class="btn_tab">
				<li class="active"><a href="<c:url value='/User/MyPage_Mania.pz'/>">매니아 등급</a></li>
				<li class=""><a href="<c:url value='/User/Mypage_OrderHistory.pz'/>">주문조회</a></li>
				<li class=""><a href="<c:url value='/User/Mypage_coupon.pz'/>">쿠폰</a></li>
				<li class=""><a href="<c:url value='/User/Mypage_ChangeSetting.pz'/>">설정변경</a></li>
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
						9월, <strong>${NAME} 님</strong>의<br>
						온라인등급은 <em>REGULAR</em>입니다.
					</p>
					<ul class="my_status">
						<li><p class="title"><span class="ico ico_purchase"></span>구매건수 : </p><p class="value">0건</p></li>
						<li><p class="title"><span class="ico ico_date"></span>산정기준 : </p><p class="value">2017.06~2017.08</p></li>
					
						<!-- 2017-04-26 // 문구 추가 (s)-->
						<li class="status_num"><p class="title"><span class="ico ico_calculator"></span>총 구매금액 : </p><p class="value">0원</p><em>(2010년 이후 ~ 2017.08 까지의 총 구매금액)</em></li>
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
						<p class="grade_title"><em>${NAME}</em> <strong>님</strong>께서 받으실 수 있는<br> 스페셜한 혜택은?</p>
						<ul class="ico_benefit_list">
							<li class="pizza">${MyRatingCoupon}</li>
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

		<div class="container grade 등급">
			<div class="wrapper">
				<div class="grade_upgrade">
					 <div class="upgrade_title">다음 달, <em>${NAME}</em> 님은 <em>등급</em> 등급으로 업그레이드 가능합니다.</div>
					 <ul class="upgarde_condition">
					 	<li class="condition_list">
					 		<p class="title"><em>등급</em>으로 업그레이드 하려면?</p>
					 		
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
					 		<p class="title">다음 달, <em>${NAME} 님</em>이 <strong>등급</strong> 업그레이드 후<br>받을 수 있는 혜택</p>
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
	
	$.ajax({
		type: "POST",
		url: "<c:url value='/User/CouponDownLoad.pz'/>",
		data : "id",
				success:function(data) {
					if(data == "Get"){
						alert("당월 쿠폰을 이미 받으셨습니다. 나의 정보 > 쿠폰 페이지에서 확인해주시기 바랍니다.");
					}
					else{
						alert("쿠폰이 발급되었습니다. 나의 정보 > 쿠폰 페이지에서 확인 가능합니다.");
					}
				}	
	});
	
}//myCouponDown()
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
				<a href="javascript:;" onclick="setBasketCnt();" class="btn_ico btn_close">닫기</a>
			</div>
		</div>

		<%@include file="/WEB-INF/Pizza/template/foot.jsp" %>
		
	</div>

		
</body>


</html>
