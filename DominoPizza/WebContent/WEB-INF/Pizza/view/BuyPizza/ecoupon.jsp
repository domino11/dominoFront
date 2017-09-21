<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 선물하기 -모바일 상품권(도미노콘) 페이지 -->
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
	<!-- 헤더 인클루드 -->
	<jsp:include page="/WEB-INF/Pizza/template/Top.jsp" />
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
	<!-- 헤더 인클루드 -->
	<jsp:include page="/WEB-INF/Pizza/template/Top.jsp" />
	
<script type="text/javascript">
$(document).ready(function() {
	$(".gnb_menu .menu07").addClass("on");
	
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
});

var goVoucher = function(gubun, pid) {
	var rtnUrl = "/voucher/list?gubun="+gubun;
	if("false" == "true"){
		if("false" == "true"){
			addVoucherBasket(gubun, pid);
		}else{
			alert("회원 전용 서비스입니다.");
		}
	}else{
		if(confirm("회원 전용 서비스입니다. \n회원로그인 하시겠습니까?")){
			location.href = "/global/login?returnUrl="+encodeURIComponent(rtnUrl);
		}
	}
};

</script>
<div id="container">
	<!-- content -->
	<div id="content" class="event">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><a href="/contents/present">선물하기</a></li>
				<li><span>모바일 상품권(도미노콘)</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>선물하기</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="tab_type">
			<ul class="btn_tab">
				<li><a href="/contents/present">전체</a></li>
				<li><a href="/voucher/list?gubun=J">지류 상품권</a></li>
				<li class="active"><a href="/voucher/list?gubun=M">모바일 상품권(도미노콘)</a></li>
			</ul>
			<div class="tab_content_wrap gift">
				<div class="tab_content"></div>
				<!-- //tab_content -->
				<div class="tab_content active">
					<div class="gift_certificate">
						<ul class="discount">
							<li>
								<span class="discount_tag"><strong>10</strong>%<br>할인</span>
								<p class="gift_num">10장 미만</p>
							</li>
							<li>
								<span class="discount_tag"><strong>15</strong>%<br>할인</span>
								<p class="gift_num">10장 이상</p>
							</li>
						</ul>
						<!-- //discount -->
						<div class="lst_type v5">
							<ul>
								<li>도미노콘 구입은 홈페이지/모바일 웹/앱 에서 구입 가능</li>
								<li>도미노콘은 인터넷 주문 시에만 사용 가능 (전화 제외)</li>
								<li>구입 후 MMS 발송된 도미노콘은 취소/환불 불가</li>
								<li>도미노콘 유효기간은 구입일로부터 &lt;60일&gt; 이내 이용 가능</li>
							</ul>
						</div>
						<!-- //list -->
					</div>
					<!-- //gift_certificate -->
				</div>
			</div>
		</div>
		<!-- //tab -->

		<div class="lst_prd_type option_type">
			<ul>
				<li class="prd_list_rgt">
					<!-- a href="#" -->
					<div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/admin/upload/voucher/M/20170609_068LDN4U.jpg" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/voucher/M/voucher_default.jpg'" alt="꽃게 온더 L"></div>
					</div>
					<!-- div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/menu/voucher/20170609_068LDN4U.jpg" alt="꽃게 온더 L"></div>
					</div -->
					<div class="prd_info">
						<div class="prd_title">꽃게 온더 L</div>
					</div>
					<!-- /a -->
					<div class="prd_price">
						<p class="price_large"><span class="txt_prd_dough">오리지널</span> <span class="ico ico_s_large"></span>33,900원</p>
						<div class="prd_option">
							<div class="input_num">
								<a href="javascript:;" class="minus"><span class="ico ico_minus"></span></a>
								<div class="form_item">
									<input type="text" name="SST854SL_qty" id="SST854SL_qty" class="i_text" value="1">
								</div>
								<a href="javascript:;" class="add"><span class="ico ico_add"></span></a>
							</div>
							<a href="javascript:goVoucher('M', 'SST854SL');" class="btn_ico btn_cart2">장바구니</a>
						</div>
					</div>
				</li>
				<li class="">
					<!-- a href="#" -->
					<div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/admin/upload/voucher/M/20170308_40BHtVe8.jpg" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/voucher/M/voucher_default.jpg'" alt="더블크러스트치즈멜팅L"></div>
					</div>
					<!-- div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/menu/voucher/20170308_40BHtVe8.jpg" alt="더블크러스트치즈멜팅L"></div>
					</div -->
					<div class="prd_info">
						<div class="prd_title">더블크러스트치즈멜팅L</div>
					</div>
					<!-- /a -->
					<div class="prd_price">
						<p class="price_large"><span class="txt_prd_dough">오리지널</span> <span class="ico ico_s_large"></span>32,900원</p>
						<div class="prd_option">
							<div class="input_num">
								<a href="javascript:;" class="minus"><span class="ico ico_minus"></span></a>
								<div class="form_item">
									<input type="text" name="SST853DL_qty" id="SST853DL_qty" class="i_text" value="1">
								</div>
								<a href="javascript:;" class="add"><span class="ico ico_add"></span></a>
							</div>
							<a href="javascript:goVoucher('M', 'SST853DL');" class="btn_ico btn_cart2">장바구니</a>
						</div>
					</div>
				</li>
				<li class="">
					<!-- a href="#" -->
					<div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/admin/upload/voucher/M/20161201_GOvUUBT1.jpg" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/voucher/M/voucher_default.jpg'" alt="브레이즈드포크L"></div>
					</div>
					<!-- div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/menu/voucher/20161201_GOvUUBT1.jpg" alt="브레이즈드포크L"></div>
					</div -->
					<div class="prd_info">
						<div class="prd_title">브레이즈드포크L</div>
					</div>
					<!-- /a -->
					<div class="prd_price">
						<p class="price_large"><span class="txt_prd_dough">오리지널</span> <span class="ico ico_s_large"></span>32,900원</p>
						<div class="prd_option">
							<div class="input_num">
								<a href="javascript:;" class="minus"><span class="ico ico_minus"></span></a>
								<div class="form_item">
									<input type="text" name="SST852SL_qty" id="SST852SL_qty" class="i_text" value="1">
								</div>
								<a href="javascript:;" class="add"><span class="ico ico_add"></span></a>
							</div>
							<a href="javascript:goVoucher('M', 'SST852SL');" class="btn_ico btn_cart2">장바구니</a>
						</div>
					</div>
				</li>
				<li class="">
					<!-- a href="#" -->
					<div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/admin/upload/voucher/M/RPZ132_C.jpg" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/voucher/M/voucher_default.jpg'" alt="와규앤비스테카L"></div>
					</div>
					<!-- div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/menu/voucher/RPZ132_C.jpg" alt="와규앤비스테카L"></div>
					</div -->
					<div class="prd_info">
						<div class="prd_title">와규앤비스테카L</div>
					</div>
					<!-- /a -->
					<div class="prd_price">
						<p class="price_large"><span class="txt_prd_dough">오리지널</span> <span class="ico ico_s_large"></span>32,900원</p>
						<div class="prd_option">
							<div class="input_num">
								<a href="javascript:;" class="minus"><span class="ico ico_minus"></span></a>
								<div class="form_item">
									<input type="text" name="SST851SL_qty" id="SST851SL_qty" class="i_text" value="1">
								</div>
								<a href="javascript:;" class="add"><span class="ico ico_add"></span></a>
							</div>
							<a href="javascript:goVoucher('M', 'SST851SL');" class="btn_ico btn_cart2">장바구니</a>
						</div>
					</div>
				</li>
				<li class="prd_list_rgt">
					<!-- a href="#" -->
					<div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/admin/upload/voucher/M/RPZ131_C.jpg" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/voucher/M/voucher_default.jpg'" alt="킹프론씨푸드L"></div>
					</div>
					<!-- div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/menu/voucher/RPZ131_C.jpg" alt="킹프론씨푸드L"></div>
					</div -->
					<div class="prd_info">
						<div class="prd_title">킹프론씨푸드L</div>
					</div>
					<!-- /a -->
					<div class="prd_price">
						<p class="price_large"><span class="txt_prd_dough">오리지널</span> <span class="ico ico_s_large"></span>33,900원</p>
						<div class="prd_option">
							<div class="input_num">
								<a href="javascript:;" class="minus"><span class="ico ico_minus"></span></a>
								<div class="form_item">
									<input type="text" name="SST850SL_qty" id="SST850SL_qty" class="i_text" value="1">
								</div>
								<a href="javascript:;" class="add"><span class="ico ico_add"></span></a>
							</div>
							<a href="javascript:goVoucher('M', 'SST850SL');" class="btn_ico btn_cart2">장바구니</a>
						</div>
					</div>
				</li>
				<li class="">
					<!-- a href="#" -->
					<div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/admin/upload/voucher/M/RPZ126_C.jpg" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/voucher/M/voucher_default.jpg'" alt="직화스테이크 L"></div>
					</div>
					<!-- div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/menu/voucher/RPZ126_C.jpg" alt="직화스테이크 L"></div>
					</div -->
					<div class="prd_info">
						<div class="prd_title">직화스테이크 L</div>
					</div>
					<!-- /a -->
					<div class="prd_price">
						<p class="price_large"><span class="txt_prd_dough">오리지널</span> <span class="ico ico_s_large"></span>32,900원</p>
						<div class="prd_option">
							<div class="input_num">
								<a href="javascript:;" class="minus"><span class="ico ico_minus"></span></a>
								<div class="form_item">
									<input type="text" name="SST848SL_qty" id="SST848SL_qty" class="i_text" value="1">
								</div>
								<a href="javascript:;" class="add"><span class="ico ico_add"></span></a>
							</div>
							<a href="javascript:goVoucher('M', 'SST848SL');" class="btn_ico btn_cart2">장바구니</a>
						</div>
					</div>
				</li>
				<li class="">
					<!-- a href="#" -->
					<div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/admin/upload/voucher/M/RPZ088_C.jpg" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/voucher/M/voucher_default.jpg'" alt="리얼바비큐L"></div>
					</div>
					<!-- div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/menu/voucher/RPZ088_C.jpg" alt="리얼바비큐L"></div>
					</div -->
					<div class="prd_info">
						<div class="prd_title">리얼바비큐L</div>
					</div>
					<!-- /a -->
					<div class="prd_price">
						<p class="price_large"><span class="txt_prd_dough">오리지널</span> <span class="ico ico_s_large"></span>27,900원</p>
						<div class="prd_option">
							<div class="input_num">
								<a href="javascript:;" class="minus"><span class="ico ico_minus"></span></a>
								<div class="form_item">
									<input type="text" name="SST836SL_qty" id="SST836SL_qty" class="i_text" value="1">
								</div>
								<a href="javascript:;" class="add"><span class="ico ico_add"></span></a>
							</div>
							<a href="javascript:goVoucher('M', 'SST836SL');" class="btn_ico btn_cart2">장바구니</a>
						</div>
					</div>
				</li>
				<li class="">
					<!-- a href="#" -->
					<div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/admin/upload/voucher/M/RPZ004_C.jpg" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/voucher/M/voucher_default.jpg'" alt="불고기L"></div>
					</div>
					<!-- div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/menu/voucher/RPZ004_C.jpg" alt="불고기L"></div>
					</div -->
					<div class="prd_info">
						<div class="prd_title">불고기L</div>
					</div>
					<!-- /a -->
					<div class="prd_price">
						<p class="price_large"><span class="txt_prd_dough">오리지널</span> <span class="ico ico_s_large"></span>23,900원</p>
						<div class="prd_option">
							<div class="input_num">
								<a href="javascript:;" class="minus"><span class="ico ico_minus"></span></a>
								<div class="form_item">
									<input type="text" name="SST822SL_qty" id="SST822SL_qty" class="i_text" value="1">
								</div>
								<a href="javascript:;" class="add"><span class="ico ico_add"></span></a>
							</div>
							<a href="javascript:goVoucher('M', 'SST822SL');" class="btn_ico btn_cart2">장바구니</a>
						</div>
					</div>
				</li>
				<li class="prd_list_rgt">
					<!-- a href="#" -->
					<div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/admin/upload/voucher/M/RPZ011_C.jpg" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/voucher/M/voucher_default.jpg'" alt="포테이토L"></div>
					</div>
					<!-- div class="prd_img">
						<div class="prd_img_view"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/menu/voucher/RPZ011_C.jpg" alt="포테이토L"></div>
					</div -->
					<div class="prd_info">
						<div class="prd_title">포테이토L</div>
					</div>
					<!-- /a -->
					<div class="prd_price">
						<p class="price_large"><span class="txt_prd_dough">오리지널</span> <span class="ico ico_s_large"></span>24,900원</p>
						<div class="prd_option">
							<div class="input_num">
								<a href="javascript:;" class="minus"><span class="ico ico_minus"></span></a>
								<div class="form_item">
									<input type="text" name="SST821SL_qty" id="SST821SL_qty" class="i_text" value="1">
								</div>
								<a href="javascript:;" class="add"><span class="ico ico_add"></span></a>
							</div>
							<a href="javascript:goVoucher('M', 'SST821SL');" class="btn_ico btn_cart2">장바구니</a>
						</div>
					</div>
				</li>
				</ul>
		</div>

	</div>
	<!-- //content -->
</div>

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
