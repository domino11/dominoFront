<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	

<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="content" class="notice">

				<!-- sub_title -->
				<div class="sub_title">
					<ul class="sub_nav">
						<li><a href="<c:url value='/Pizza/MainPage.pz'/>">HOME</a></li>
						<li><a href="<c:url value='/NewsList.pz'/>">공지사항</a></li>
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
							<c:if test="${type == 1 }" var="1">
								<li class="active"><a href="<c:url value='/NewsList.pz?type=1'/>">도미노뉴스</a></li>
								<li><a href="<c:url value='/NewsList.pz?type=2'/>">PRESS</a></li>
							</c:if>
							<c:if test="${type == 2 }" >
								<li><a href="<c:url value='/NewsList.pz?type=1'/>">도미노뉴스</a></li>
								<li class="active"><a href="<c:url value='/NewsList.pz?type=2'/>">PRESS</a></li>
							</c:if>
						</ul>
						<div class="tab_content_wrap">
							<div class="tab_content active">
								<form id="searchForm" name="searchForm" action="<c:url value='/NewsList.pz?type=${type}'/>" method="post">
									<input type="hidden" id="type" name="type" value="${type }" />
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
								<c:if test="${type == 1 }">
									<p class="srch_result">총 <span>${newsTotal }</span> 건</p>
								</c:if>
								<c:if test="${type == 2 }">
									<p class="srch_result">총 <span>${pressTotal }</span> 건</p>
								</c:if>
								
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
											<th class="tbl_views">조회수</th>
										</tr>
									</thead>
									
									<c:forEach items="${newslist }" var="newslist" varStatus="loop">
									<tbody>
									<tr>
										<td class="no_list" >${newslist.n_no }</td>
										<td><a href="#none" onclick="goView('1964'); return false;">${newslist.n_title }</a></td>
										<td>${newslist.n_date }</td>
										<td>${newslist.n_count }</td>
									</tr>
									</tbody>
									</c:forEach>
								</table>
							<!-- 	
								페이징 아직.
									<div class="page_nav">
									<a href='javascript:;' class='btn_ico btn_first'>처음</a>
									<a href='javascript:;' class='btn_ico btn_prev2'>이전</a>
										<ul>
											<li><strong>1</strong></li>  
											<li><a href='javascript:;' onclick='javascript:paging(2); return false;'>2</a></li>  
											<li><a href='javascript:;' onclick='javascript:paging(3); return false;'>3</a></li>  
											<li><a href='javascript:;' onclick='javascript:paging(4); return false;'>4</a></li>  
											<li><a href='javascript:;' onclick='javascript:paging(5); return false;'>5</a></li>  
											<li><a href='javascript:;' onclick='javascript:paging(6); return false;'>6</a></li>  
											<li><a href='javascript:;' onclick='javascript:paging(7); return false;'>7</a></li>  
											<li><a href='javascript:;' onclick='javascript:paging(8); return false;'>8</a></li>  
											<li><a href='javascript:;' onclick='javascript:paging(9); return false;'>9</a></li>  
											<li><a href='javascript:;' onclick='javascript:paging(10); return false;'>10</a></li>
										</ul>
									<a href='javascript:;' class='btn_ico btn_next2' onclick='javascript:paging(11, 1); return false;'>다음</a>
									<a href='javascript:;' class='btn_ico btn_last' onclick='javascript:paging(26); return false;'>마지막</a>
								</div> -->
							</form>
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

		<jsp:include page="/WEB-INF/Pizza/template/foot.jsp"></jsp:include>
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

function paging(n_no){
	$("#pageNo").val(n_no);
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