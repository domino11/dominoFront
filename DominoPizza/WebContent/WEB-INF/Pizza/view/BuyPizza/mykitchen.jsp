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
	
	<!-- 2] CDN(Content Deliver Network)주소 사용 -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<!-- Deprecated된 함수 사용시 아래 라이브러리 임베드 -->
	<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
	
	<script type="text/javascript">
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";


	$(document).ready(function() {
		$.ajaxSetup({cache:false});
		$(".gnb_menu .menu04").addClass("on");
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
</script> <!-- // Naver Anlytics 공통-->

<!-- 카이젠 공통-->
<script data-kz-key="7944084e2b522564" data-kz-namespace="kzs"
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
var doughList;
window.scrollTo(0, 0);
$(document).ready(function() {
	$(".gnb_menu .menu04").addClass("on");
/* 
	$.ajax({
		type: "POST",
		dataType: "json",
		async: false,
		url: "/goods/mkPizzaAjax",
		success:function(data) {
			doughList = data.resultData;
			$.each(doughList, function(k, v) {
	 			var isExist = false;
	 			$.each($("#dough option"), function() {
	 				if(v.ref_code == $(this).val()) isExist = true;
	 			});
	 			if(!isExist)
	 				$("#dough").append("<option value='"+v.ref_code+"'>"+v.name+"</option>");
	 		});

			$("#dough option:eq(0)").prop("selected", true);
			setSize();
		},
		error: function (xhr,status,error){
			if(xhr.status != "0") {
				alert("다시 시도해주세요."+xhr.status);
			}
		}
	});
 */
 	//페이지 로딩시 리스트의 첫번째 도우 자동 선택되게 설정
	$("#dough option:eq(0)").prop("selected", true);
	setSize();
	
	$("#dough").change(function() {
		setSize();
		removeTopping();
	});

	$("#size").change(function() {
		setDoughPrice();
		setSource();
		removeTopping();
	});

	$("#source").change(function() {
		setDoughPrice();
	});

	$("#btn_basket").click(function() {
		if($("#source").val() == "") {
			alert("소스를 선택해주세요.");
			return;
		}
		if($("#toppingList").val() == "") {
			alert("토핑을 선택해주세요.");
			return;
		}

		var toppingList = $("#source").val() + ":1," + $("#toppingList").val();
		addBasket();
	});

});


	var addBasket = function() {
		<c:if test="${empty ID }" var="idc" >
			alert("로그인 후 이용가능합니다.");
			location.href="<c:url value='/User/Login.pz' />";
		</c:if>
		<c:if test="${!idc}" >
			addBasketComplete();
		</c:if>
	};
	
	var addBasketComplete = function() {
		
		var dough = $("#dough").val();
		var size = $("#size").val();
		var mkSauce = $("#source").val();
		var img = "마이키친.jpg";
		var qty = 1; //마이키친은 수량 없음.
		var price = $("#totalAmt").data("price");
		var topping = $("#toppingSize_no").val();
 		window.setTimeout( function() {
			$(".loading").css("display","none");
		location.href="<c:url value='/AddrSelect.pz' />?mck=mck&doughno=&na='마이키친'&no=0&kind=1&size="+size+"&dough="+dough+"&mkSauce="+mkSauce+"&price="+price+"&img="+img+"&qty="+qty+"&topping="+topping;
		}, 800); 
		$(".loading").css("display","block");
	};

var setSize = function() {
	//$("#size option").remove();
	var dough = $("#dough").val();
	var sizeVal = $("#size").val();
	$("#size option:eq(0)").prop("selected", true);
	setSource();
};


var setSource = function() {
	//$("#source option").remove();
	$.ajax({
		type: "POST",
		url: "<c:url value='/Pizza/BuyPizza/mkChoiceVal.pz'/>", //최종 선택한 값이 넘어감.
		data : {
			doughName : $("#dough option:selected").val(),
			size : $("#size option:selected").val(),
			sauce : $("#source option:selected").val(),
		},
		success:function(data) {
			//alert("setSource:"+data);
/* 			$.each(data.resultData, function(k, v) {
				$("#source").append("<option value='"+v.code+"' data-price='"+v.price+"' "+((k == 0)? "selected" : "")+ ">"+v.name+"</option>");
			}); */
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});

	setDoughPrice();
};

var setDoughPrice = function() {
	$("#doughPrice").text("0 원"); //기본 금액
	//if($("#source").val() != "")
	//선택한 사이즈에 따른 기본피자 가격 + 도우 가격
	$("#doughPrice").text( ((parseInt($("#size option:selected").data("price")))+($("#dough option:selected").data("price"))).cvtNumber() + "원");
	setTotalAmt(); 
};

var removeTopping = function() {
	$("#toppingList").val("");
	$("#toppingTotalAmt").val("0원");
	//$(".option_sum").hide();
	$("#toppingSum").html("내맘대로 토핑을 추가해보세요.");
	$("#toppingDisplayList").html("");
	$("#toppingDisplayList").hide();
	setToppingPrice();
};

var setToppingPrice = function() {
	var toppingList = "";
	var totalAmt = 0;
	var toppingTotalCnt = $("#toppingDisplayList li").length;

	$("#toppingDisplayList li").each(function() {
		if(toppingList != "") toppingList += ",";
		toppingList += $(this).attr("id");
		totalAmt += parseInt($(this).find(".bill_price").text().replaceAll(",", ""));
	});

	$("#toppingList").val(toppingList);
	$("#toppingTotalAmt").text(totalAmt.cvtNumber() + " 원");

	if(toppingList != "") {
		var totalAmtStr = totalAmt.cvtNumber();
		var toppingSumHtml = toppingTotalCnt+"개 선택</strong>";
		$(".balloon_wrap").show();
		$("#toppingSum").html(toppingSumHtml);
	} else {
		//$(".balloon_wrap").hide();
		$("#toppingSum").html("내맘대로 토핑을 추가해보세요.");
	}
	setTotalAmt();
};

var setTotalAmt = function() {
	var totalPrice = parseInt($("#doughPrice").text().replaceAll(",", "").replaceAll("원", ""));
	totalPrice += parseInt($("#toppingTotalAmt").text().replaceAll(",", "").replaceAll("원", ""));
	$("#totalAmt").data("price", totalPrice);
	$("#totalAmt").text(totalPrice.cvtNumber() + "원");
};

//토핑 가져오기
var addToppingCheck = function() {
	if($("#source").val() == "") {
		alert("소스를 선택해주세요.");
		return;
	}

	$.ajax({
		type: "POST",
		url: "<c:url value='/Pizza/BuyPizza/choice.pz'/>",
		data: {
			'goods_code': $("#dough").val()+$("#size option:selected").data("size"),
			'topping': $("#source").val()
		},
		success:function(data) {
 			if(data == "success") {
 				//alert("값 넘기기 성공");
				addTopping();
			} 
 			/*
 			else {
				alert(data.resultData.result);
				return;
			} */
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
};

//토핑 가져오기
var addTopping = function() {
	if($("#source").val() == "") {
		alert("소스를 선택해주세요.");
		return;
	}

	$("#topping_info_pop2").html("");
	$.ajax({
		type: "POST",
		url: "<c:url value='/Pizza/BuyPizza/mykitchen_mkToppingLayer.pz'/>",
		data: {'where':'mk'
/* 			'code_01': $("#dough").val(),
			'gubun' : $("#size option:selected").data("gubun"),
			'sub_name' : $("#size option:selected").data("size") */
		},
		success:function(data) {
		 	$("#topping_info_pop2").html(data).addClass("open");
		 	var top = $(window).scrollTop();
		 	$("#topping_info_pop2").find('.pop_wrap').css('top',top+30+'px');
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
};

//토핑 레이어 닫기
var closeLayer = function() {
	$(".pop_layer").removeClass("open");
};




</script>
<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="event">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><a href="<c:url value='/Pizza/BuyPizza/hnh.pz'/>">내맘대로 피자</a></li>
				<li><span>마이 키친</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>내맘대로 피자</h2>
			</div>
		</div>
		<!-- //sub_title -->


		<div class="tab_category">
			<ul class="btn_tab">
				<li><a href="<c:url value='/Pizza/BuyPizza/hnh.pz'/>">하프&하프</a></li>
				<li class="active"><a href="javascript:;">마이 키친</a></li>
				<li><a href="<c:url value='/Pizza/BuyPizza/topping.pz'/>">추가 토핑 안내</a></li>
			</ul>
			<div class="tab_content_wrap pizza">
				<div class="tab_content active">
					<span class="mykitchen_obj"></span>
					<a href="javascript:showLayer('mkIngredient');" class="btn"><span class="btn_txt">마이키친 영양성분</span></a>
				</div>
				<div class="tab_content">2</div>
				<div class="tab_content">3</div>
			</div>
		</div>
		<!-- //tab -->


		<div class="mykitchen_step_container">


			<div class="step_card">
				<div class="stepcard_title">
					<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/step_tit01.png" alt=""> 도우&amp;소스 선택
				</div>
				<div class="stepcard_content">

					<div class="option_card">

						<ul class="option_list">
							<li>
								<div class="option_box">
									<div class="option_title"><span class="bul">ㆍ</span>도우</div>
										<div class="sel_box">
											<select id="dough" class="select">
												<!-- 원래 option태그의 value값 : RPZ800H -->
												<c:forEach var="item" items="${doughList}">
													<option value="${item.dough_name}" data-price="${item.d_price}">${item.dough_name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
							</li>
							<li>
							
							
								<div class="option_box">
									<div class="option_title"><span class="bul">ㆍ</span>사이즈</div>
									<div class="sel_box">
										<select id="size" class="select">
											<option value='L' data-price="${Lprice}">L</option>
											<option value='M' data-price="${Mprice}">M</option>
										</select>
									</div>
								</div>
							</li>
							<li>
								<div class="option_box">
									<div class="option_title"><span class="bul">ㆍ</span>소스</div>
									<div class="sel_box">
										<select id="source" class="select">
												<c:forEach var="item" items="${sauceList}">
													<option value="${item.ps_name}">${item.ps_name}</option>
												</c:forEach>
										</select>
									</div>
								</div>
							</li>
						</ul>
						<div class="price_total">
							<em>기본 금액 : <em id="doughPrice">0원</em></em>
						</div>

					</div>
					<!-- //option_card -->
				</div>
				<!-- //stepcard_content -->
			</div>
			<!-- //step1 -->


			<div class="step_card">
				<div class="stepcard_title">
					<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/step_tit02.png" alt=""> D.I.Y 피자 완성하기
				</div>
				<div class="stepcard_content">
					<input type="hidden" id="toppingList" value="" />
					<input type="hidden" id="toppingSize_no" value="" />
					<input type="hidden" id="toppingNmList" value="" />
					<div class="topping_card">
						<div class="topping_desc">
							<p class="title">토핑 선택</p>
							<p class="desc">(토핑은 최대 7개 선택 가능)</p>
							<div class="topping_btn">
								<div class="btn_balloon balloon_rgt">
									<a href="javascript:addToppingCheck();" class="btn"><span class="btn_txt">토핑 추가하기</span></a>
									<div class="balloon_wrap">
										<p id="toppingSum">내맘대로 토핑을 추가해보세요.</p>
									</div>
								</div>
							</div>

						</div>
						<ul class="topping_list" id="toppingDisplayList" style="display:none;">
						</ul>

						<div class="price_total">
							<em>토핑 금액 : <em id="toppingTotalAmt">0 원</em></em>
						</div>
						<!-- //total -->
					</div>

				</div>
				<!-- //stepcard_content -->
			</div>
			<!-- //step2 -->

		</div>
		<!-- //mykitchen_step_container -->

		<div class="mykitchen_sumtotal">
			<div class="form_group">
				<div class="form_l">
					<p class="total_num">총 금액 : <em id="totalAmt" data-price="0">0 원</em></p>
				</div>
				<div class="form_r">
					<!-- 2016-09-28 //버튼 클래스 추가(s) -->
					<a href="javascript:;" class="btn btn_mdle btn_basic btn_red" id="btn_basket"><span class="btn_txt">장바구니 담기</span></a>
					<!-- 2016-09-28 //버튼 클래스 추가(e) -->
				</div>
			</div>
		</div>



	</div>
	<!-- //content -->
</div>
<!-- //container -->
<div class="pop_layer pop_type topping" id="topping_info_pop2"></div>
<div class="pop_layer pop_type pop_mkIngredient" id="nutrient_table"></div>

<!-- LOGGER 환경변수 설정 -->
<script type="text/javascript">
	_TRK_PI = "PLV";			// 웹페이지의 성격 정의
    _TRK_CP = "/메뉴/마이 키친";	// 카테고리명 전달
</script>
<!-- // LOGGER 환경변수 설정 -->

<script type="text/javascript">


//마이키친 영양성분 출력용]
var showLayer = function(layerNm) {
	$.ajax({
		type: "GET",
		url: "<c:url value='/Pizza/BuyPizza/'/>"+layerNm+".pz", 
		success:function(data) {
			$(".pop_"+layerNm).html(data);
			$(".pop_"+layerNm).addClass("open");
			var top = $(window).scrollTop();
			$(".pop_"+layerNm).find('.pop_wrap').css('top',top+30+'px');
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
};
var closeLayer = function() {
	$(".pop_layer").removeClass("open");
};
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
