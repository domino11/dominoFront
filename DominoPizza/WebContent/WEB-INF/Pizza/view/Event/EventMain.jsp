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
		

<script>
$(document).ready(function() {

	$(".gnb_menu .menu05").addClass("on");

});
</script>
		<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="content" class="event">

			<!-- sub_title -->
				<div class="sub_title">
					<ul class="sub_nav">
						<li><a href="<c:url value='/Pizza/MainPage.pz'/>">HOME</a></li>
						<li><a href="<c:url value='/EventMain.pz'/>">이벤트&amp;혜택</a></li>
						<li><span>오늘의 이벤트</span></li>
					</ul>
					<div class="sub_title_wrap">
						<h2>이벤트&amp;혜택</h2>
					</div>
				</div>
				<!-- //sub_title -->

				<!-- tab -->

				<div class="tab_type4 event">
					<ul class="btn_tab">
						<li class="E1"><a href="<c:url value='/EventMain.pz'/>?e=E101">오늘의 이벤트</a></li>
						<li class="E2"><a href="<c:url value='/mania.pz'/>">매니아 혜택</a></li>
					</ul>
				</div>
				<!-- //tab -->
			<div class="event_main_container">
				<ul id="addUl">
				<c:forEach items="${eventmain }" var="eventmain" varStatus="loop">
					<li style="display: list-item; margin-top: 22px" >
						<a href="javascript:goView('${pageNo}','${eventmain.e_no }','E101');" 
							style=" display: block;
								    width: 100%;
								    height: 100%;
								    background: #fff;
								    box-shadow: 1px 2px 3px rgba(69,52,27,0.56);">
							<div class="event_card" id="${pageNo }_${eventmain.e_no}">
								<div class="img_box">
									<img src="https://cdn.dominos.co.kr/admin/upload/event/20170831_1OkQ02WS.jpg" alt="현대카드ZERO/M Edition2 신규발급시 피자할인쿠폰 증정!">
								</div> 
								<!-- //img_box -->
								<div class="card_content" style="padding: 20px ">
									<div class="title" style="font-weight: 500; margin-bottom: 5px; font-size: 20px">${eventmain.e_title }</div>
									<div class="date" style="font-size: 15px">${eventmain.e_sdate } ~ ${eventmain.e_edate }</div>
								</div>
							</div>
						</a>
					</li>
					
				</c:forEach>
				</ul>

					<input type="hidden" id="pageNo" name="pageNo" value="1" />
					<input type="hidden" id="e" name="e" value="E101" />
					<div class="btn_wrap">
						<div class="btn_fix_center" style="padding: 20px">
							<a href="javascript:fncMore();" class="btn_tico btn_gray" id="more_btn"><span class="btn_txt">이벤트 더 보기</span><span class="ico ico_arr_dw3"></span></a>
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

<!-- LOGGER 환경변수 설정 -->

	_TRK_PI = "EVL";	// 웹페이지의 성격 정의 - 이벤트리스트
<!-- // LOGGER 환경변수 설정 -->

$(document).ready(function() {
	$('#pageNo').val("1");

	var hashLocationName = document.location.hash;
	if(hashLocationName != ""){
		var pageNo = (hashLocationName.replace("#","")).split("_")[0];
		for(i=1; i<parseInt(pageNo); i++){
			fncMore();
		}
		//$(hashLocationName).focus();
	}
});
/* 
function fncMore(){
	var pageNo;
   	pageNo = parseInt($('#pageNo').val())+1;

   	if(pageNo <= 2){
   		$('#pageNo').val(pageNo);
        $.ajax({
            type: "POST",
            url: "/event/eventMainAjax",
            data: {
           	 "e" : $('#e').val(),
           	 "pageNo" : pageNo,
            },
            dataType: "json",
            cache : false,
            success: function(res) {
                var html = "" ;
                for(var i=0; i < res.resultData..length; i++) {
   				var resData = res.resultData.[i];

   				html += '		<li>';
   				if(resData.link_url != null && resData.link_url != '') {
   				html += '			<a href="javascript:goLinkView(\''+pageNo+'\',\''+resData.seq+'\',\''+resData.link_url+'\',\''+resData.target+'\');">';
   				} else {
   				html += '			<a href="javascript:goView(\''+pageNo+'\',\''+resData.seq+'\',\''+resData.e+'\');">';
   				}
   				html += '				<div class="event_card" id="'+pageNo+'_'+resData.seq+'">';
    			html += '					<div class="img_box">';
    			html += '						<img src="https://cdn.dominos.co.kr/admin/upload/event/'+ resData.file_nm +'" alt="'+ resData.title +'">';
   				html += '					</div>';
   				
   				html += '					<div class="card_content">';
   				html += '						<div class="title">'+ resData.title +'</div>';
   				html += '						<div class="date">'+ resData.s_date.substring(0,10) +' ~ '+ resData.e_date.substring(0,10) +'</div>';
   				html += '					</div>';
   				html += '				</div>';
   				html += '			</a>';
   				html += '		</li>';
                }
                $('#addUl').append(html);
                $('#more_btn').hide();
            },
            error: function(xhr, status, e) {
                alert(e);
            }
   	});
   	}
}
  */
  
function goView(pageNo, seq, e){
	document.location.hash = "#" + pageNo + "_" + seq;
	location.href = "/event/view?seq="+seq+"&e="+e;
}

function goLinkView(pageNo, seq, link_url, target){
	if(target == "_blank") {
		window.open("about:blank").location.href=link_url;
	} else {
		document.location.hash = "#" + pageNo + "_" + seq;
		location.href = link_url;
	}
}
</script>