<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
		<!-- header -->
		
	<jsp:include page="/WEB-INF/Pizza/template/Top.jsp" />
	


		<!-- //header -->
		

<script type="text/javascript" src="https://plugin.inicis.com/pay61_secunissl_cross.js"></script>
<script type="text/javascript">
	StartSmartUpdate(); // inicis
</script>
<script type="text/javascript">
var ajaxRequest = null;
var doOrderClick = false;

$(".util_right .btn_cart").hide();

$(document).ready(function() {
	$.ajaxSetup({cache:false});

	// 상품 요약
	setGoodsBrief();

	getOrderInfoDetail("Y");
	recipientChange();

	if("" != "N" && "N" != "001") //챗봇일때 숨김 처리 
		openNotice();
});

/*
$(document).ajaxStart(function() {
	$("#orderLoading").show();
}).ajaxStop(function() {
	$("#orderLoading").hide();
});
*/

var openNotice = function() {
	$("#notice").addClass("open");
};

var closeNotice = function() {
	$("#notice").removeClass("open");
};

var orderClick = function(stat) {
	doOrderClick = stat;

	if(stat){
		$("#defaultLoading").show();
	} else {
		$("#defaultLoading").hide();
	}
};

// 주문서 작성 상세폼 조회 및 노출
var getOrderInfoDetail = function(rcmd_yn) {
	if(ajaxRequest != null) {
		alert("처리중인 작업이 있습니다. 잠시후에 다시 시도해 주세요.");
		return;
	}

	$.ajax({
		type: "POST",
		url : '/order/info/detail',
		data : {rcmd_yn : rcmd_yn},
		dataType : 'html',
		success:function(data) {
			var resultMsg = $(data).find("#result_msg").text();
			if($.trim(resultMsg) != ""){
				alert(resultMsg);
			}

			$("#goods_info").html($(data).find("#goods_info").html());
			$("#dc_info").html($(data).find("#dc_info").html());
			$("#time_info").html($(data).find("#time_info").html());
			$("#pay_info").html($(data).find("#pay_info").html());
			$("#final_pay_info").html($(data).find("#final_pay_info").html());

			// 상품 요약
			setGoodsBrief();

			// 예약구분 디폴트
			var changeObj = null;
			$.each($("#time_info_gubun_btn li"), function(index, addrObj) {
				var data = $(addrObj).children('a').data('value').split('|');
				if(data[1] == "Y") { changeObj = addrObj; return false; }
			});
			if(changeObj == null) { changeObj = $("#time_info_gubun_btn li").eq(0); }
			changeReserveGubun(changeObj);

			// 결제방법 선택 초기화
			$("#settlement_method").val("");
			$("#pay_method").val("");
			$("#pay_method_chk").val("");

			// 결제방법 내용 없는 경우는 account_price 가 0인 경우 이므로 현금 후결제로 고정
			if($.trim($(data).find("#pay_info").html()) == "") {
				$("#settlement_method").val("1");
				$("#pay_method").val("1");
				$("#pay_method_chk").val("Y");
			}

			// 퀵 오더 노출
			if( !("N" == "Y" || "Y" == "N") ) {
				$("#quick_save_check").show();
			}
		},
		error: function (error){
	//		alert("처리도중 오류가 발생하였습니다. 다시 시도해주세요.");
		},
		beforeSend: function() {
			ajaxRequest = "Y";
	    },
	    complete: function() {
	    	ajaxRequest = null;
	    }
	});
};


var setGoodsBrief = function() {
	var goodsBrief = '<p class="txt_prd_name">' + $("#goodsList tr td:eq(0)").find("#goods_name_brief").html();
	if($("#goodsList tr").length > 1) {
		goodsBrief += " 외 " + ($("#goodsList tr").length - 1) + "건";
	}
	goodsBrief += "</p><strong class=\"txt_prd_price\">총 주문 금액&nbsp;<span>"+$("#total_price").val().cvtNumber()+"원</span></strong>";
	$("#goodsBrief").html(goodsBrief);
};

// 레이어 닫기 (다른할인 적용)
var closePrmtLayer = function(fp,fm,sname,sno) {
/* 	var minprice = frams.contentWindow.document.getElementById("area_dc_price");
	var fprice = frams.contentWindow.document.getElementById("area_before_account_price2");
	var infomin = document.getElementById("infomin");
	alert(minprice);
	var infofprice = document.getElementById("infofprice");
	alert(fprice);
	infomin.innerHTML = minprice.innerHTML; 
	infofprice.innerHTML = fprice.innerHTML; 
	cnamedom.innerHTML
	$("#sale_benefits iframe").remove();
	$("#sale_benefits").removeClass("open");
	*/
	<c:set value='testa' var="testa" />
	$("#sale_benefits iframe").remove();
	$("#sale_benefits").removeClass("open");
	var fprice = document.getElementById("infofprice");
	fprice.innerHTML=fp;
	$(".minprice").html(fm);
	$(".fprice").html(fp);
	$(".sname").html(sname);
	$("#mc_no").val(sno);
	$("#sa_price").val(fp);
/* 	var minprice = document.getElementById("infomin");
	minprice.innerHTML=fm;
	var sale_push = document.getElementById("sale_push");
	sale_push.innerHTML=sname; */
	alert(document.getElementById("sa_price").value);
};


// 다른할인 적용
var changePrmt = function() {
	var order_gubun = $("#order_gubun").val();

	if(order_gubun == "W" && ($("#w_addr_sn").val() == "" || $("#w_addr_sn").val() == "0")) {
		alert("매장을 먼저 선택해 주세요."); return;
	} else if(order_gubun == "O" && ($("#o_addr_sn").val() == "" || $("#o_addr_sn").val() == "0")) {
		alert("배송지를 먼저 선택해 주세요."); return;
	}

	alert("할인변경 시 도착 예정 시간이 초기화 됩니다.");
	var url = "<c:url value='CouponLay.pz' />";
	$("#sale_benefits iframe").remove();
	if("N" == "001")
		$("#sale_benefits .pop_header").after("<iframe name='frams' src='"+url+"' frameborder='0' width='1000' height='1017' scrolling='no' title='할인'></iframe>");
	else
		$("#sale_benefits .pop_header").after("<iframe name='frams' src='"+url+"' frameborder='0' width='1000' height='1017' scrolling='no' title='할인'></iframe>");
	$("#sale_benefits").addClass("open");
};


// reserve_gubun 변경
var changeReserveGubun = function(obj) {
	var data = $(obj).children('a').data('value').split('|');
	var idx = $("#time_info_gubun_btn li").index(obj);

	$("#time_info_gubun_btn li").removeClass('active');
	$(".arr_time_sub").hide();

	$(obj).addClass('active');
	$(".arr_time_sub").eq(idx).show();

	$("#reserve_gubun").val(data[0]);
	$("#reserve_gubun_chk").val(data[1]);

	$("#reserve_time11").html('<option value="">시간</option>');
	$("#reserve_time12").html('<option value="">분</option>');
	$("#reserve_time21").html('<option value="">시간</option>');
	$("#reserve_time22").html('<option value="">분</option>');

	if(data[1] == 'Y'){
		if(data[0] == 'TD'){
			arriveTime(data[0], null, 'reserve_time11', 'H');
		}else if(data[0] == 'TM'){
			arriveTime(data[0], null, 'reserve_time21', 'H');
		}
	}
};

// 주문 예약 시간 조회
var arriveTime = function(reserve_cho, orgId, targetId, timeType) {
	//$(document).unbind('ajaxStart');
	//$(document).unbind('ajaxStop');

	var branch_code="86324";
	var order_gubun="O";
	var select_time;

	if(orgId != null) select_time=$("#"+orgId).val();

	var param = {
		order_gubun : order_gubun,
		branch_code : branch_code,
		reserve_cho : reserve_cho,
		select_time : select_time
	};

	$.ajax({
		url : '/order/getOrderReserveTime',
		type : 'POST',
		dataType : 'json',
		data : param,
		success : function(data) {
			$("#"+targetId).html("");
			if(timeType=='H'){
				$("#"+targetId).append('<option value="">시간</option>');
				if(data.resultData.h_list.length > 0){
					for(var i=0 ; i<data.resultData.h_list.length ; i++){
						$("#"+targetId).append('<option value="'+data.resultData.h_list[i].value+'">'+data.resultData.h_list[i].text+'</option>');
					}
				} else {
					alert('당일예약 시간이 종료되었습니다. 익일예약을 이용해주세요.');
				}
			} else if(timeType=='M'){
				$("#"+targetId).append('<option value="">분</option>');
				if(data.resultData.m_list.length > 0){
					for(var i=0 ; i<data.resultData.m_list.length ; i++){
						$("#"+targetId).append('<option value="'+data.resultData.m_list[i].value+'">'+data.resultData.m_list[i].text+'</option>');
					}
				} else {
					alert('현재 당일예약 주문 가능한 시간을 초과하였습니다.\n바로주문(15분뒤 수령)이나 익일예약으로 진행해주시기 바랍니다.');
				}
			}
		}
	});

	//$(document).bind('ajaxStart');
	//$(document).bind('ajaxStop');
};
// 주문자와 동일 체크 변경
var recipientChange = function(){
	if($("input:checkbox[id='recipient']").is(":checked")){
		$("#customerName").val("${callUser.name}");
		$("#tel1").val("${callUser.tel}".split('-')[0]);
		$("#tel2").val("${callUser.tel}".split('-')[1]);
		$("#tel3").val("${callUser.tel}".split('-')[2]);
		$("#recipient_label").addClass("checked");
	} else {
		$("#customerName").val("");
		$("#tel1").val("");
		$("#tel2").val("");
		$("#tel3").val("");
		$("#recipient_label").removeClass("checked");
	}
};




// 결제방법 클릭시 체크 (하위 체크박스 disable 관련)
var clickPayType = function(type, obj) {
	$(".active").removeClass("active");
	$(obj).parent('li').addClass('active');
	var sapay = document.getElementById("sapay");
	sapay.value=$(obj).html();
	var sapayType= document.getElementById("sapayType");
	sapayType.value=$(obj).parent('li').val();
	if(type == "radio"){
		var hidedefault = $(obj).data('hidedefault');
		var data = $(obj).data('value').split('|');
		if('P' === data[0]){
			$("#pay_info li").removeClass('payco_active');
			$("#pay_info li").removeClass('active');
			
			$(obj).parent('li').addClass('payco_active');
		}else{
			$("#pay_info li").removeClass('payco_active');
			$("#pay_info li").removeClass('active');
			
			$(obj).parent('li').addClass('active');			
		}

		$("#settlement_method").val(data[0]);
		$("#pay_method").val(data[1]);
		$("#pay_method_chk").val(data[2]);

		$(".pay_method_sub_default").show();
		$(".tab_content_wrap").hide();
		$(".tab_content_wrap input:checkbox").attr("checked", false);
		$(".tab_content_wrap input:checkbox").attr("disabled", true);

		if (hidedefault != "") $("#pay_method_sub_default_"+hidedefault).hide();
		$("#pay_method_sub_"+data[1]+" input:checkbox").attr("disabled", false);
		$("#pay_method_sub_"+data[1]).show();
	}
	
	var payCoMsg = '';
	
	if('P' === $('#settlement_method').val())
		payCoMsg = '<li>PAYCO는 온/오프라인 쇼핑은 물론 송금, 멤버십 적립까지 가능한 통합 서비스입니다. </li><li>휴대폰과 카드 명의자가 동일해야 결제 가능하며, 결제금액 제한은 없습니다. </li><li>지원카드: 모든 국내 신용/체크카드 </li>';
	else
		payCoMsg = '<li>삼성카드 보너스 포인트 사용 및 현대카드 M/S/W 포인트 할인을 선택하신 고객님은 해당카드로 결제하셔야 혜택을 받으실 수 있습니다. </li><li>간편결제 시 제휴할인, 포인트사용은 불가능합니다.(현대M포인트 포함) </li>';
		
	$('div.order_payment_guide ul')[0].innerHTML = payCoMsg;
};

function dpayJoinCheck(type, obj){
	$.ajax({
		type: "GET",
		url: "/member/getWpayUserKey",
		data: {},
		success:function(data) {
			// 도미노페이 회원이면 바로 결제 진행
			if(data.resultData.wpayUserKey == null || data.resultData.wpayUserKey == '') {
				// 도미노페이 회원아닐경우 회원가입 진행
				if(confirm("도미노페이 회원가입을 진행 하시겠습니까?")){
					var IFWin;
					var OpenOption = 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=750,height=650,top=100,left=400,';
					IFWin=window.open('/order/DpayMemberStart?mtype=wo', 'IfWindow' ,OpenOption);
				}else{
					$(".tab_content_wrap input:checkbox").attr("checked", false);
					$(".tab_content_wrap input:checkbox").attr("disabled", true);
					return;
				}
			} else {
				clickPayType(type,obj);
			}
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
}


// 글자수 체크
var checkByte = function(tName, maxLength) {
	var cnt = 0, len = 0;
	var tmpStr, last1;
	var msgText = tName.value;
	var lang;
	while(cnt < msgText.length) {
		tmpStr = msgText.charAt(cnt);

		if(escape(tmpStr).length > 4) { // 한글
			len += 2;
		}
		else if(tmpStr != '\r') {
			len++;
		}
		var maxStr = maxLength/2;

		if(len > maxLength) {
			alert("최대 "+maxStr+"자까지 입력 가능합니다.");
			tmpStr = tName.value.substr(0, cnt);
			tName.value = tmpStr;
			return false;
		}
		cnt++;
	}
	return true;
};

// form validation
var isValidFrm = function() {
	if ($('#order_gubun').val().isBlank()) { alert('주문방법을 선택해주세요.'); return false; }

	if( $("#order_gubun").val() == "W" && ($('#w_addr_sn').val().isBlank() || $('#w_addr_sn').val() == 0) ) {
		alert('포장매장을 선택해주세요.'); return false;
	} else if( $("#order_gubun").val() == "O" && ($('#o_addr_sn').val().isBlank() || $('#o_addr_sn').val() == 0) ) {
		alert('배송지를 선택해주세요.'); return false;
	}

	if ($('#reserve_gubun').val().isBlank()) {
		alert('도착예정시간을 선택하세요'); return false;
	} else {
		if($('#reserve_gubun_chk').val() == "N"){
			 alert("현재 "+ $("#reserve_gubun_" + $('#reserve_gubun').val()).text() + "이 불가능합니다."); return false;
		}

		if ($('#reserve_gubun').val() == 'TD') {
			if ($('#reserve_time11').val().isBlank()) { alert('예약시간을 선택하세요'); $('#reserve_time11').focus(); return false; }
			if ($('#reserve_time12').val().isBlank()) { alert('예약시간을 선택하세요'); $('#reserve_time12').focus(); return false; }
		} else if($('#reserve_gubun').val() == 'TM'){
			if ($('#reserve_time21').val().isBlank()) { alert('예약시간을 선택하세요'); $('#reserve_time21').focus(); return false; }
			if ($('#reserve_time22').val().isBlank()) { alert('예약시간을 선택하세요'); $('#reserve_time22').focus(); return false; }
		}
	}

	if ($('#customerName').val().isBlank()) { alert('수령인 이름을 입력하세요'); $('#customerName').focus(); return false; }
	if ($('#tel1').val().isBlank()) { alert('수령인 연락처를 입력하세요'); $('#tel1').focus(); return false; }
	if (!checkNum($('#tel1'),"수령인 연락처는 숫자만 입력하세요")) return;
	if ($('#tel2').val().isBlank()) { alert('연락처를 입력하세요'); $('#tel2').focus(); return false; }
	if (!checkNum($('#tel2'),"수령인 연락처는 숫자만 입력하세요")) return;
	if ($('#tel3').val().isBlank()) { alert('연락처를 입력하세요'); $('#tel3').focus(); return false; }
	if (!checkNum($('#tel3'),"수령인 연락처는 숫자만 입력하세요")) return;

	if ("true" == "false" && $('#email').val().isBlank()) { alert('이메일을 입력하세요'); $('#email').focus(); return false; }

	if ($('#pay_method').val().isBlank()) { alert('결제방법을 선택하세요'); return false; }

	if ($('#pay_method_chk').val() == "N") { alert("현재 선택하신 결제방법으로는 주문이 불가능합니다."); return false; }

	var agt = navigator.userAgent.toLowerCase();
	if ( $('#pay_method').val() == "4" || $('#pay_method').val() == "6" ) {
		if(agt.indexOf("edge") != -1){
			alert("엣지 브라우저에서는 간편결제와 현장결제만 가능합니다.");
			return false;	
		} else if(agt.indexOf("chrome") != -1){
			alert("크롬 브라우저에서는 간편결제와 현장결제만 가능합니다.");
			return false;	
		}
	}	

	return true;
};

// 결제 방식별 처리
var driveOrder = function() {
	var payType = $('#settlement_method').val();
	var url = "";

	var id = 'erjin1230';

	if (payType == '1' || payType == '2') { // (후) 신용카드, (후) 현금
		url = '/order/orderStart';
	} else if (payType == 'K') { // (선) 카카오페이
		url = '/order/orderKakaoStart';
	} else if (payType == 'P') { // (선) 페이코
		url = '/order/orderPayCoStart';
	} else if (payType == 'D') { // (선) 도미노페이
		url = '/order/dPayOrderStart';
		orderFrm.action = url;
		orderFrm.method = "POST";
		orderFrm.submit();
		return true;
	} else { // (선) 케이페이, (선) 신용카드, (선) 휴대폰
		var kpay_yn = $('#pay_method').val() == '2' ? 'Y' : 'N';

		url = '/order/orderIniStart?gubun=';
		if (payType == '9' && kpay_yn == 'N') {
			url += 'c';
		} else if (payType == '9' && kpay_yn == 'Y') {
			url += 'k';
		} else if (payType == 'A') {
			url += 'h';
		}

		$('#orderFrm').attr('target', 'inicisFrame');
	}

	$('#orderFrm').attr('action', url);
	$('#orderFrm').submit();
};

var doOrder = function(){
	// 입력값 검증
	if (!isValidFrm()) return;

	// 장바구니 마감 (완료후 주문 진행)
	var reserve_gubun = $('#reserve_gubun').val()
	var reserveDate = '';
	var reserveTime = '';

	if (reserve_gubun == 'TD') {
		reserveDate = $('#reserve_time11').val().substr(0,8);
		reserveTime = $('#reserve_time11').val().substr(8,10) + $('#reserve_time12').val();
	} else if(reserve_gubun == 'TM'){
		reserveDate = $('#reserve_time21').val().substr(0,8);
		reserveTime = $('#reserve_time21').val().substr(8,10) + $('#reserve_time22').val();
	}

	var settlementMethod = $('#settlement_method').val();

	// 5만원, 10만원권 체크
	var high_cash = "";
	if (settlementMethod == "1") {

		if ($("input[name=check_5]:checked").length > 0) {
			high_cash += "5만원권 ";
		}
		if ($("input[name=check_10]:checked").length > 0) {
			high_cash += "10만원권 ";
		}
	}
	
	if("N" == "001")
		high_cash += "[도미챗주문]"+$('#more_req').val();
	else
		high_cash += $('#more_req').val();

	var sms_msg = "";
	if($("input[name='order_gubun_radio']:checked").val() == "G" || $('#sms_msg').val().lengh > 0){
		sms_msg = encodeURIComponent($('#sms_msg').val());
	}

	var param = {
		action_code : 'finishOD',
		rcv_nm : encodeURIComponent($('#customerName').val()),
		rcv_tel : $('#tel1').val()+'-'+$('#tel2').val()+'-'+$('#tel3').val(),
		reserve_gubun : $('#reserve_gubun').val(),
		reserve_date : reserveDate,
		reserve_time : reserveTime,
		pickle_yn : 'N',
		hotsource_yn : 'N',
		more_req : encodeURIComponent(high_cash),
		sms_msg : sms_msg,
		settlement_method : settlementMethod
	};

	if(ajaxRequest != null) {
		alert("처리중인 작업이 있습니다. 잠시후에 다시 시도해 주세요.");
		return;
	}

	var payType = $('#settlement_method').val();

	// 이니시스 선결제 선택 후 이니시스 모듈을 설치하지 않았을때
	if (payType == 'A' || payType == '9') { 	// (선) 신용카드
		if(!ini_IsInstalledPlugin()){
			if(confirm("일반결제 시 ActiveX 설치가 필요합니다.\n확인 선택 시 페이지가 새로고침되며, ActiveX설치 안내가 진행됩니다.")) {
				location.reload();
				return;
			}else{
				return;
			}
		}
	}

	if(!doOrderClick) {
		$.ajax({
			url : "/basket/basketAction",
			type : 'POST',
			dataType : 'json',
			data : param,
			success : function(data) {
// 				console.dir(data);
				if (data.status == "success") {
					driveOrder(); // 결제 방식별 주문 진행
				} else {
					alert(data.msg);
					orderClick(false);
				}
			},
			error: function (error){
				alert("처리도중 오류가 발생하였습니다. 다시 시도해주세요.");
				orderClick(false);
			},
			beforeSend: function() {
				ajaxRequest = "Y";
				orderClick(true);
		    },
		    complete: function() {
		    	ajaxRequest = null;
		    }
		});
	}
};

var goBranch = function(){
	if(confirm("주문매장 변경 시 장바구니의 제품은 모두 초기화됩니다. 주문매장을 변경하시겠습니까?")) {
		location.href = "<c:url value='/AddrSelect.pz' />?reset=1";
	}
};
</script>
<div id="container">
<iframe id="inicisFrame" name="inicisFrame" title="시스템용" src="" style="display:none;width:0px;height:0px;"></iframe>
<form id="orderFrm" name="orderFrm" action="" target="" method="post">
	<div id="hidden_info">
		<input type="hidden" name="order_gubun" id="order_gubun" value="O">
		<input type="hidden" name="gift_yn" id="gift_yn" value="N">
		<input type="hidden" name="branch_code" id="branch_code" value="86324">
		<input type="hidden" name="o_addr_sn" id="o_addr_sn" value="16926224">
		<input type="hidden" name="w_addr_sn" id="w_addr_sn" value="">
		<input type="hidden" name="reserve_gubun" id="reserve_gubun" value="" />
		<input type="hidden" name="reserve_gubun_chk" id="reserve_gubun_chk" value="" />
		<input type="hidden" name="pay_method" id="pay_method" value="" />
		<input type="hidden" name="pay_method_chk" id="pay_method_chk" value="" />
		<input type="hidden" name="settlement_method" id="settlement_method" value="" />
	</div>
	
		<div class="loading" id="defaultLoading" style="display:none;">
			<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/loading.gif" alt="loading">
			<div class="dim"></div>
		</div>
	
	
	<div id="content" class="cart_payment">
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="#">HOME</a></li>
				<li><span>주문서 작성</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>주문서 작성</h2>
			</div>
		</div>

		<div class="order_info">
			<!-- 배달 -->
			<div class="order_section order_type">
					<div class="tit_order btn_tit2">
						<strong>배달주문</strong>
						<a href="javascript:goBranch();" class="btn"><span class="btn_txt">주문매장 변경</span></a>
					</div>
					<div class="order_adr">
						<p class="addr_info">${DE_ADDR }</p>
						<strong class="order_store_info">${ST_NAME }<span>(${ST_TEL })</span></strong>
					</div>
				</div>
			<!-- // 배달 -->
			<!-- 포장 -->
			<!-- // 포장 -->

			<div class="order_section_wrap variable">
				<!-- 주문제품 -->
				<div class="order_section order_prd">
					<div class="tit_order btn_tit">
						<strong>주문제품</strong>
						<a href="<c:url value='/menuList.pz?ty=101' />" class="btn"><span class="btn_txt">메뉴 변경하기</span></a>
					</div>
					<div class="order_prd_info">
						<div id="goodsBrief"><p class="txt_prd_name">리얼바비큐 곡물 도우L (1) 외 1건</p><strong class="txt_prd_price">총 주문 금액&nbsp;<span>${totalprice }원</span></strong></div>
						<div id="goods_info">
		<div class="order_prd_lst">
			<table class="tbl_type">
				<caption>주문제품 리스트</caption>
				<colgroup>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>주문제품</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody id="goodsList">
						<c:forEach items="${Flist }" var="dto" >
					<tr>
							<td class="txt_align_lft" id="goods_name">
								<span>${dto.name } ${dto.dough}&nbsp;${dto.size }</span>
								<span style="display:none;" id="goods_name_brief">${dto.name }${dto.size } (${dto.qty })</span>
								<c:if test="${!empty dto.toppingList }">
								<br/>
								<c:forEach items="${dto.toppingList }" var="tdto" varStatus="tloop"  >
								<span class="txt_orange">+ ${tdto.t_name}(${tdto.t_size })</span>
								</c:forEach>
								</c:if>
							</td>
							<td>${dto.qty }</td>
							<td><fmt:formatNumber>${dto.price }</fmt:formatNumber> </td>
						</tr>

						</c:forEach>
					</tbody>
			</table>
			<input type="hidden" name="total_price" id="total_price" value="${totalprice }">
		</div>
	</div>
					</div>
				</div>
				<!-- // 주문제품 -->

				<!-- 할인 -->
<div class="order_section order_sale" id="dc_info">
		<div class="tit_order">
			<strong>할인</strong>
		</div>
		<div class="order_sale_info">
			<div class="sale_push">
				
						<span id="sale_push" class="sname" >※ 할인을 선택해주세요.</span>
					</div>
			<dl class="sale_price">
				<dt>할인 금액</dt>
				<dd><span id="infomin" class="minprice">0</span> 원</dd>
			</dl>
			<dl class="expected_price">
				<dt>결제 예정 금액</dt>
				<dd><span id="infofprice" class="fprice"><fmt:formatNumber>${totalprice }</fmt:formatNumber> </span> 원</dd>
			</dl>
			<p class="sale_push_guide">
			</p>
			<div class="btn_wrap">
				<div class="btn_fix_rgt">
					<a href="javascript:changePrmt();" class="btn"><span class="btn_txt">할인 선택</span></a>
								</div>
			</div>
		</div>
	</div>
				<!-- // 할인 -->
			</div>

			<div class="order_section_wrap variable">
				<!-- 수령인 정보 -->
				<div class="order_section order_receipt">
					<div class="tit_order chk_tit">
						<strong>수령인 정보</strong>
						<span class="custom_form">
							<input type="checkbox" name="chk1" id="recipient" onchange="recipientChange()" checked>
							<label for="recipient" id="recipient_label" class="ip_chk checked">
								<em></em><span>주문자와 동일</span>
							</label>
						</span>
					</div>
					<div class="order_receipt_info">
						<div class="receipt_form">
							<ul>
								<li class="form_name">
									<label for="customerName">이름</label>
									<div class="form_group">
										<div class="form_field">
											<div class="form_item">
												<span class="i_label"   id="c_name" style="position: absolute;">${calluser.name }</span>
												<input type="text" id="customerName" name="customerName" value="" maxlength="30" class="i_text">
											</div>
										</div>
									</div>
								</li>
								<li class="form_phone">
									<label for="">연락처</label>
									<div class="form_group">
										<div class="form_field">
											<div class="sel_box">
												<select id="tel1" name="tel1" title="휴대전화번호">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>
												</select>
											</div>
										</div>
										<div class="form_field">
											<div class="form_item">
												<span class="i_label"></span>
												<input type="text" id="tel2" name="tel2" maxlength="4" class="i_text" title="휴대전화번호">
											</div>
										</div>
										<div class="form_field">
											<div class="form_item">
												<span class="i_label"></span>
												<input type="text" id="tel3" name="tel3" maxlength="4" class="i_text" title="휴대전화번호">
											</div>
										</div>
									</div>
								</li>
								<!-- 2017-06-22 // 문구 추가(s) -->
								<li class="num_message">※ 제품 수령을 위하여 연락처를 꼭 확인 해주세요.</li>
								<!-- 2017-06-22 // 문구 추가(e) -->
								<li style="display:none;">
									<dl>
										<dt>선물 메시지</dt>
										<dd>
											<div class="form_item">
												<span class="i_label" id="c_request" style="position: absolute;">최대 25자까지 입력가능</span>
												<textarea name="sms_msg" id="sms_msg" onkeyup="checkByte(this, 50)" class="i_text" title="선물메시지"></textarea>
											</div>
										</dd>
									</dl>
								</li>
								<li style="display:none;">선물메시지는 SMS로 전송됩니다.</li>
							</ul>
							<dl>
								<dt>기타 요청 사항</dt>
								<dd>
									<div class="form_item">
										<span class="i_label" style="position: absolute;">최대 25자까지 입력가능</span>
										<textarea name="more_req" id="more_req" onkeyup="checkByte(this, 50)" class="i_text" title="기타요청사항"></textarea>
									</div>
								</dd>
							</dl>
						</div>
					</div>
				</div>
				<!-- // 수령인 정보 -->
				<!-- 도착 예정시간 -->
<div class="order_section order_payment">
				<div class="tit_order">
					<strong>결제방법</strong>
				</div>
				<div class="order_payment_info">


					<dl class="payment_way2">
							<dt>일반결제</dt>
							<dd>
								<div class="tab tab_type3">
									<ul class="btn_tab">
										<li class="payck" value="1" ><a href="javascript:;" id="pay_method_4" data-hidedefault="2" data-value="9|4|Y"  ">신용카드 바로결제</a></li>
										<li class="payck" value="2" ><a href="javascript:;" id="pay_method_6" data-hidedefault="" data-value="A|6|Y"  ">휴대전화 바로결제</a></li>
										</ul>
									<div class="pay_method_sub_default" id="pay_method_sub_default_2" style="display: block;">
										<p class="txt_payment"><!-- <span class="ico ico_payment_normal"></span> --></p><!-- 클릭시 아래 문구 뜸 -->
									</div>
									<div class="tab_content_wrap" id="pay_method_sub_4" style="display: none;">
											<div class="tab_content active">
												<div class="form_group">
													<div class="form_field">
														<span class="custom_form">
															<input type="checkbox" id="bccard_yn" name="bccard_yn" disabled="disabled">
															<label for="bccard_yn" class="ip_chk">
																<em></em><span></span><!-- 클릭시 아래 문구 떳음 -->
															</label>
														</span>
													</div>
												</div>
											</div>
											<div class="tab_content"></div>
										</div>
									</div>
							</dd>
						</dl>
					<dl class="payment_way3">
							<dt>현장결제</dt>
							<dd>
								<div class="tab tab_type3">
									<ul class="btn_tab">
										<li class="payck" value="3" ><a href="#" id="pay_method_3" data-hidedefault="" data-value="2|3|Y"  ">신용카드 현장결제</a></li>
										<li class="payck" value="4" ><a href="3" id="pay_method_1" data-hidedefault="" data-value="1|1|Y"  ">현금으로 현장결제</a></li>
										</ul>
									<div class="pay_method_sub_default" id="pay_method_sub_default_3" style="display: block;">
										<p class="txt_payment"><!-- <span class="ico ico_payment_spot"></span> --></p>
									</div>
									<div class="tab_content_wrap" id="pay_method_sub_1" style="display: none;">
											<div class="tab_content"></div>
											<div class="tab_content active">
												<div class="form_group">
													<div class="form_field">
														<span class="custom_form">
															<input type="checkbox" id="billyn" name="billyn" value="Y" disabled="disabled">
															<label for="billyn" class="ip_chk">
																<em></em><span>현금 영수증</span>
															</label>
														</span>
													</div>
												</div>
												


											</div>
										</div>
									</div>
							</dd>
						</dl>
					</div>
				<div class="order_payment_guide lst_type v2">
				</div>
			</div>
			
				<!-- // 도착 예정시간 -->
			</div>

			<!-- 결제방법 -->
			<div id="pay_info">
			</div>
			<!-- // 결제방법 -->

			<!-- 결제 금액, 퀵 오더로 설정, 결제 및 주문완료 -->
			<div class="order_section order_total" id="final_pay_info">
				<div class="tit_order">
					<strong>결제금액</strong>
				</div>
				<div class="order_total_info">
					<dl class="price_total">
						<dt>총 주문 금액</dt>
						<dd><fmt:formatNumber>${TOTALPRICE }</fmt:formatNumber></dd>
					</dl>
					<dl class="price_sale">
						<dt>할인 금액</dt>
						<dd class="minprice" ></dd>
					</dl>
					<dl >
						<dt>결제 예정 금액</dt>
						<dd class="fprice" ></dd>
					</dl>
					<div class="order_complete">
						<span class="custom_form" id="quick_save_check" style="display:none;">
							<input type="checkbox" name="quick_save" id="quick_save" value="Y">
							<label for="quick_save" class="ip_chk">
								<em></em><span>이 주문 퀵 오더로 설정하기</span>
							</label>
						</span>
						<!-- 결제 완료버튼 폼 태그 -->
						<form>
						<input type="hidden" name="mc_no" id="mc_no" value="0" />
						<input type="hidden" name="sa_price" id="sa_price" value="0" />
						<input type="hidden" name="sa_pay" id="sapay" value="0" />
						<input type="hidden" name="sa_payType" id="sapayType" value="0" />
						<a href="javascript:;" id="doOrder" onclick="finalsa()" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">결제 및 주문완료</span></a>
						</form>
					</div>
				</div>
			</div>
			<!-- // 결제 금액, 퀵 오더로 설정, 결제 및 주문완료 -->
		</div>
	</div>
</form>
</div>

<script>
// 결제 완료 버튼 눌렀을 때

</script>

<script>
 var pay_no ="0";
 $('.payck').click(function(){
	 pay_no=this.value;
	 
 });

function finalsa(){
	
		var fprice = document.getElementById("infofprice").innerHTML;
		
		var minpr = $(".minprice").html();
		var fpr = $(".fprice").html();
		var sname = $(".sname").html();
		var sno = $(".sno").html();
		var mc_no = $("#mc_no").val();
		var sa_pr = $("#sa_price").val();
		var nam = document.getElementById('customerName').value;
		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();
		var req = $("#more_req").val();
		if(pay_no=="0"){
			alert('결제수단을 선택해주세요!!');
		}
		else{
	 		window.setTimeout( function() {
				$(".loading").css("display","none");
				location.href="<c:url value='/finalsa.pz' />?totalprice=${totalprice}&sa_recipt="+nam+"&sa_rectel="+tel1+"-"+tel2+"-"+tel3+"&fprice="+fpr+"&minprice="+minpr+"&sa_request="+req+"&pay_no="+pay_no+"&sa_sname="+sname+"&mc_no="+mc_no;
	 		}, 800); 
			$(".loading").css("display","block");
			
		}
		
}



</script>



<!-- 배달주소 등록 팝업 -->
<div class="pop_layer pop_type" id="adr_add">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>배달주소 등록</h2>
		</div>
		<a href="#" class="btn_ico btn_close">닫기</a>
	</div>
</div>
<!-- // 배달주소 등록 팝업 -->

<!-- 포장매장 등록 팝업 -->
<div class="pop_layer pop_type" id="store_add">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>포장매장 등록</h2>
		</div>
		<a href="#" class="btn_ico btn_close">닫기</a>
	</div>
</div>
<!-- // 포장매장 등록 팝업 -->

<!-- 다른할인 적용 팝업 -->
<div class="pop_layer pop_type" id="sale_benefits">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>도미노가 준비한 모든 할인 혜택</h2>
		</div>
		<a href="#" class="btn_ico btn_close">닫기</a>
	</div>
</div>
<!-- // 다른할인 적용 팝업 -->

<!-- NOTICE(s) --><!-- 
<div class="pop_layer pop_type" id="notice">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>FRESH & SPARKLING</h2>
		</div>
		<div class="pop_content">
			div class="notice_pop">
				<dl>
					<dt>※ 웰페어클럽 복지카드 청구할인 안내</dt>
					<dd>
						<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/img_notice_pop.png" alt="">
						<p>해당 월페어클럽 복지카드 2개는<br>주문 시 월페어클럽 복지카드 10% 청구할인 선택 시에만 제휴 가능합니다.<br>그 외 결제는 전액 일반 신용카드 결제가 됩니다.</p>
					</dd>
				</dl>
				<div class="btn_wrap">
					<div class="btn_fix_center">
						<a href="javascript:closeNotice();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">확인</span></a>
					</div>
				</div>

			</div
			<div class="notice_pop v2">
				<div class="img_notice_box">
				
					<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/img_notice_pop2.png" alt="">
				</div>
				<div class="btn_wrap">
					<div class="btn_fix_center">
						<a href="/goods/list?dsp_ctgr=C0201" class="btn btn_mdle btn_blue btn_basic"><span class="btn_txt">사이드디시 보러가기</span></a>
					</div>
				</div>
			</div>
		</div>
		<a href="javascript:closeNotice();" class="btn_ico btn_close">닫기</a>
	</div>
</div> -->

<!-- //NOTICE(e) -->
<!-- LOGGER 환경변수 설정 -->
<script type="text/javascript">
	_TRK_PI = "ODF";	// 웹페이지의 성격 정의 - 주문정보 입력 화면
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
