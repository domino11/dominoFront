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

	<%@include file="/WEB-INF/Pizza/template/Top.jsp" %>

<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="mypage">
		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="<c:url value='/Pizza/MainPage.pz' />">HOME</a></li>
				<li><a href="<c:url value='/User/MyPage_Mania.pz' />">나의 정보</a></li>
				<li><span>쿠폰</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>나의 정보</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<form name="f" id="f" method="get">
		<input type="hidden" name="coupon_status" id="coupon_status" value="0">
		<input type="hidden" name="pageNo" id="pageNo" value="1">
		<div class="tab tab_type4">
			<ul class="btn_tab">
				<li class=""><a href="<c:url value='/User/MyPage_Mania.pz'/>">매니아 등급</a></li>
				<li class=""><a href="<c:url value='/User/Mypage_OrderHistory.pz'/>">주문조회</a></li>
				<li class="active"><a href="<c:url value='/User/Mypage_coupon.pz'/>">쿠폰</a></li>
				<li class=""><a href="<c:url value='/User/Mypage_ChangeSetting.pz'/>">설정변경</a></li>
			</ul>
			<div class="tab_content_wrap">
				<!-- //tab_content -->
				<div class="tab_content active">
					<div class="coupon_breakdown">
						<div class="wrapper">
							<div class="title">
								<p class="align_l">
									<strong>${NAME} 님</strong> 께서 보유하고 있는 할인 쿠폰내역입니다.
								</p>
								<div class="align_r">
									<a href="/mypage/myCrewCoupon" class="btn" style='display:none;'><span class="btn_txt">Crew쿠폰</span></a>
								</div>
							</div>
							<!-- //title -->

							<div class="tab tab_type2">
								<ul class="btn_tab">
									<li class="active"><a href="<c:url value='/User/Mypage_coupon.pz'/>">미사용 쿠폰 (${CountCoupon})</a></li>
									<li class=""><a href="<c:url value='/User/Mypage_Uncoupon.pz'/>">사용/만료 쿠폰 (${CountUnCoupon})</a></li>
								</ul>
							</div>
							<!-- //tab -->
							<div class="coupon_table">
								<table class="tbl_type">
									<caption>table</caption>
									<colgroup>
										<col style="width:531px">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th>쿠폰명</th>
											<th>유효기간</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${List}" var="dto">
										<tr>
												<td>${dto.c_name}</td>
												<td>${dto.c_sdate} ~ ${dto.c_edate}</td>
										</tr>
										</c:forEach>
										</tbody>
								</table>

								<div class="page_nav">
									<a href='javascript:;' class='btn_ico btn_first'>처음</a><a href='javascript:;' class='btn_ico btn_prev2'>이전</a><ul>
										<li><strong>1</strong></li></ul>
									<a href='javascript:;' class='btn_ico btn_next2'>다음</a><a href='javascript:;' class='btn_ico btn_last'>마지막</a></div>
								<!-- //page_nav -->
								<div class="btn_wrap">
									<div class="btn_fix_center">
										<a href="/goods/list?dsp_ctgr=C0102" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">피자 주문하기</span></a>
									</div>
								</div>
							</div>
							<!-- //coupon_table -->
							</div>
					</div>
				</div>
				<div class="tab_content">3</div>
				<div class="tab_content">4</div>
			</div>
		</div>
		</form>
		<!-- //tab -->
	</div>
	<!-- //content -->
</div>
<!-- //container -->

<script type="text/javascript">
$(document).ready(function(){
	$('.btn_tab a').unbind("click");
});

//페이징
function paging(no){
	$("#pageNo").val(no);
	$("#f").submit();
}
</script>

<!-- 로딩 이미지 -->
		<div class="loading" id="defaultLoading" style="display:none;">
			<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/loading.gif" alt="loading">
			<div class="dim"></div>
		</div>
		<!-- // 로딩 이미지 -->


<%@include file="/WEB-INF/Pizza/template/foot.jsp" %>	
</div>
</html>
