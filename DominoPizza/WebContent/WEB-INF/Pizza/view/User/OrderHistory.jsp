<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
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
	
	var goPresentLogin = function(gubun) {
		var rtnUrl = "/voucher/list?gubun="+gubun;
		if("true" == "true"){
			location.href = rtnUrl;
		}else{
			location.href = "/global/login?returnUrl="+rtnUrl;	
		}
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
				<li><span>주문조회</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>나의 정보</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="tab tab_type4">
			<ul class="btn_tab">
				<li class=""><a href="<c:url value='/User/MyPage_Mania.pz'/>">매니아 등급</a></li>
				<li class="active"><a href="<c:url value='/User/Mypage_OrderHistory.pz'/>">주문조회</a></li>
				<li class=""><a href="<c:url value='/User/Mypage_coupon.pz'/>">쿠폰</a></li>
				<li class=""><a href="<c:url value='/User/Mypage_ChangeSetting.pz'/>">설정변경</a></li>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">
					<div class="wrapper">
						<div class="order_intro">
							<p class="title"><strong>${NAME} 님</strong>이 주문한 내역입니다.</p>
							<p class="desc">- 주문을 취소하시려면 해당 매장으로 전화하셔야 합니다.</p>

							</div>
						<!-- //order_intro	 -->
					</div>
					<!-- //wrapper -->

					</div>
				<!-- //tab_content -->
				<div class="tab_content">2</div>
				<div class="tab_content">3</div>
				<div class="tab_content">4</div>
			</div>
		</div>
		<!-- //tab -->

		<div class="container">
			<div class="wrapper">
				<div class="tab tab_type2">
					<ul class="btn_tab">
						<li class="active"><a href="">주문 목록</a></li>
					</ul>
				</div>
				
				<!-- //tab -->
				<div class="empty_data">
					<div class="coupon_table">
					<c:if test="${empty List}" var="result">
									
										<span class="ico ico_empty_data"></span>
										<p class="description">주문내역이 없습니다.</p>
									
									</c:if>
								<table class="tbl_type">
								<c:if test="${not result}">
									<caption>table</caption>
									<colgroup>
										<col style="width:531px">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th>주문 상품</th>
											<th>주문 상태</th>
											<th>분류</th>
											<th>수량</th>
											<th>가격</th>
										</tr>
									</thead>
									
									<tbody>
									
										<c:forEach items="${List}" var="dto">
										<tr>					
												<td>${dto.menu_name}</td>
												<td>${dto.sa_pro}</td>
												<td>${dto.menu_kind}</td>
												<td>${dto.menu_qty}</td>
												<td><fmt:formatNumber>${dto.menu_price}</fmt:formatNumber></td>
										</tr>
										</c:forEach>
								 </c:if>
										</tbody>
								</table>

					<div class="btn_gruop">
						<a href="<c:url value='/menuList.pz?ty=102'/>" class="btn btn_mdle btn_blue btn_basic"><span class="btn_txt">신제품 보러 가기</span></a>
						<a href="<c:url value='/menuList.pz?ty=103'/>" class="btn btn_mdle btn_blue btn_basic"><span class="btn_txt">다른 제품 둘러보기</span></a>
					</div>
				</div>
				</div>
		</div>
		<!-- //container -->

		<div class="container">
			<div class="wrapper">
				<div class="using_guide">
					<p class="title">주문조회 이용안내</p>
					<ol class="guide_list">
						<li>매장(1577-3082) 또는 콜센터(080-860-3082) / 다른 이름으로 주문하신 내역은 온라인 주문내역에 표시되지 않습니다.</li>
						<li>온라인 상으로 주문한 최초의 이력만 확인하실 수 있으며, 전화를 통해 변경하신 사항은 반영되지 않습니다.</li>
						<li>주문번호를 클릭하시면 상세정보(주문번호/배달장소/주문내역 등)를 확인하실 수 있습니다.</li>
						<li>메뉴 변경이나 주문취소를 원하실 경우, 매장에 주문번호를 알려주셔야 합니다. (온라인으로 주문취소는 불가합니다.)</li>
						<li>결제방법을 수정하실 경우에는 해당 매장으로 직접 연락하셔야 하며, 배달 중에는 변경 불가합니다.</li>
						<li>영수증 출력을 원하시는 고객님은 주문상세 페이지의 ‘영수증 출력’을 클릭하시면, 해당 주문의 영수증을 출력할 수 있습니다.</li>
						<li>주문이력은 최대 1년까지 확인 가능합니다.</li>
					</ol>
				</div>
				<!-- //using_guide -->

				<div class="using_guide v2">
					<p class="title">주문취소 안내</p>
					<ol class="guide_list">
						<li>
							지류 상품권
							<ul>
								<li>- 피자 상품권이 발송된 이후에는 취소가 불가능합니다.</li>
								<li>- 주문 취소 접수 시, 신용카드 취소는 5~7일 이내에 해당 카드사에서 취소내역을 확인하실 수 있습니다.</li>
							</ul>
						</li>
						<li>
							모바일 상품권
							<ul>
								<li>- 구매 시 입력하신 휴대전화로 MMS 발송 후에는 취소가 불가능합니다.</li>
							</ul>
						</li>
					</ol>
				</div>
				<!-- //using_guide -->
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //content -->
</div>
<!-- //container -->

<form name="f" id="f" method="get" action="/mypage/myOrderList">
<input type="hidden" name="order_no" id="order_no" />
<input type="hidden" name="pageNo" id="pageNo" value="1">
</form>

<script type="text/javascript">
$(document).ready(function(){
	$('.btn_tab a').unbind("click");

	//order 트래커 slide
	$('.sample_slide2 .slide_wrap').flexslider({
		animation: 'slide',
		animationSpeed: 2000,
		slideshowSpeed: 10000,
		animationLoop : false,
		after: function(slider) {
			/* 주문 상태 메시지, 현재 주문 상세보기 보기 설정 */
			//트래커 상태 1~4 (1,2: 접수 완료 / 3: 요리중 / 4: 배달중)
			var obj = slider.slides[slider.currentSlide];
			var state = $(obj).data("state");
			$("[id^='state']").hide();
			$("#state"+state).show();
			$("#curOrderBtn").attr("href", "javascript:goView('"+$(obj).data("no")+"');");
		}
	});

	
});

//주문 내역 상세보기
function goView(order_no) {
	if(order_no.length > 15 || parseInt(order_no.substring(0,8)) > 20090300 ){
		$('#order_no').val(order_no);
		$('#f').attr("action", "/mypage/myOrderView");
		$('#f').submit();
	}else{
		alert("2009년 3월 이전 주문내역은 콜센터로 문의 바랍니다.");
		return;
	}
}

//주문 내역 삭제
function goDelete(order_no) {
	if(confirm('주문내역만 삭제될 뿐 주문이 취소되진 않습니다. \n취소를 하시려면 해당매장으로 전화하셔야 합니다.')){
		$.ajax({
			type: "POST",
			url: "/mypage/myOrderDelete",
			data : { "order_no" : order_no },
			dataType : "json",
			success:function(data) {
				alert(data.msg);
				if(data.status == "success")
					location.reload();
				return;
			},
			error: function (error){
				alert("다시 시도해주세요.");
			}
		});
	}
}

//페이징
function paging(no){
	$("#pageNo").val(no);
	$('#f').attr("action", "/mypage/myOrderList");
	$("#f").submit();
}
//GPS Tracker 팝업
function tracker_open(order_no){
	//alert(order_no);
	//order_no="20160317862811000001";
	var trackertUrl = "/mypage/gpsTrackerView?order_no="+order_no;
	window.open(trackertUrl,"tracker","left=300, top=200,width=750, height=655, toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
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

	<!-- Google Tag Manager : dominos_web -->
	<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TR97KL" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-TR97KL');</script>
	<!-- End Google Tag Manager -->

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
