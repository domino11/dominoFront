<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery1.11.1.js' />"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/jquery.flexslider.js"></script>
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

	<!-- wrap  -->
	<div id="wrap">
	
	
	
	<jsp:include page="/WEB-INF/Pizza/template/Top.jsp" />


<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="content" class="notice">

				<!-- sub_title -->
				<div class="sub_title">
					<ul class="sub_nav">
						<li><a href="/main">HOME</a></li>
						<li><a href="/bbs/newsList?type=N">공지사항</a></li>
						<li><span>도미노뉴스</span></li>
					</ul>
					<div class="sub_title_wrap">
						<h2>공지사항</h2>
					</div>
				</div>
				<!-- //sub_title -->

				<div class="notice_area">
					<div class="tab_type">
						<ul class="btn_tab">
							<li class="active"><a href="/bbs/newsList?type=N">도미노뉴스</a></li>
							<li><a href="/bbs/newsList?type=P">PRESS</a></li>
						</ul>
						<div class="tab_content_wrap">
							<div class="tab_content active">
								<form id="searchForm" name="searchForm" action="/bbs/newsList" method="post">
									<input type="hidden" id="type" name="type" value="N" />
									<input type="hidden" id="pageNo" name="pageNo" value="1" />
									<div class="form_group" style="width:530px;">
										<div class="form_field">
											<div class="sel_box">
												<select id="search" name="search">
													<option value="subject">제목</option>
													<option value="content">내용</option>
													<option value="all">제목+내용</option>
												</select>
											</div>
										</div>
										<div class="form_field">
											<div class="form_item">
												<input type="text" id="conditionTemp" name="conditionTemp" class="i_text" value="">
												<input type="hidden" id="condition" name="condition" class="i_text" value="">
											</div>
										</div>
										<div class="form_field">
											<a href="javascript:fncSearch();" class="btn btn_srch"><span class="btn_txt">검색</span></a>
										</div>
									</div>
								</form>
								<p class="srch_result">총 <span>254</span>건</p>
								<table class="tbl_lst">
									<colgroup>
										<col width="100px">
										<col>
										<col width="150px">
										<col width="105px">
									</colgroup>
									<thead>
										<tr>
											<th class="tbl_num">번호</th>
											<th class="tbl_name">제목</th>
											<th class="tbl_date">등록일</th>
											<th class="tbl_views">조회</th>
										</tr>
									</thead>
									<tbody>
									
									<tr>
											<td>254</td>
											<td><a href="#none" onclick="goView('1964'); return false;">2017년 9월 프로야구 이벤트 당첨자 홈페이지 안내</a></td>
											<td>2017-09-01</td>
											<td>1208</td>
										</tr>
										
										
										</tbody>
								</table>
								<div class="page_nav">
									<a href='javascript:;' class='btn_ico btn_first'>처음</a><a href='javascript:;' class='btn_ico btn_prev2'>이전</a><ul>
										<li><strong>1</strong></li>  <li><a href='javascript:;' onclick='javascript:paging(2); return false;'>2</a></li>  <li><a href='javascript:;' onclick='javascript:paging(3); return false;'>3</a></li>  <li><a href='javascript:;' onclick='javascript:paging(4); return false;'>4</a></li>  <li><a href='javascript:;' onclick='javascript:paging(5); return false;'>5</a></li>  <li><a href='javascript:;' onclick='javascript:paging(6); return false;'>6</a></li>  <li><a href='javascript:;' onclick='javascript:paging(7); return false;'>7</a></li>  <li><a href='javascript:;' onclick='javascript:paging(8); return false;'>8</a></li>  <li><a href='javascript:;' onclick='javascript:paging(9); return false;'>9</a></li>  <li><a href='javascript:;' onclick='javascript:paging(10); return false;'>10</a></li></ul>
									<a href='javascript:;' class='btn_ico btn_next2' onclick='javascript:paging(11, 1); return false;'>다음</a><a href='javascript:;' class='btn_ico btn_last' onclick='javascript:paging(26); return false;'>마지막</a></div>
							</div>
						</div>
					</div>
				</div>
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
<script type="text/javascript">
$(document).ready(function(){
	var condition = $('#condition').val();
	if(condition.indexOf('[[')>-1) {
		condition = condition.replace('[[','[');
	}

	if(condition.indexOf(']]')>-1) {
		condition = condition.replace(']]',']');
	}
	$('#conditionTemp').val(condition);
});

$('#conditionTemp').keyup(function(e){
	if(e.keyCode == 13) {
		if($('#conditionTemp').val() == '') {
			alert('검색어를 입력해주세요');
			return;
		}

		fncSearch();
	}
});

function paging(no){
	$("#pageNo").val(no);
	$("#searchForm").submit();
}

function fncSearch() {
	if($('#conditionTemp').val() == '') {
		alert('검색어를 입력해주세요');
		return;
	}

	var condition = $('#conditionTemp').val();
	condition = condition.replace('[','[[');
	condition = condition.replace(']',']]');

	$('#condition').val(condition);
	$('#pageNo').val(1);

	$("#searchForm").attr("action", "/bbs/newsList");
	$('#searchForm').submit();
}

var queryString;
function setQueryString() {
	queryString = $('#searchForm').serialize();
}

function goView(idx) {
	$("#searchForm").attr("action", "/bbs/newsView?idx="+idx).submit();
}
</script>