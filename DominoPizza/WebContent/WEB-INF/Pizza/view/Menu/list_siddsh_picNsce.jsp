<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 사이드 디쉬-피클&소스 페이지 -->
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
	<link rel="shortcut icon" href="<c:url value='/Pizza/Image/favicon.ico'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/font.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css'/>">
	<!-- https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css / /Pizza/css/layout.css -->
<script type="text/javascript" src="<c:url value='/Pizza/js/jquery1.11.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery.flexslider.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/selectbox.js'/>"></script><!-- js 수정함. -->
	<script type="text/javascript" src="<c:url value='/Pizza/js/d2CommonUtil.js'/>"></script>
	<%-- <script type="text/javascript" src="<c:url value='/Pizza/js/Cookie.js'/>"></script> --%> <!-- 오류 부분 -->
	<script type="text/javascript" src="<c:url value='/Pizza/js/basket_w.js'/>"></script>
	<script type="text/javascript">
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";

	$(document).ready(function() {
		$.ajaxSetup({cache:false});
		$(".gnb_menu .menu02").addClass("on");
		
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
	<jsp:include page="/WEB-INF/Pizza/template/Top.jsp" />
	
<script>
$(document).ready(function() {
	
	
	$(".tab_category > ul > .C0203").addClass("active");


	$(".minus").click(function() {
		var obj = $(this).next().find("input");
		var cnt = parseInt(obj.val()) - 1;
		if(cnt < 1) cnt = 1;

		obj.val(cnt);
	});

	$(".add").click(function() {
		var obj = $(this).prev().find("input");
		var cnt = parseInt(obj.val()) + 1;
		if(cnt > 99) cnt = 99;

		obj.val(cnt);
	});
	
	<!-- 2017-05-08 // 챗봇 추가(s) -->
	$(document).ready(function(){
		var showAlert = setTimeout(function() {
			$('.chat_bubble').removeClass('active');
		}, 5000);
		$('.btn_chat').click(function(e){
		
				if(!confirm("DomiChat은 로그인이 필요한 서비스입니다.\n회원/비회원 로그인해주세요!")) {
					return;
				}else
					location.href = "/global/login?returnUrl=/goods/list";
//				alert('회원 전용 서비스입니다. 로그인 후 실행 해주실 바랍니다.')
			 
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
		$('.btn_chat').hover(function(e){
			e.preventDefault();
			$('.chat_bubble').addClass('active');
		})
		$('.btn_chat').mouseout(function(e){
			e.preventDefault();
			$('.chat_bubble').removeClass('active');
		})
	})
	
	window.onmessage = function(e){
		if(e.data == "CHAT_CLOSE_ACCEPT"){
			e.preventDefault();
			$('.layer_chat').removeClass('active');
			$('body').removeClass('fixed');
			$('#chatUrl').attr('src', "https://domichat.dominos.co.kr:10000/pc/order.html?dominoId=&customerName=&customerHpNo=");
		}else
			alert("챗봇 서버와 통신이 원할하지 않습니다. 새로고침 후에 사용해 주세요");
	}
});


var qty = 0;
var addGoods = function(goodsCode) {
	qty = parseInt($("#"+goodsCode+"_qty").val());

	var returnUrl = "/goods/list?dsp_ctgr=C0203";

	addBasket("addGD", goodsCode, qty, "", "", addBasketComplete, returnUrl);
};

var addBasketComplete = function() {

};

var goView = function(menuCode, url) {
	location.href = url;
};

var chocolatChk = function() {
	if(confirm("해당 제품은 현재 900원 특가 프로모션 진행중입니다.\n특가제품 페이지로 이동하시겠습니까?")){
		location.href = "/hotdeal/chocolat";
	} else {
		return;
	}
}

</script>

<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="product">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><a href="<c:url value='/menuList.pz?ty=104' />">사이드디시</a></li>
				<li><span>피클&소스</span></li>
				</ul>
			<div class="sub_title_wrap">
				<h2>사이드디시</h2>
			</div>
		</div>
		<!-- //sub_title -->
		<div class="tab_category">
			<ul class="btn_tab">

	<li class="C0201"><a href="<c:url value='/menuList.pz?ty=104' />">사이드디시</a></li>
				<li class="C0202"><a href="<c:url value='/Pizza/Menu/sidedish_beverage.pz'/>">음료</a></li>
				<li class="active"><a href="<c:url value='/Pizza/Menu/sidedish_pickleNSouce.pz'/>">피클&소스</a></li>
		</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">
					<div class="visual_category">
						<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/img_C0203.png" alt="">
					</div>
					<div class="lst_prd_type option_type">

						<!-- li 1번째 5번째 class="prd_list_rgt" 추가 -->
						<ul>
						<c:set value="block" var="footDisplay"/>
							

								<c:forEach var="pcNsc" items="${pickle}" varStatus="loop1">

								<c:if test="${(loop1.count-1) % 4==0 }" var="pif">
										<c:set value="prd_list_rgt" var="pclass" />
									</c:if>
									<c:if test="${!pif }">
										<c:set value=" " var="pclass" />
									</c:if>
		
									
										<li class="${pclass}">
										<div class="prd_img">
											<div class="prd_tag"></div>
											<div class="prd_img_view">
												<img src="<c:url value='/Pizza/Image/sidedish/pickleNSouce/'/>${fn:replace(pcNsc.pc_img,' ', '')}" alt="${pcNsc.pc_name}" title="${pcNsc.pc_name}"/>
											</div>
										</div>
										<div class="prd_info">
											<div class="prd_title">${pcNsc.pc_name}</div>
										</div>
										<div class="prd_price">
											<p class="price_num"><fmt:formatNumber value="${pcNsc.pc_price}" />원</em></em>
											</p>
											<div class="prd_option">
												<div class="input_num">
													<a  onclick="pmins('${pcNsc.pc_no}')" class="minus"><span
														class="ico ico_minus"></span></a>
													<div class="form_item">
														<input type="text" id="${pcNsc.pc_no}_pqty" class="i_text"
															value="1">
													</div>
													<a onclick="padds('${pcNsc.pc_no}')" class="add"><span
														class="ico ico_add"></span></a>
												</div>
												<a onclick="pbasket('${pcNsc.pc_no}')" style="cursor: pointer;"
													class="btn_ico btn_cart2">장바구니</a>
											</div>
										</div>
									</li>
									
									
									</c:forEach>
								
								
									
									<c:forEach var="pcNsc" items="${sauce}" varStatus="loop2">
									
									
									<c:if test="${(loop1.count + loop2.count) % 4==0 }" var="pif">
										<c:set value="prd_list_rgt" var="pclass" />
									</c:if>
									<c:if test="${!pif }">
										<c:set value=" " var="pclass" />
									</c:if>
		
									
										<li class="${pclass}">
										<div class="prd_img">
											<div class="prd_tag"></div>
											<div class="prd_img_view">
												<img src="<c:url value='/Pizza/Image/sidedish/pickleNSouce/'/>${fn:replace(pcNsc.sc_img,' ', '')}" alt="${pcNsc.sc_name}" title="${pcNsc.sc_name}"/>
											</div>
										</div>
										<div class="prd_info">
											<div class="prd_title">${pcNsc.sc_name}</div>
										</div>
										<div class="prd_price">
											<p class="price_num"><fmt:formatNumber value="${pcNsc.sc_price}" />원</em></em>
											</p>
											<div class="prd_option">
												<div class="input_num">
													<a onclick="smins('${pcNsc.sc_no}')" class="minus"><span
														class="ico ico_minus"></span></a>
													<div class="form_item">
														<input type="text" id="${pcNsc.sc_no}_sqty" class="i_text"
															value="1">
													</div>
													<a onclick="sadds('${pcNsc.sc_no}')" class="add"><span
														class="ico ico_add"></span></a>
												</div>
												<a onclick="basket('${pcNsc.sc_no}')" style="cursor: pointer;"
													class="btn_ico btn_cart2">장바구니</a>
											</div>
										</div>
									</li>
									
									</c:forEach>
							
							
							</ul>
						</div>

					</div>
					
				<script>
					function padds(ids){
								var spn = document.getElementById(ids+"_pqty");
								spn.value = parseInt(spn.value)+1;
								
						}
					function pmins(ids){
							var spn = document.getElementById(ids+"_pqty");
							if(parseInt(spn.value)!=1){
							spn.value = parseInt(spn.value)-1;
							}
							
						}
					
			function sadds(ids){
						var spn = document.getElementById(ids+"_sqty");
						spn.value = parseInt(spn.value)+1;
				}

			function smins(ids){
					var spn = document.getElementById(ids+"_sqty");
					if(parseInt(spn.value)!=1){
					spn.value = parseInt(spn.value)-1;
					}
				}					

			
			function basket(ids){
							var spn = document.getElementById(ids+"_sqty");
							var qty = parseInt(spn.value);
							<c:if test="${empty ID }" var="idc" >
							alert("로그인 후 이용가능합니다.");
							location.href="<c:url value='/User/Login.pz' />";
							</c:if>
							<c:if test="${!idc}" >
							<c:if test="${empty DE_ADDR }" var="idc" >
							location.href="<c:url value='/AddrSelect.pz' />";
							</c:if>
							//로딩이미지 추가 
							window.setTimeout( function() {
								$(".loading").css("display","none");
								location.href="<c:url value='/DrinkPncBuy.pz'/>?size=&no="+ids+"&qty="+qty+"&kind=5";
							}, 800); 
							$(".loading").css("display","block");
							//location.href="<c:url value='/DrinkPncBuy.pz'/>?size=&no="+ids+"&qty="+qty+"&kind=5";
							</c:if>
						}
			function pbasket(ids){
				var spn = document.getElementById(ids+"_pqty");
				var qty = parseInt(spn.value);
				<c:if test="${empty ID }" var="idc" >
					alert("로그인 후 이용가능합니다.");
					location.href="<c:url value='/User/Login.pz' />";
				</c:if>
				<c:if test="${!idc}" >
					<c:if test="${empty DE_ADDR }" var="idc" >
					location.href="<c:url value='/AddrSelect.pz' />";
					</c:if>
					location.href="<c:url value='/DrinkPncBuy.pz'/>?size=&no="+ids+"&qty="+qty+"&kind=4";
				</c:if>
			}
			
			</script>
				
				


					<div class="lst_guide" style="${footDisplay}">
					<ul>
						<li>
							※ 트윈크레페/올댓치즈 피자 상품권 이용 안내
							<span>- 트윈크레페/올댓치즈 피자 단종으로 인해 해당 피자 상품권 구매 고객 대상으로 콜라 1.25L 무료제공하고 있습니다.<br>(주문금액 32,900원 초과 시 미제공) </span>
						</li>
						<li>
							※ 도이치휠레 단종으로 인한 상품권 사용 안내
							<span>- 타제품 주문 가능</span> (프리미엄 피자의 경우, 금액 추가)<br>
							<span>- 동일 가격 제품 : 포테이토/슈퍼슈프림/슈퍼디럭스/베이컨체더치즈 더블치즈 엣지, 리얼바비큐 곡물도우  </span>
						</li>
						<li>※ 일부 리조트 및 특수매장은 상기 가격과 차이가 있음 </li>
						<li>※ 모든 사진은 이미지 컷이므로 실제 제품과 다를 수 있습니다. </li>
					</ul>
				</div>
<div class="chat_order active">
					<!-- 2017-07-06 // 챗봇 말풍선 추가(s) -->
					<img class="chat_bubble active" src="http://cdn.dominos.co.kr/renewal2016/ko/w/img/domibubble.png" alt="챗봇말풍선">
					<!-- 2017-07-06 // 챗봇 말풍선 추가(e) -->
					<a href="#" class="btn_chat">채팅주문</a>
					<a href="#" class="btn_close">닫기</a>
				</div>
				<!-- 2017-07-06 // 챗봇 추가(e) -->		
			</div>
		</div>
	</div>
	<!-- //content -->
</div>
<!-- //container -->

<!-- LOGGER 환경변수 설정 -->
<script type="text/javascript">
	var goods_ctgr_nm = "";

	
	goods_ctgr_nm = "피클&소스";
	

	_TRK_PI = "PLV";			// 웹페이지의 성격 정의 - 상품리스트
    _TRK_CP = "/메뉴/사이드디시/"+goods_ctgr_nm;	// 카테고리명 전달
</script>
<!-- // LOGGER 환경변수 설정 -->

<!-- 로딩 이미지 -->
		<div class="loading" id="defaultLoading" style="display:none;">
			<img src="<c:url value='/Pizza/Image/loading.gif'/>" alt="loading">
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
