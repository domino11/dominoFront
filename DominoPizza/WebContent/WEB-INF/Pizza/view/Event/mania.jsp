<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<li><a href="/main">HOME</a></li>
						<li><a href="/event/list?gubun=E0200">이벤트&amp;혜택</a></li>
						<li><span>매니아 혜택</span></li>
					</ul>
					<div class="sub_title_wrap">
						<h2>이벤트&amp;혜택</h2>
					</div>
				</div>
				<!-- //sub_title -->

				<!-- tab -->
				<div class="tab_type4 event">
					<ul class="btn_tab">
						<li><a href="/event/list?gubun=E0200">오늘의 이벤트</a></li>
						<li class="active"><a href="/event/mania">매니아 혜택</a></li>
					</ul>
				</div>
				<!-- //tab -->

				<!-- 2017-03-27 // 문구 수정(s) -->
				<div class="mania_container top">
					<div class="main_title"><span>온라인 회원이면 누구나 누릴 수 있는</span> 도미노 온라인 매니아!</div>
					<div class="desc">최근 3개월간 온라인 주문내역을 바탕으로 다양한 할인혜택을 드리고 있으며,<br>상위 일부 고객님께는 최고등급 및 <em style="color:red;">혜택(매월 제공)</em>을 제공하고 있습니다.</div>
					<div class="mania_grade_check">
						<div class="mania_sub_title">매월 1일, 나의 온라인 매니아 등급을 확인하세요.</div>
						<a href="/mypage/myLevel" class="btn"><span class="btn_txt">이달의 등급 확인하기</span></a>
					</div>
				</div>
				<!-- 2017-03-27 // 문구 수정(e) -->


				<!-- 2017-04-26 // 문구 추가(s) -->
				<div class="mania_container tip">
					<div class="main_title"><span>도미노피자</span> 온라인 매니아 이용 TIP</div>
					<div class="desc">매니아 쿠폰 쓰고 VIP로 등급 UP! 2010년 이후 구매금액 200만원 이상이면 ROYAL로 등급 UP!</div>
					<div class="mania_tip">
						<ul>
							<li>
								<span class="ico_grade ico_mania_tip"></span>
								<p>회원가입 시<br><span>배달 20% 할인쿠폰 2매</span> 지급!</p>
							</li>
							<li>
								<span class="ico_grade ico_mania_tip2"></span>
								<p>3개월 내 Regular 할인쿠폰 2매<br>사용하면 <span>Premium로 등급 UP!</span></p>
							</li>
							<li>
								<span class="ico_grade ico_mania_tip3"></span>
								<p>3개월 내 Premium 할인쿠폰 3매<br>사용하면 <span>VIP로 등급 UP!</span></p>
							</li>
							<li>
								<span class="ico_grade ico_mania_tip4"></span>
								<p>2010년 이후 200만원 이상<br>구매 시 <span>ROYAL로 등급 UP!</span></p>
							</li>
						</ul>

					</div>
				</div>
				<!-- 2017-04-26 // 문구 추가(e) -->



				<!-- //mania_container -->

				<div class="mania_container grade">
					<div class="grade_benefit">


						<!-- 2017-04-29 // 추가(s) -->
						<div class="grade_royal">
							<div class="grade_condition">
								<span class="ico_grade royal">ROYAL</span>
								<p class="condition_desc">2010년 이후 결제 금액<br><em>200만원</em> 이상 구매고객</p>
							</div>
							<div class="grade_benefit_list">
								<div class="lst_type v5">
									<ul>
										<li>상시 배달주문 20% 할인</li>
										<li>배달주문 30% 할인쿠폰 1매</li>
										<li>방문포장 40% 할인쿠폰 1매</li>
										<li>생일 방문포장 50% 할인쿠폰 1매</li>
									</ul>
								</div>
							</div>
							<div class="grade_period">
								<div class="period_inner">
									<div class="title">등급 유지 기간</div>
									<div class="lst_type v5">
										<ul>
											<li>ROYAL 등급 취득 시, 다운<br>그레이드 없이 매월 등급 유지<br><em>※ 매니아 등급 및 혜택은<br>매월 변경될 수 있습니다.</em></li>
											<li>2010년 이 후 전월까지의 온라인<br>주문 건 (홈페이지, 모바일웹,<br>앱) 구매금액을 기준으로<br>산정됩니다.<br>(구매횟수 미포함)</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- 2017-04-29 // 추가(e) -->


						<!-- 2017-04-26 // 문구 수정(s) -->
						<div class="grade_common">
							<ul>
								<li>
									<div class="grade_condition">
										<span class="ico_grade vip">VIP</span>
										<p class="condition_desc">
											최근 3개월 주문횟수<br><em>6회</em> 이상 구매고객
										</p>
									</div>
									<!-- //grade_condition -->
									<div class="grade_benefit_list">
										<div class="lst_type v5">
											<ul>
												<li>배달주문 20% 할인쿠폰 1매</li>
												<li>배달주문 30% 할인쿠폰 1매</li>
												<li>방문포장 40% 할인쿠폰 1매</li>
												<li>생일 방문포장 50% 할인쿠폰 1매</li>
											</ul>
										</div>
									</div>
									<!-- //grade_benefit_list -->
								</li>
								<li>
									<div class="grade_condition">
										<span class="ico_grade premium">PREMIUM</span>
										<p class="condition_desc">
											최근 3개월 주문횟수<br><em>2~5회</em> 구매고객
										</p>
									</div>
									<!-- //grade_condition -->
									<div class="grade_benefit_list">
										<div class="lst_type v5">
											<ul>
												<li>배달주문 20% 할인쿠폰 1매</li>
												<li>배달주문 25% 할인쿠폰 1매</li>
												<li>방문포장 35% 할인쿠폰 1매</li>
											</ul>
										</div>
									</div>
									<!-- //grade_benefit_list -->
								</li>
								<li>
									<div class="grade_condition">
										<span class="ico_grade regular">REGULAR</span>
										<p class="condition_desc">
											최근 3개월 주문횟수<br><em>0~1회</em> 구매고객
										</p>
									</div>
									<!-- //grade_condition -->
									<div class="grade_benefit_list">
										<div class="lst_type v5">
											<ul>
												<li>배달주문 20% 할인쿠폰 2매</li>
											</ul>
										</div>
									</div>
									<!-- //grade_benefit_list -->
								</li>
							</ul>


							<!-- 2017-04-26 // 영역 이동 및 수정(s) -->
							<div class="grade_period">
								<div class="period_inner">
									<div class="title">등급 유지 기간</div>
									<div class="lst_type v5">
										<ul>
											<li>산정된 등급은 당월 포함하여 최대 3개월 유지<br>(예시 : 5월 PREMIUM 등급 - 7월까지 PREMIUM 유지)</li>
											<li>유지기간 중 실적만족으로 등급 상향 시, 상향등급으로 업그레이드 되며 당월 포함 최대 3개월 유지</li>
											<li>최근 3개월 동안의 온라인 주문 건(홈페이지, 모바일 웹, 앱) 기준 <span>구매횟수에 해당하는</span> 높은 등급으로 적용됩니다.</li>
											<li>등급 상향 조정 및 등급 유지는 최근 3개월 주문실적으로 갱신됩니다.</li>
		                                </ul>
		                            </div>
		                        </div>
		                    </div>
		                    <!-- 2017-04-26 // 영역 이동 및 수정(e) -->


						</div>
						<!-- //grade_common -->
					</div>
					<!-- //grade_benefit -->
					<!-- 2017-03-27 // 문구 수정(e) -->

					<!-- 2017-04-27 // 문구 추가(s) -->
					<p class="txt_grade_benefit">
						2017년 9월 1일 기준
					</p>
					<!-- 2017-04-27 // 문구 추가(e) -->

				</div>
				<!-- //mania_container -->

				<div class="mania_container last">
					<div class="mania_noitce">
						<div class="notice_title">쿠폰 안내</div>
						<div class="notice_list">
							<div class="lst_type v5">
								<!-- 2017-04-26 // 문구 수정(s)-->
								<ul>
									<li>제공된 쿠폰은 온라인 주문(홈페이지, 모바일 웹, 앱)만 사용가능(전화주문 불가)</li>
									<li>제휴 및 여타할인과 중복할인 적용 불가(단, 반값 사이드디시 예외)</li>
									<li>발급된 쿠폰은 해당 월~말일까지 사용 가능</li>
									<li><span>ROYAL 및  VIP 등급에게만</span> 발급되는 생일 50% 쿠폰은 당월 생일자에게만 발급되며, 방문포장 주문 시 사용 가능 합니다.<br>(50% 할인은 피자 1판에만 적용됩니다.)</li>
								</ul>
								<!-- 2017-04-26 // 문구 수정(e)-->

							</div>
						</div>
						<!-- //notice_list -->
					</div>
					<!-- //mania_noitce -->

					<!-- 2017-03-27 // 문구 이미지 추가(s) -->
					<div class="mania_noitce">
						<div class="notice_title">쿠폰 사용방법</div>
						<div class="notice_desc">
							나의 정보 > 매니아 등급 페이지에서 쿠폰 발급
							<div class="img_box">
								<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/mania_infomation2.jpg" alt="">
							</div>
						</div>
						<div class="notice_desc">
							주문 시 주문서 작성 페이지에서 MY 쿠폰 중 보유한 쿠폰 선택 후 적용
							<div class="img_box">
								<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/mania_infomation.jpg" alt="">
							</div>
						</div>
					</div>
					<!-- //mania_noitce -->
					<!-- 2017-03-27 // 문구 이미지 추가(s) -->

					<div class="mania_noitce">
						<div class="notice_title">주의사항</div>
						<div class="notice_list">
							<div class="lst_type v5">
								<ul>
									<li>쿠폰은 해당 월, 해당등급의 쿠폰을 받을 수 있으며, 당월 이내로만 사용 가능합니다.</li>
									<li>혜택 및 운영방법은 본사 사정에 의해 변경될 수 있습니다.</li>
									<li>온라인 고객등급 관련 문의 : 고객만족실 080-860-3082</li>
								</ul>
							</div>
						</div>
						<!-- //notice_list -->
					</div>
					<!-- //mania_noitce -->

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
