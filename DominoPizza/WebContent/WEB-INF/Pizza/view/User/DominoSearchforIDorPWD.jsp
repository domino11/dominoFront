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
						<li><a href="<c:url value='/domino/DominoLogin.jsp'/>">로그인</a></li>
							<li><a href="<c:url value='/domino/Join.jsp'/>">회원가입</a></li>
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
	<div id="content" class="srch_wrap">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><a href="/global/login">로그인</a></li>
				<li><span>아이디/비밀번호 찾기</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>아이디/비밀번호 찾기</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="tab_type">
			<ul class="btn_tab">
				<li class="active"><a href="javascript:goTab(0);">아이디 찾기</a></li>
				<li><a href="javascript:goTab(1);">비밀번호 찾기</a></li>
			</ul>
		</div>

		<div class="srch_area" name="default_area">
			<div class="srch_way">

				<!-- 2017-01-13 // 회원정보 찾기 추가(s) -->
				<dl class="dl_member">
					<dt>
						<span class="ico ico_member"></span>
						회원정보로 찾기
					</dt>
					<dd>
						<a href="javascript:openIdByInside();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">회원정보 인증</span></a>
					</dd>
				</dl>
				<!-- 2017-01-13 // 회원정보 찾기 추가(e) -->

				<!-- 2017-01-13 // class 추가(s) -->
				<dl class="dl_phone">
					<dt>
						<span class="ico ico_cellphone"></span>
						이메일로 찾기
					</dt>
					<dd>
						<a href="javascript:findIdByKG();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">이메일로 본인인증</span></a>
					</dd>
				</dl>
				
			</div>
			<div class="lst_type v4">
				<ul>
					<li>신용평가기관을 통해 한국도미노피자에 가입하신 아이디, 비밀번호 찾기를 진행하며, 당사는 고객의 주민등록번호를 저장하지 않습니다.</li>
					<li>회원 가입 시 등록한 휴대폰번호와 현재 보유 휴대폰번호가 다를경우 본인인증/아이핀으로 찾기를 진행해주세요.</li>
				</ul>
			</div>
		</div>

		<div class="srch_area" name="default_area" style="display:none;">
			<div class="srch_way">
				<dl>
					<dt>
						<span class="ico ico_cellphone"></span>
						본인인증으로 찾기
					</dt>
					<dd>
						<div class="lst_type_dot">
							<ul>
								<li>
									<label for="kg_id">아이디</label>
									<input type="text" id="kg_id" name="">
								</li>
							</ul>
						</div>
						<a href="javascript:findPwdByKG();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">휴대전화 본인인증</span></a>
					</dd>
				</dl>
				<dl>
					<dt>
						<span class="ico ico_ipin"></span>
						아이핀(I-Pin)으로 찾기
					</dt>
					<dd>
						<div class="lst_type_dot">
							<ul>
								<li>
									<label for="srch_ipin">아이디</label>
									<input type="text" id="ipin_id" name="">
								</li>
							</ul>
						</div>
						<a href="javascript:findPwdByIpin();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">아이핀 인증</span></a>
						<p>※ 회원가입 시 아이핀으로 가입하신 회원님께서는 아이핀으로 인증하세요.</p>
					</dd>
				</dl>
			</div>
			<div class="lst_type v4">
				<ul>
					<li>신용평가기관을 통해 한국도미노피자에 가입하신 아이디, 비밀번호 찾기를 진행하며, 당사는 고객의 주민등록번호를 저장하지 않습니다.</li>
				</ul>
			</div>
		</div>

		<div class="srch_area" name="result_passwd" style="display:none;">
			<div class="pw_edit">
				<dl>
					<dt>
						비밀번호 변경
						<p>새로 사용할 비밀번호를 입력하세요.</p>
					</dt>
					<dd class="lst_type_dot">
						<ul>
							<li>
								<label for="n_pw">새 비밀번호</label>
								<div class="form_group">
									<div class="form_field">
										<div class="form_item">
											<input type="password" id="passwd" name="passwd" class="i_text" placeholder="8~16자 영문대소문자, 숫자, 특수문자 사용가능">
										</div>
									</div>
									<span class="i_error show" id="passwd_alert"></span>
								</div>
							</li>
							<li>
								<label for="confirmpw">새 비밀번호 확인</label>
								<div class="form_group">
									<div class="form_field">
										<div class="form_item">
											<input type="password"  id="confirmpw" name="confirmpw" class="i_text">
										</div>
									</div>
									<span class="i_error show" id="confirmpw_alert"></span>
								</div>
							</li>
						</ul>
					</dd>
				</dl>
				<a href="javascript:updateChangePasswd();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">비밀번호 변경</span></a>
			</div>
		</div>

		<div class="srch_area" name="result_id" style="display:none;">
			<div class="result">
				<strong><span class="user_name">도민호</span>님의 ID는 <em class="user_id">domino</em> 입니다.</strong>
				<p>신용평가기관을 통해 실명 인증된 도미노피자 아이디입니다.</p>
				<div class="btn_wrap">
					<div class="btn_fix_center">
						<a href="javascript:doLogin();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">로그인</span></a>
						<a href="javascript:goTab(1);" class="btn btn_mdle btn_blue btn_basic"><span class="btn_txt">비밀번호 찾기</span></a>
					</div>
				</div>
			</div>
		</div>
		<div class="srch_area" name="result_dormancy" style="display:none;">
			<div class="result">
				<strong><span class="user_name">도민호</span>님의 ID는 <em class="user_id">domino</em> 입니다.</strong>
				<p>신용평가기관을 통해 실명 인증된 도미노피자 아이디입니다.</p>
				<div class="info_txt">
					회원님의 ID는 휴면계정으로 관리 중 입니다. <br>
					기존 ID 및 정보는 휴면계정 해제 후 재이용이 가능합니다. <br>
					휴면계정을 해제하시겠습니까?
				</div>
				<div class="btn_wrap">
					<div class="btn_fix_center">
						<a href="javascript:clearDormancy();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">확인</span></a>
						<a href="/main" class="btn btn_mdle btn_blue btn_basic"><span class="btn_txt">취소</span></a>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- //content -->
</div>
<!-- //container -->

<!-- NOTICE(s) -->
<div class="pop_layer pop_type open" id="certification" style="display:none;">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>회원정보 인증</h2>
		</div>
		<div class="pop_content">
			<div class="certification_pop">
				<p class="txt_info_guide">회원 가입 시 등록한 휴대전화번호를 입력해 주세요.</p>
				<div class="certification_form">
					<ul>
						<li class="form_name">
							<label for="u_name">이름</label>
							<div class="form_group">
								<div class="form_field">
									<div class="form_item">
										<input type="text" name="u_name" id="u_name" class="i_text">
									</div>
									<span class="i_error show" id="u_name_f"></span>
								</div>
							</div>
						</li>
						<li class="form_birth">
							<label for="u_phone">생년월일</label>
							<div class="form_group">
								<div class="form_field">
									<div class="sel_box">
										<select name="byear" id="byear">
											<option>년</option>
											<option value="1900">1900</option>
											<option value="1901">1901</option>
											<option value="1902">1902</option>
											<option value="1903">1903</option>
											<option value="1904">1904</option>
											<option value="1905">1905</option>
											<option value="1906">1906</option>
											<option value="1907">1907</option>
											<option value="1908">1908</option>
											<option value="1909">1909</option>
											<option value="1910">1910</option>
											<option value="1911">1911</option>
											<option value="1912">1912</option>
											<option value="1913">1913</option>
											<option value="1914">1914</option>
											<option value="1915">1915</option>
											<option value="1916">1916</option>
											<option value="1917">1917</option>
											<option value="1918">1918</option>
											<option value="1919">1919</option>
											<option value="1920">1920</option>
											<option value="1921">1921</option>
											<option value="1922">1922</option>
											<option value="1923">1923</option>
											<option value="1924">1924</option>
											<option value="1925">1925</option>
											<option value="1926">1926</option>
											<option value="1927">1927</option>
											<option value="1928">1928</option>
											<option value="1929">1929</option>
											<option value="1930">1930</option>
											<option value="1931">1931</option>
											<option value="1932">1932</option>
											<option value="1933">1933</option>
											<option value="1934">1934</option>
											<option value="1935">1935</option>
											<option value="1936">1936</option>
											<option value="1937">1937</option>
											<option value="1938">1938</option>
											<option value="1939">1939</option>
											<option value="1940">1940</option>
											<option value="1941">1941</option>
											<option value="1942">1942</option>
											<option value="1943">1943</option>
											<option value="1944">1944</option>
											<option value="1945">1945</option>
											<option value="1946">1946</option>
											<option value="1947">1947</option>
											<option value="1948">1948</option>
											<option value="1949">1949</option>
											<option value="1950">1950</option>
											<option value="1951">1951</option>
											<option value="1952">1952</option>
											<option value="1953">1953</option>
											<option value="1954">1954</option>
											<option value="1955">1955</option>
											<option value="1956">1956</option>
											<option value="1957">1957</option>
											<option value="1958">1958</option>
											<option value="1959">1959</option>
											<option value="1960">1960</option>
											<option value="1961">1961</option>
											<option value="1962">1962</option>
											<option value="1963">1963</option>
											<option value="1964">1964</option>
											<option value="1965">1965</option>
											<option value="1966">1966</option>
											<option value="1967">1967</option>
											<option value="1968">1968</option>
											<option value="1969">1969</option>
											<option value="1970">1970</option>
											<option value="1971">1971</option>
											<option value="1972">1972</option>
											<option value="1973">1973</option>
											<option value="1974">1974</option>
											<option value="1975">1975</option>
											<option value="1976">1976</option>
											<option value="1977">1977</option>
											<option value="1978">1978</option>
											<option value="1979">1979</option>
											<option value="1980">1980</option>
											<option value="1981">1981</option>
											<option value="1982">1982</option>
											<option value="1983">1983</option>
											<option value="1984">1984</option>
											<option value="1985">1985</option>
											<option value="1986">1986</option>
											<option value="1987">1987</option>
											<option value="1988">1988</option>
											<option value="1989">1989</option>
											<option value="1990">1990</option>
											<option value="1991">1991</option>
											<option value="1992">1992</option>
											<option value="1993">1993</option>
											<option value="1994">1994</option>
											<option value="1995">1995</option>
											<option value="1996">1996</option>
											<option value="1997">1997</option>
											<option value="1998">1998</option>
											<option value="1999">1999</option>
											<option value="2000">2000</option>
											<option value="2001">2001</option>
											<option value="2002">2002</option>
											<option value="2003">2003</option>
											<option value="2004">2004</option>
											<option value="2005">2005</option>
											<option value="2006">2006</option>
											<option value="2007">2007</option>
											<option value="2008">2008</option>
											<option value="2009">2009</option>
											<option value="2010">2010</option>
											<option value="2011">2011</option>
											<option value="2012">2012</option>
											<option value="2013">2013</option>
											<option value="2014">2014</option>
											<option value="2015">2015</option>
											<option value="2016">2016</option>
											<option value="2017">2017</option>
											</select>
									</div>
								</div>
								<div class="form_field"><span class="txt_date">년</span></div>
								<div class="form_field">
									<div class="sel_box">
										<select name="bmonth" id="bmonth">
											<option>월</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											</select>
									</div>
								</div>
								<div class="form_field"><span class="txt_date">월</span></div>
								<div class="form_field">
									<div class="sel_box">
										<select name="bday" id="bday">
											<option>일</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
											<option value="21">21</option>
											<option value="22">22</option>
											<option value="23">23</option>
											<option value="24">24</option>
											<option value="25">25</option>
											<option value="26">26</option>
											<option value="27">27</option>
											<option value="28">28</option>
											<option value="29">29</option>
											<option value="30">30</option>
											<option value="31">31</option>
											</select>
									</div>
								</div>
								<div class="form_field"><span class="txt_date">일</span></div>
								<span class="i_error show" id="date_alert"></span>
							</div>
						</li>
						<li class="form_phone">
							<label for="u_phone">휴대전화번호</label>
							<div class="form_group">
								<div class="form_field">
									<div class="sel_box">
										<select name="tel1" id="tel1">
											<option value="010"/>010</option>
											<option value="011"/>011</option>
											<option value="016"/>016</option>
											<option value="017"/>017</option>
											<option value="018"/>018</option>
											<option value="019"/>019</option>
										</select>
									</div>
								</div>
								<div class="form_field">
									<div class="form_item">
										<span for="form_phone" class="i_label"></span>
										<input type="text" name="tel2" id="tel2" maxlength="4" class="i_text">
									</div>
								</div>
								<div class="form_field">
									<div class="form_item">
										<span for="form_phone" class="i_label"></span>
										<input type="text" name="tel3" id="tel3" maxlength="4" class="i_text">
									</div>
								</div>
								<div class="form_field">
									<a href="javascript:doSendAuthKey();" class="btn"><span class="btn_txt">인증번호 발송</span></a>
								</div>
								<span class="i_error show" id="tel_alert"></span>
							</div>
						</li>
						<li class="form_certi_num">
							<label for="u_certi_num">인증번호</label>
							<div class="form_group">
								<div class="form_field">
									<div class="form_item">
										<input type="text" name="security_no" id="security_no" maxlength="4" class="i_text">
									</div>
									<span class="i_error show" id="security_alert"></span>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="btn_wrap">
					<div class="btn_fix_center">
						<a href="javascript:findIdByInside();" class="btn btn_mdle btn_red btn_block"><span class="btn_txt">아이디찾기</span></a>
					</div>
				</div>

			</div>

		</div>

		<a href="#" class="btn_ico btn_close">닫기</a>
	</div>
</div>
<!-- //NOTICE(e) -->
<input type="hidden" id="userId" name="userId" value="">
<input type="hidden" id="userName" name="userName" value="">

<form name="authForm" id="authForm" action="" method="post">
	<input type="hidden" name="auth_type" id="auth_type" value="">
	<input type="hidden" name="enc_data" id="enc_data" value="AgEEQTYxM+0CVXE4poc6LrPplBETiu7vFV774v8qjgwpgfNePJhei2+vi5Z6C4nGHjULEs75GcSVnRyb09a48TBwrkK4e0T8hxcZ3MOulSWTkIDI4nJ49XT9WgaryK4WameEIXNHEdgNZDgpQnxXxG4q6ez1YR5Vjb8x0sMVdybLrhr92lPa3FV+2gVqUJV3dQceu2ARHS2shkpgUUrlVVlS9jtAEdrkhTFLCaJt+MCU32MTgTF6lD4aK4RRK3+Urw0ecvO224l7XMePpTxHJu8SFVxhHW04E8/jXLhgrjza9yxZ1yV8">
	<input type="hidden" name="res_enc_data" id="res_enc_data" value="AgEEQTYxM+0CVXE4poc6LrPplBETiu7vFV774v8qjgwpgfNePJhei2+vi5Z6C4nGHjULEs75GcSVnRyb09a48TBwrkK4e0T8hxcZ3MOulSWTkIDI4nJ49XT9WgaryK4WameEIXNHEdgNZDgpQnxXxG4q6ez1YR5Vjb8x0sMVdybLrhr92lPa3FV+2gVqUJV3dQceu2ARHS2shkpgUUrlVVlS9jtAEdrkhTFLCaJt+MCU32MTgTF6lD4aK4RRK3+Urw0ecvO224l7XMePpTxHJu8SFVxhHW04E8/jXLhgrjza9yxZ1yV8">
	<input type="hidden" name="svcId" id="svcId" value="">
	<input type="hidden" name="mobilId" id="mobilId" value="">
	<input type="hidden" name="ci" id="ci" value="">
	<input type="hidden" name="di" id="di" value="">
	<input type="hidden" name="signDate" id="signDate" value="">
	<input type="hidden" name="name" id="name" value="">
	<input type="hidden" name="birth" id="birth" value="">
	<input type="hidden" name="sex" id="sex" value="">
	<input type="hidden" name="mac" id="mac" value="">
	<input type="hidden" name="tradeId" id="tradeId" value="">
	<input type="hidden" name="commId" id="commId" value="">
	<input type="hidden" name="socialNo" id="socialNo" value="">
	<input type="hidden" name="resultMsg" id="resultMsg" value="">
	<input type="hidden" name="resultCd" id="resultCd" value="">
	<input type="hidden" name="no" id="no" value="">

	<input type="hidden" name="dupInfo" id="dupInfo" value="">
	<input type="hidden" name="connInfo" id="connInfo" value="">
	<input type="hidden" name="vno" id="vno" value="">

	<input type="hidden" name="hand_tel1" id="hand_tel1" value="" />
	<input type="hidden" name="hand_tel2" id="hand_tel2" value="" />
	<input type="hidden" name="hand_tel3" id="hand_tel3" value="" />
	<input type="hidden" name="hdnAuthKey" id="hdnAuthKey" value="" />

</form>

<script type="text/javascript" src="/resources/js/member.js"></script>
<script type="text/javascript">
//탭 이동
function goTab(idx){
	$(".srch_area").hide();
	$(".btn_tab li").removeClass("active");
	$(".btn_tab li").eq(idx).addClass("active");
	$(".srch_area").eq(idx).show();
}

$(document).ready(function(){
	goTab("0");
	$('.btn_close').bind('click', function () {
		$("#certification").hide();
	});
});

//아이디 찾기 - 휴대폰 본인 인증
function findIdByKG() {
	window.open('/member/regKGAuth?authType=findId', 'popupChk', 'width=500, height=550, toolbar=no, directories=no, scrollbars=no, resizable=no, status=no, menubar=no, top=0, left=0');
}

//비밀번호 찾기 - 휴대폰 본인 인증
function findPwdByKG() {
	if ($('#kg_id').val().isBlank()){
		alert("아이디를 입력해주세요.");
		$('#kg_id').focus();
		return;
	}
	window.open('/member/regKGAuth?authType=findPwd', 'popupChk', 'width=500, height=550, toolbar=no, directories=no, scrollbars=no, resizable=no, status=no, menubar=no, top=0, left=0');
}

//휴대폰 본인 인증 콜백
function kgIdProc(svcid, mobilid, ci, di, signdate, name, no, commid, sex, mac, tradeid, socialno, resultmsg, resultcd) {
	$("#authForm > #svcId").val(svcid);
	$("#authForm > #mobilId").val(mobilid);
	$("#authForm > #ci").val(ci);
	$("#authForm > #di").val(di);
	$("#authForm > #signDate").val(signdate);
	$("#authForm > #name").val(name);
	$("#authForm > #no").val(no);
	$("#authForm > #commId").val(commid);
	$("#authForm > #sex").val(sex);
	$("#authForm > #mac").val(mac);
	$("#authForm > #tradeId").val(tradeid);
	$("#authForm > #socialNo").val(socialno);
	$("#authForm > #resultMsg").val(resultmsg);
	$("#authForm > #resultCd").val(resultcd);

	procAfter("kg");
}

// 인증번호 발송
function doSendAuthKey() {
	if($('#tel2').val() == ''){ alert("휴대전화번호를 입력해 주세요."); $('#tel2').focus(); return; }
	if($('#tel3').val() == ''){ alert("휴대전화번호를 입력해 주세요."); $('#tel3').focus(); return; }
	if (confirm("인증번호 발송 후에는 휴대전화번호 수정이 불가합니다.\n인증번호를 발송하시겠습니까?")) {
		$("#tel_alert").text("");
		$("#email_alert").text("");
		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();
		hideMemberInfo();
		memberAuthSend('H', '', tel1, tel2, tel3, "Y");
	}
}

// 인증 성공 시 폼 셋팅
function hideMemberInfo() {
	$("[id^='u_phone']").parent().addClass("disabled");
	$("#tel1, #tel2, #tel3").prop("disabled", true);
}

// 인증 실패 시 폼 셋팅
function showMemberInfo() {
	$("[id^='u_phone']").parent().removeClass("disabled");
	$("#tel1, #tel2, #tel3").prop("disabled", false);
}

// 세팅값 초기화
function delSetting(){
	$('#u_name_f, #date_alert, #tel_alert').text('');
	$("#hand_tel1, #hand_tel2, #hand_tel3, #birth, #name, #u_name, #tel2, #tel3, #security_no, #hdnAuthKey" ).val("");
	$("#tel1, #tel2, #tel3").prop("disabled", false);
	$("#byear").val('년');
	$("#bmonth").val('월');
	$("#bday").val('일');
	$("#tel1").val('010');
}

// 회원정보 인증 아이디 찾기 팝업
function openIdByInside(){
	$("[id='certification']").show();
	delSetting();
}

// 끝에 두자리 ** 처리
function maskingCar(strCar) {
    if (strCar == undefined || strCar === '') {
        return '';
    }
    var pattern = /.{2}$/; // 정규식
    return strCar.replace(pattern, "**");
}

// 회원정보 인증 아이디 찾기
function findIdByInside(){

	var bmonth = $('#bmonth').val();
	var bday = $('#bday').val();
	if (bmonth.length < 2)
		bmonth = '0' + bmonth;
	if (bday.length < 2)
		bday = '0' + bday;

	if($('#u_name').val() != ''){ $('#u_name_f').text('');}
	if($('#byear').val() != '년' && $('#byear').val() != ''){ $('#date_alert').text('');}
	if($('#bmonth').val() != '월' && $('#bmonth').val() != ''){ $('#date_alert').text('');}
	if($('#bday').val() != '일' && $('#bday').val() != ''){ $('#date_alert').text('');}
	if($('#tel2').val() != ''){ $('#tel_alert').text('');}
	if($('#tel3').val() != ''){ $('#tel_alert').text('');}
	if($('#security_no').val() !=  ""){ $("#security_alert").text("");}

	if($('#u_name').val().isBlank()){ $('#u_name').focus(); $('#u_name_f').text('이름을 입력 해 주세요.'); return; }
	if($('#byear').val() == '년'){ $('#byear').focus(); $('#date_alert').text('생년월일을 입력 해 주세요.'); return; }
	if($('#bmonth').val() == '월'){ $('#bmonth').focus(); $('#date_alert').text('생년월일을 입력 해 주세요.'); return; }
	if($('#bday').val() == '일'){ $('#bday').focus(); $('#date_alert').text('생년월일을 입력 해 주세요.'); return; }
	if($('#tel2').val() == ''){ $('#tel2').focus(); $('#tel_alert').text('핸드폰번호를 입력 해 주세요.'); return; }
	if($('#tel3').val() == ''){ $('#tel3').focus(); $('#tel_alert').text('핸드폰번호를 입력 해 주세요.'); return; }
	if($('#security_no').val() ==  ""){ $("#security_alert").text("인증번호를 입력해 주세요."); $('#security_no').focus(); return; }
	if($("#security_no").val() != $("#hdnAuthKey").val()){ $("#security_alert").text("인증에 실패하였습니다."); $('#security_no').focus(); showMemberInfo(); return; }

	$('#name').val(encodeURIComponent($('#u_name').val()));
	$('#birth').val($('#byear').val() + bmonth + bday);
	$('#hand_tel1').val($('#tel1').val());
	$('#hand_tel2').val($('#tel2').val());
	$('#hand_tel3').val($('#tel3').val());

 	procAfter("INSIDE");
}



//휴대폰 본인 인증 콜백 후 실행
function procAfter(auth_type){
	var gubun = $(".btn_tab li").eq(0).hasClass("active") ? "FINDID" : "FINDPW";
	var addData = "&gubun="+gubun;
	if(gubun == "FINDPW")
		addData += "&id="+$("#"+auth_type+"_id").val();

	$("#auth_type").val(auth_type);
	var data = $("#authForm").serialize();

	$.ajax({
		type: "POST",
		url: "/member/findIdPwAjax",
		data: data+addData,
		dataType : "json",
		success:function(data) {
			if (data.msg == 'success') {
				$("#userName").val(data.resultData.name);
				$(".user_name").text(data.resultData.name);
				$("#userId").val(data.resultData.id);
				$(".user_id").text(maskingCar(data.resultData.id));

				$("[name='default_area']").hide();
				$("[id='certification']").hide();

				if (data.resultData.dormancy_yn == "Y"){
					$("[name='result_dormancy']").show();
				}else{
					if(gubun == "FINDPW"){
						$("[name='result_passwd']").show();
					}else{
						$("[name='result_id']").show();
					}
					$("#enc_data").val($("#res_enc_data").val());
				}
			} else {
				showMemberInfo();
				alert(data.msg);
				//enc_data 새로 셋팅해야 ipin 인증 재시도 가능
				$("#enc_data").val($("#res_enc_data").val());
			}
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
}

//휴면 계정일 때 휴면 계정 처리
function clearDormancy(){
	var gubun = $(".btn_tab li").eq(0).hasClass("active") ? "FINDID" : "FINDPW";
	var data = $("#authForm").serialize();

	if($("#userId").val() == ""){
		alert("다시 시도해주세요.");
		return;
	}

	$.ajax({
		type: "POST",
		url: "/member/restartMemAjax",
		data: data + "&id="+$("#userId").val(),
		dataType : "json",
		success:function(data) {
			if (data.msg == "success") {
				if(gubun != "FINDPW"){
					alert("휴면 계정 해제 완료되었습니다.\n로그인 후 서비스 이용 부탁 드립니다.");
					location.href = "/global/login";
				}else{
					alert("휴면 계정 해제 완료되었습니다.\n비밀번호 변경 후 서비스 이용 부탁 드립니다.");
					$(".btn_tab li").removeClass("active");
					$(".btn_tab li").eq(1).addClass("active");
					$(".srch_area").hide();
					$("[name='result_passwd']").show();
				}
			} else {
				alert(data.msg);
				location.href = "/main";
			}
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
}

//비밀번호 변경 처리
function updateChangePasswd() {
	$("#passwd_alert").text("");
	$("#confirmpw_alert").text("");

	if ($('#passwd').val() == ""){
		$("#passwd_alert").text("새 비밀번호를 입력해 주세요.");
		$('#passwd').focus();
	}
	if ($('#confirmpw').val() == ""){
		$("#confirmpw_alert").text("새 비밀번호를 입력해 주세요.");
		$('#confirmpw').focus();
	}
	if (!isValidPwd($("#passwd").val())) {
		$("#passwd").focus();
		return;
	}
	if ($('#passwd').val() != $('#confirmpw').val()) {
		$("#confirmpw_alert").text('비밀번호가 일치하지 않습니다.');
		$("#confirmpw").focus();
		return;
	}

	if(confirm("해당 내용으로 수정하시겠습니까?")){
		$.ajax({
			type: "POST",
			url: "/member/changePwdAjax",
			data: { id : $("#userId").val(),
					passwd : $('#passwd').val() },
			dataType : "json",
			success:function(data) {
				if (data.status == "success"){
					alert(data.msg);
					location.href = "/global/login";
				} else {
					if(data.code != ""){
						$("#"+data.code+"_alert").text(data.msg);
						$("#"+data.code).focus();
					}else{
						alert(data.msg);
					}
					return;
				}
			},
			error: function (error){
				alert("다시 시도해주세요.");
			}
		});
	}
}

//아이디 찾기 - 아이핀 인증
function findIdByIpin() {
	window.open('', 'popupIPIN2', 'width=450,height=550,top=100,left=100,fullscreen=no,menubar=no,status=no,toolbar=no,titlebar=yes,location=no,scrollbar=no');
	$('#authForm').attr("target", "popupIPIN2");
	$('#authForm').attr("action", "https://cert.vno.co.kr/ipin.cb");
	$('#authForm').submit();
}

// - 아이핀 인증
function findPwdByIpin() {
	if ($('#ipin_id').val().isBlank()){
		alert("아이디를 입력해주세요.");
		$('#ipin_id').focus();
		return;
	}

	window.open('', 'popupIPIN2', 'width=450,height=550,top=100,left=100,fullscreen=no,menubar=no,status=no,toolbar=no,titlebar=yes,location=no,scrollbar=no');
	$('#authForm').attr("target", "popupIPIN2");
	$('#authForm').attr("action", "https://cert.vno.co.kr/ipin.cb");
	$('#authForm').submit();
}


//아이핀 본인 인증 콜백
function ipinIdProc(dupInfo, connInfo, vno, name, birth, sex) {
	$("#authForm > #dupInfo").val(dupInfo);
	$("#authForm > #connInfo").val(connInfo);
	$("#authForm > #vno").val(vno);
	$("#authForm > #name").val(name);
	$("#authForm > #birth").val(birth);
	$("#authForm > #sex").val(sex);

	procAfter("ipin");
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

  ga('create', 'UA-47919960-1', 'auto');
  ga('send', 'pageview');

</script>
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
wcs.inflow();
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
