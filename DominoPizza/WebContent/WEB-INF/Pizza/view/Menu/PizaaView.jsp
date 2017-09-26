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



<script type="text/javascript" src="/resources/js/common.js"></script>
<script>
$(document).ready(function() {
	$("#wrap").addClass("fixed_clear");

	$(".gnb_menu .menu01").addClass("on");
	
	// 도우 옵션 셋팅
	//var option_cnt = $(".options").length;
	$(".options").each(function(i) {
		var val = $(this).data("gubun");
		var nm = $(this).data("ctgrnm");
		var isExist = false;
		$(".opt_dough:eq(0) option").each(function() {
			if($(this).val() == val)
				isExist = true;
		});
		if(!isExist) {
			$(".opt_dough").append("<option value='"+val+"'>"+nm+"</option>");
			if("${listval}" == val) {
				$(".opt_dough").val(val);
				setSize();
			}

		}


	});


	$(".opt_dough").change(function() {
		$(".opt_dough").val($(this).val());
		setSize();
	});

	$(".opt_size").change(function() {
		$(".opt_size").val($(this).val());
		removeTopping();
		setTotalAmt();
	});

	$("#top_btn_basket, #btn_basket").click(function() {
		var returnUrl = "/goods/detail?dsp_ctgr=C0101&code_01=RPZ135GL";

		addBasket("addPZ", $("#size").val(), $("#qty").val(), $("#toppingList").val(), "", addBasketComplete, returnUrl);
	});





	$(".minus").click(function() {
		var cnt = parseInt($("#qty").val()) - 1;
		if(cnt < 1) cnt = 1;

		$(".opt_qty").val(cnt);
		setTotalAmt();
	
		setToppingStr();
	

	});

	$(".add").click(function() {
		var cnt = parseInt($("#qty").val()) + 1;
		if(cnt > 9) cnt = 9;

		$(".opt_qty").val(cnt);
		setTotalAmt();
	
		setToppingStr();
	

	});

	//영양성분 기본 셋팅
	getNutrition();

 	 
});

var addBasketComplete = function(returnUrl) {
	$('.dim').toggleClass('on');
	$("body").toggleClass("back");
	$('.option_area').toggleClass('on');
	$('.option_box').slideToggle();
	window.setTimeout( function() {
	
			//location.href = "list?dsp_ctgr=C0101";
			location.href = "/goods/list?dsp_ctgr=C0102";
		
	}, 900);
};


var setToppingStr = function() {
	if($("#qty").val() != "1"  && $("#toppingList").val() != "") {
		$(".pizzaQty").html(" X 피자("+$("#qty").val() +")");
	} else {
		$(".pizzaQty").html("");
	}

}
//토핑 리셋
var removeTopping = function() {
	$("#toppingList").val("");
	$("#toppingTotalAmt").val("");
	$(".toppingSum").html("내맘대로 토핑을 추가해보세요.");
	//$(".balloon_wrap").hide();
};

//사이즈 옵션 셋팅
var setSize = function() {
	removeTopping();
	// 사이즈 옵션 셋팅
	$(".opt_size").html("");
	$(".options").each(function(i) {
		if($(this).data("gubun") == $("#dough").val()) {
			$(".opt_size").append("<option value='"+$(this).attr("id")+"'>"+ $(this).data("options") + $(this).data("pricecomma")+"원</option>");
		}
	});

	//총액 반영
	setTotalAmt();
};

//토핑 가져오기 (토핑 추가하기 버튼 눌렀을 시 호출됨)
var addToppingCheck = function() {
	var size = $("#size").val();
	var goods_code="pizza";
	//alert("goods_code : "+goods_code);
	$.ajax({
		type: "POST",
		url: "<c:url value='/Pizza/BuyPizza/choice.pz'/>",
		data: { 'goods_code': goods_code }, //첫번째 피자 + 두번쨰 피자 + 도우 + 사이즈를 넘김
		dataType:"text",
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
	
	if($("#size").val() == "") {
		alert("피자, 도우, 사이즈를 선택해주세요.");
		return;
	}

	if($("#pizza_select1").val() == "") {
		alert("피자를 선택해주세요.");
		return;
	}
	//alert("넘기는 값 : "+$("#pizza_select1").val()+$("#size").val());
	//alert("addTopping!!!!!!!!!!!");
	$("#topping_info_pop").html("");
	$.ajax({
		type: "POST",
		url: "<c:url value='/Pizza/BuyPizza/toppingLayer.pz'/>",
		data: { 'where':'hnh'
			//'code_01': $("#pizza_select1").val()+$("#size").val() 
			},
		//data: { 'code_01': $("#pizza_select1").val()+$("#size").val() },
		success:function(data) {
			$("#topping_info_pop").html(data).addClass("open");
		 	var top = $(window).scrollTop();
		 	$("#topping_info_pop").find('.pop_wrap').css('top',top+30+'px');
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
};


//토핑 가져오기
/* var addToppingCheck = function() {
	alert("베이컨칩 일시적으로 와규크럼블로 대체 → 상세내용은 도미노뉴스를 확인하시기 바랍니다.");
	$.ajax({
		type: "POST",
		url: "/goods/pauseCheck",
		data: { 'goods_code': $("#size").val() },
		success:function(data) {
			if(data.resultData.result == "success") {
				addTopping();
			} else {
				alert(data.resultData.result);
				return;
			}
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
};
 */
 
// 토핑 가져오기
/* var addTopping = function() {
	$("#topping_info_pop").html("");
	$.ajax({
		type: "POST",
		url: "toppingLayer",
		data: { 'code_01': $("#size").val() },
		success:function(data) {
		 	$("#topping_info_pop").html(data);
		 	$("#topping_info_pop").addClass("open");
		 	var top = $(window).scrollTop();
		 	$("#topping_info_pop").find('.pop_wrap').css('top',top+30+'px');
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
}; */


var setTotalAmt = function() {

	var pizzaAmt = parseInt($("#"+$("#size").val()).data("price")) * parseInt($("#qty").val());
	var toppingAmt = ($("#toppingTotalAmt").val() != "")? parseInt($("#toppingTotalAmt").val()) * parseInt($("#qty").val()) : 0;
	$(".totalAmt").text((pizzaAmt + toppingAmt).cvtNumber() + "원");
};

/* 
//영양성분 조회
var getNutrition = function() {
	var p_code = "RPZ135GL";
	
		p_code = "RPZ135GL".substring(0,6);
	

	$.ajax({
		type: "POST",
		url: "/ingredientAjax",
		data: { code_01 : p_code },
		dataType : "json",
		success:function(data) {
			var addHtml = "";

			$.each(data.resultData.ingredientList, function (index, entry) {
				addHtml += "<tr><td>"+ entry["name"]+"</td>";
				
				addHtml += "<td>"+entry["N0001"]+"</td>";
				
				addHtml += "<td>"+entry["N0002"]+"</td>"
				   +"<td>"+entry["N0003"]+"</td>";
				
				addHtml += "<td>"+entry["N0004"]+"</td>"
				   +"<td>"+entry["N0005"]+"</td>"
				   +"<td>"+entry["N0006"]+"</td>"
				   +"<td>"+entry["N0007"]+"</td>"
				   +"<td>"+entry["N0008"]+"</td>"
				   +"</tr>";
			});

			var nodata = "<tr><td colspan=\"9\">데이터가 없습니다.</td></tr>";
			if(data.resultData.ingredientListCnt < 1)
				$("#nutritionTable").html(nodata);
			else
				$("#nutritionTable").html(addHtml);

			//천단위 콤마, 사이드 디시인 경우 불필요 칼럼 삭제
			$("#nutritionTable td").each(function(idx){
				var txt = $(this).text();
				if(!isNaN(txt))
					$(this).text(numberWithCommas(txt));
			});

			//짝수 라인 스타일
			$("#nutritionTable tr:nth-child(even)").each(function(){
				$(this).addClass("bg_tr_gray");
			});
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
};

var showLayer = function(layerNm) {
	$.ajax({
		type: "GET",
		url: "/contents/"+layerNm,
		success:function(data) {
			$(".pop_"+layerNm).html(data);
			$(".pop_"+layerNm).addClass("open");
			var top = $(window).scrollTop();
			$(".pop_"+layerNm).find('.pop_wrap').css('top',top+30+'px');
		},
		error: function (error){
			alert("다시시도해주세요.");
		}
	});
};

 */
 
 
var showLayerAllegic = function() {
	$.ajax({
		type: "GET",
		url: "/contents/ingredient?togo=Allergic",
		success:function(data) {
			$(".pop_ingredient").html(data);
			$(".pop_ingredient").addClass("open");
			var top = $(window).scrollTop();
			$(".pop_ingredient").find('.pop_wrap').css('top',top+30+'px');
		},
		error: function (error){
			alert("다시시도해주세요.");
		}
	});
};
var closeLayer = function() {
	$(".pop_layer").removeClass("open");
};



function share(optn) {
	var shareLink = CON_DOMAIN_URL + '/goods/detail?dsp_ctgr=C0101&code_01=RPZ135GL';
	var style = 'resizable=no,status=no,location=no,toolbar=no,menubar=no,fullscreen=no,scrollbars=no,dependent=no';
	var link, popupId;

	if (optn == 'facebook') {

		var params = 'u=' + encodeURIComponent(shareLink);
		params += '&title=' + encodeURIComponent('도미노피자 꽃게 온더 피자 곡물도우') ;
		params += '&description=' + encodeURIComponent('행복을 배달하는 No.1 Pizza Company, 도미노피자의 꽃게 온더 피자 곡물도우');
		if ('https://cdn.dominos.co.kr/admin/upload/goods/20170609_9g0kwg21.jpg' != '') {
			params += '&picture=' + encodeURIComponent('https://cdn.dominos.co.kr/admin/upload/goods/20170609_9g0kwg21.jpg');
		}

		link = 'https://www.facebook.com/sharer/sharer.php?' + params;
		popupId = 'share_facebook_pop';
		style = style + ',width=600,height=250';

	} else if (optn == 'twitter') {

		link = 'http://twitter.com/share?text=' + encodeURIComponent('도미노피자 꽃게 온더 피자 곡물도우 '+shareLink);
		popupId = 'share_twitter_pop';
		style = style + ',width=533px,height=437px';

	} else if (optn == 'kakaostory') {

		var sUrl =  CON_DOMAIN_URL + '/goods/share?dsp_ctgr=C0101&code_01=RPZ135GL';

		link = 'https://story.kakao.com/share?url=' + encodeURIComponent(sUrl);
		popupId = 'share_twitterkakaostory_pop';
		style = style + ',width=600px,height=600px';

	} else {
		return;
	}

	window.open(link, popupId, style);
}

  var chocolatChk = function() {
	if(confirm("쇼콜라푸딩 1+1 이벤트 진행 중입니다.\n1+1으로 주문하러 가시겠습니까?")){
		location.href = "/hotdeal/opochocolat";
	} else {
		location.href = "/goods/list?dsp_ctgr=C0201";
	}
	return;
}
</script>

<!-- container -->
<div id="container">
<c:forEach items="${list }" var="list" varStatus="lo" >
<input type="hidden" class="options" id="${list.d_no }L" data-ctgrnm="${list.dough_name }" data-options="L:" data-gubun="${lo.count}" data-price="${dto.p_lprice+list.d_price}" data-pricecomma="${dto.p_lprice+list.d_price}" />
<input type="hidden" class="options" id="${list.d_no }M" data-ctgrnm="${list.dough_name } " data-options="M:" data-gubun="${lo.count}" data-price="${dto.p_sprice+list.d_price}" data-pricecomma="${dto.p_sprice+list.d_price}" />
</c:forEach>
<!-- content -->
	<div id="content" class="product">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><a href="/goods/list?dsp_ctgr=C0101">피자</a></li>
				<li><a href="/goods/list?dsp_ctgr=C0101">곡물도우</a></li>
				<li><span>꽃게 온더 피자 곡물도우</span></li>
			</ul>

			<div class="sub_title_wrap">
				<h2>피자</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<!-- prd_detail -->
		<div class="prd_detail">

			<div class="prd_info">
				<div class="prd_img_view">
					<div class="prd_tag">
					<!-- <span class="ico ico_big_tag">NEW</span> -->
					<c:if test="${!empty best}">
					<h2>
					<span class="ico ico_tag2">BEST</span>
					</h2>
					</c:if>
					</div>
					<!-- SNS 공유  -->
					<div class="prd_sns">
						<!-- <span class="ico ico_sns_facebook" onclick="share('facebook'); return false;"></span>
						<span class="ico ico_sns_twitter" onclick="share('twitter'); return false;"></span>
						<span class="ico ico_sns_kakaostory" onclick="share('kakaostory'); return false;"></span> -->
					</div>



					<div class="allergy_info">
						<a href="javascript:showLayerAllegic();">알레르기 유발 가능 식품 안내</a>
					</div>
					
					<p class="view_pic">* 모든 사진은 이미지 컷이므로 실제 제품과 다를 수 있습니다.</p>
						<c:if test="${listval==4}">
						<c:set value=" 곡물 도우" var="names" />
						<c:set value="&gok=1" var="tag" />
						</c:if>
					<div class="prd_img">
						<div class="slide_wrap btn_lft btn_type">
							<ul class="slides">
							<li><img src="<c:url value='/Pizza/Image/pizzalist/${dto.p_img}' />" alt="${dto.p_name }" /></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="prd_order_view">
					<form action="#">
					<div class="prd_title">
						${dto.p_name}${names}</div>
					<div class="prd_price">
					
					<c:if test="${listval==4}" var="te" >
					<p class="price_large"><span class="ico ico_large"></span>${dto.p_lprice+2000 }원</p>
						<p class="price_medium"><span class="ico ico_medium"></span>${dto.p_sprice+2000 }원</p>
							</c:if>
							
							<c:if test="${!te}">
							<p class="price_large"><span class="ico ico_large"></span>${dto.p_lprice}원</p>
						<p class="price_medium"><span class="ico ico_medium"></span>${dto.p_sprice}원</p>
							</c:if>
					</div>
					<div class="prd_order">

					<div class="prd_section prd_style">
							<dl class="prd_dough">
								<dt>도우</dt>
								<dd>
									<div class="sel_box">
										<!-- 2017-01-03 // openwax 수정(s) -->
										
										<select name="dough" id="dough" class="opt_dough" title="도우"></select>
										<!-- 2017-01-03 // openwax 수정(e) -->
									</div>
								</dd>
							</dl>
							<dl class="prd_size">
								<dt>사이즈</dt>
								<dd>
									<div class="sel_box">
										<select name="doughs" id="size" class="opt_size" title="사이즈"></select>
									</div>
								</dd>
							</dl>
							<div class="btn_prd_style">
								<div class="btn_balloon balloon_rgt">


									<input type="hidden" id="toppingSize_no" value="" />
									<input type="hidden" id="toppingList" value="" />
									<input type="hidden" id="toppingNmList" value="" />
									<input type="hidden" id="toppingTotalAmt" value="0" />

									<a href="javascript:addToppingCheck();" class="btn"><span class="btn_txt">토핑 추가하기</span></a>
									<div class="balloon_wrap">
										<p class="toppingSum">내맘대로 토핑을 추가해보세요.<span class="pizzaQty"></span></p>
									</div>
								</div>
							</div>
						</div>
					<div class="prd_section prd_quantity">
							<dl>
								<dt>수량</dt>
								<dd>
									<div class="input_num">
										<a href="javascript:;" class="minus"><span class="ico ico_minus"></span>수량 감소</a>
										<div class="form_item">
											<input type="text"  readonly="readonly" name="qty" id="qty" class="i_text opt_qty" value="1" title="수량"/>
										</div>
										<a href="javascript:;" class="add"><span class="ico ico_add"></span>수량 증가</a>
									</div>
								</dd>
							</dl>
							<p class="prd_total"><span>총 금액</span> : <span class="totalAmt" id="price" >0원</span></p>
						</div>
						</div>
						<form action="abcde" id="frs" >
						<input type="hidden" value="${dto.p_name}${names}" name="p_name" >
						<input type="hidden" value="${dto.p_no}" name="p_no" >
						
					<a href="#" onclick="smt();" class="btn btn_mdle btn_red" id=""><span class="btn_txt">장바구니 담기</span></a>
					
						</form>
					</form>
					</div>
			</div>
			<script>
					function smt(){
						<c:if test="${empty ID }" var="idc" >
						alert("로그인 후 이용가능합니다.");
						location.href="<c:url value='/User/Login.pz' />";
						</c:if>
						<c:if test="${!idc}">
						<c:if test="${empty DE_ADDR }" var="idc" >
						location.href="<c:url value='/AddrSelect.pz' />";
						</c:if>
						var priceDom = document.getElementById("price");
						var price = priceDom.innerHTML;
						var doughDom = document.getElementById("dough");
						var dough = doughDom.options[doughDom.selectedIndex].text;
						var doughno = doughDom.options[doughDom.selectedIndex].value;
						var sizeDom = document.getElementById("size");
						var size = sizeDom.options[sizeDom.selectedIndex].text;
						var formDom = document.getElementById("frs");
						var imgDom = document.getElementById("p_img");
						var img = imgDom.src;
						var qtyDom = document.getElementById("qty");
						var qty = qtyDom.value;
						var ts_no = document.getElementById('toppingSize_no');
						var tsno = ts_no.value;
						location.href="<c:url value='/AddrSelect.pz' />?kind=1&na=${dto.p_name}&no=${dto.p_no}&size="+size+"&dough="+dough+"&price="+price+"&img=${dto.p_img}&namez="+"&qty="+qty+"&topping="+tsno+"&doughno="+doughno;
						</c:if>
					}
			</script>
			
			<div class="prd_detail_view">
				<div class="tab tab_type4">
					<ul class="btn_tab">
						<li class="active"><a href="#">제품 상세보기</a></li>
						<li><a href="#">토핑 및 원산지</a></li>
						<li><a href="#">영양성분</a></li>
					</ul> 
					<div class="tab_content_wrap">
						<div class="tab_content active">
							<div class="detail_view_info">
								<p>${dto.p_detail}
								</p><p><img id="p_img" alt="" src="<c:url value='/Pizza/Image/pizzalist/${dto.p_dimg}' />"><br></p></div>
						</div>
						<div class="tab_content">
							<div class="detail_view_topping">
							<table class="tbl_type">
									<caption>토핑 정보</caption>
									<colgroup>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th>토핑</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${dto.p_topping }</td>
										</tr>
									</tbody>
								</table>
							<table class="tbl_type">
									<caption>원산지 정보</caption>
									<colgroup>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th>원산지</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${dto.p_origin }</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab_content">
							<div class="detail_view_nutrient">
								<table class="tbl_type">
									<caption>영양성분 정보</caption>
									<colgroup>
										<col/>
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th>제품명</th>
											<th>총 중량(g)</th>
											<th>1회분 기준</th>
											<th>1회분 중량<br>(g)</th>
											<th>열량<br>(kcal/1회분)</th>
											<th>단백질<br>(g/1회분)</th>
											<th>포화지방<br>(g/1회분)</th>
											<th>나트륨<br>(mg/1회분)</th>
											<th>당류<br>(g/1회분)</th>
										</tr>
									</thead>
									<tbody id="nutritionTable">
									<c:forEach items="${listpn }" var="pn" >
										<tr>
										<td>${pn.p_name }(${pn.dough_name } ${pn.n_size })</td>
										<td>${pn.n_gram }</td>
										<td>${pn.n_stan }</td>
										<td>${pn.n_stangram }</td>
										<td>${pn.n_kcal }</td>
										<td>${pn.n_protein }</td>
										<td>${pn.n_sfat }</td>
										<td>${pn.n_natrium }</td>
										<td>${pn.n_sugar }</td>
										</tr>
									</c:forEach>
									</tbody>
									
								</table>
								<p>단위 -총중량, 중량, 단백질, 포화지방, 당류:G/나트륨:MG/ 열량:KCAL</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="prd_features">
				<ul>
					<li><a href="javascript:showLayer('dough');">도우의 특징</a></li>
					<li><a href="javascript:showLayer('property');">도미노피자의 특징</a></li>
					<li><a href="javascript:showLayer('story');">피자 스토리</a></li>
					<li><a href="javascript:showLayer('ingredient');">영양성분 및 알레르기 유발성분</a></li>
				</ul>
			</div>



		</div>
		<!-- //prd_detail -->

	</div>
	<!-- //content -->
</div>
<!-- //container -->

<div class="prd_order_option">
	<div class="prd_order_wrap">

	<dl class="prd_dough">
		    <dt class="prd_option_tit">도우</dt>
		    <dd>
		        <div class="sel_box">
		        	<!-- 2017-01-03 // openwax 수정(s) -->
		            <select id="top_dough" class="opt_dough" title="도우"></select>
		            <!-- 2017-01-03 // openwax 수정(e) -->
		        </div>
		    </dd>
		</dl>
		<dl class="prd_size">
		    <dt class="prd_option_tit">사이즈</dt>
		    <dd>
		        <div class="sel_box">
		            <select id="top_size" class="opt_size" title="사이즈"></select>
		        </div>
		    </dd>
		</dl>
		<div class="btn_prd_style">
		    <div class="btn_balloon balloon_rgt">
		        <a href="javascript:addToppingCheck();" class="btn"><span class="btn_txt">토핑 추가하기</span></a>
		        <div class="balloon_wrap">
		            <p class="toppingSum">내맘대로 토핑을 추가해보세요.<span class="pizzaQty"></span></p>
		        </div>
		    </div>
		</div>
	<dl class="prd_quantity">
		    <dt class="prd_option_tit">수량</dt>
		    <dd>
		        <div class="input_num">
		            <a href="javascript:;" class="minus"><span class="ico ico_minus"></span>수량감소</a>
		            <div class="form_item">
		                <input type="text" name="" id="top_qty" class="i_text opt_qty" value="1" readonly title="수량"/>
		            </div>
		            <a href="javascript:;" class="add"><span class="ico ico_add"></span>수량증가</a>
		        </div>
		    </dd>
		</dl>
		<div class="prd_total">
			<dl>
				<dt class="prd_option_tit">총 금액</dt>
				<dd class="totalAmt">0 원</dd>
			</dl>
			<a href="#" onclick="smt();" id="top_btn_basket" class="btn btn_mdle btn_red"><span class="btn_txt">장바구니 담기</span></a>
		</div>
		
		
	</div>
</div>
<div class="pop_layer pop_type topping" id="topping_info_pop"></div>
<div class="pop_layer pop_type pop_dough" id="dough_features"></div>
<div class="pop_layer pop_type pop_property" id="pizza_features"></div>
<div class="pop_layer pop_type pop_story" id="pizza_story"></div>
<div class="pop_layer pop_type pop_ingredient" id="nutrient_table"></div>

<!-- LOGGER 환경변수 설정 -->
<script type="text/javascript">
	_TRK_PI = "PDV";						// 웹페이지의 성격 정의 - 상품상세보기
	_TRK_CP = "/메뉴/상세/RPZ135GL";	// 카테고리명 전달
	_TRK_PN = 'RPZ135GL_꽃게 온더 피자 곡물도우';	// 상품(컨텐츠)명 전달 - pcode
	_TRK_PND = '꽃게 온더 피자 곡물도우';	// 상품(컨텐츠)명 전달 - name
	_TRK_MF = "도미노피자";					// 상품(컨텐츠)의 브랜드명 전달
</script>
<!-- // LOGGER 환경변수 설정 -->

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
		<!-- //장바구니 (e) -->

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
<img alt="dd" src="">
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

    