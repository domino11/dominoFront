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
	var store_no;
	$(document).ready(function() {
		
		$.ajaxSetup({cache:false});
		setBasketCnt();
		$('.sido2').hide();
		$('#region_code_01').show();
		//alert('${sido1}');

		//$(':select option[value=${gugun}]').attr('selected','selected');
		//$(':select option[value=${sido}]').attr('selected','selected');
		
	    <c:if test="${sido1 !=null}">
	    //alert("여기로 들어오나:${sido1}");
	    $('#region_code_01').hide();
	    $('#region_code_${sido1}').show();
	    
	    </c:if>
		// 마이쿠폰 정보 조회(가입회원)
		// 주문&주문트레커 조회(가입회원/인증회원)
	});
	
	
	
	// 가까운 매장 찾기
	function getLocation() {

		
		if (navigator.geolocation) { // GPS를 지원하면
			navigator.geolocation.getCurrentPosition(function(position) {
			var wido = position.coords.latitude;
			var gndo = position.coords.longitude;
			//alert(position.coords.latitude + ' ' + position.coords.longitude);
			//alert(wido + ' ' + gndo);
			alert('위치차이가 다소 있을수도 있습니다.');
			location.href='<c:url value="/branch.pz?"/>xpos='+wido+'&ypos='+gndo+'&slist=1';
			
			
		}, function(error) {
			console.error(error);
		}, {
			enableHighAccuracy: false,
			maximumAge: 0,
			timeout: Infinity
		});
		} else {
			alert('GPS를 지원하지 않습니다');
		}
		
	}
	
	// 매장 상세보기
	function showDetail(no){
		

		$('.detdiv').hide();
		$('#de'+no).show();

		$('#storeview_detail').addClass('open');
		
		location.href= '#storeview_detail';
	}
	// 매장검색
	function findStore() {
		pageNo = 1;
		
		var paramArr = [];
		paramArr[0] = 'pageNo=' + pageNo;
	
		var sido1 = $('.sido1 option:selected').val();
		
	
		
		
//		alert($('.sido2 option[value='+sido2+']').html());
			//var gugun = $('.sido2 option:selected').html();
		var sido = $('#region_code_1 option:selected').val();
		var si = $('#region_code_1 option:selected').text();
		var sido2 = $('#region_code_'+sido+' option:selected').val();
		var gugun = $('#region_code_'+sido+' option:selected').text();
		
		
		//alert(si+"++"+gugun);
		//location.href = "<c:url value='/branch.pz' />?si="+si+"&gugun="+gugun+"&sido1="+sido1+"&sido2="+sido2;
		location.href = "<c:url value='/branch.pz' />?si="+si+"&gugun="+gugun;
		
	}
	
	// 매장 이름으로 검색
	function findStoreName(){
		pageNo = 1;
		
		var paramArr = [];
		paramArr[0] = 'pageNo=' + pageNo;
		
		var sido3 = $('.sido3').val();
		var nameSearch = $('#store_name').val();
		//alert(sido3+":"+nameSearch);
		
		location.href = "<c:url value='/branch.pz' />?nameSearch="+nameSearch;
		
	}
		/* $('#region_code_1').val(si);
		$('#region_code_'+sido+' option:selected').val(gugun); */
		
 		/* if(optn == 'address'){
			if($('#region_code_1').val() == '00'){
				alert('시/도를 선택해주세요.');
				return false;
			}else if($('#region_code_'+sido).val() == ''){
				alert('구/군을 선택해주세요.');
				return false;
			}
			paramArr[1] = 'region_code_'+$('.sido1 option:selected').val()+'=' + $('#region_code_'+sido).val();
			alert(paramArr[1]);
		
		}
		else if(optn == 'name'){
			if($('#name').val().length == 0){
				alert('매장명을 입력해주세요.');
				return false;
			}
			paramArr[1] = 'name=' + encodeURIComponent(encodeURIComponent($('#name').val()));
		}else {
			return false;
		}
			// location.href="/branch.pz?sido1="+sido1+"&sido2="+sido2;
			//location.href="/branch.pz";
			appendBranch(paramArr);
			return true;
			 */
		
		

	
	
	//시/도에 따라 셀렉트 박스에 구/군 목록 노출
	function getRegion() {
		var sido = $('#region_code_1 option:selected').val();
		
		$('.sido2').hide();
		$('#region_code_'+sido).show();
	}
	
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

<script>



function navTabs(thisArea) {
		// 서울 금천구로 셀렉트박스 초기화 후 검색
		var sido = $('#region_code_1 option:selected').val();
		var si = $('#region_code_1 option:selected').text();
		var gugun = $('#region_code_'+sido+' option:selected').text();
		
		
/* 		$('#region_code_1').val('01');
		getRegion(function() {
			$('#region_code_'+sido).val('0122');
			findStore();
		}); */
		findStore();

		$('#div_name_srch').hide();
		$('#div_addr_srch').show();

	$('ul.btn_tab li').removeClass('active');
	$(thisArea).parent().addClass('active');
}



function navname(thisArea){
	//alert("!!");
	
	
	var nametext = $('#store_name').text();
	// 매장명 검색어 초기화
	$('#store_name').val('');

	// 검색 파라미터 설정

	// 서울 중구를 디폴트 목록으로 노출

	$('#div_addr_srch').hide();
	$('#div_name_srch').show();
	

$('ul.btn_tab li').removeClass('active');
$(thisArea).parent().addClass('active');


	
}
</script>



</head>
<body>

<script>
$(function(){
	$("map").mouseenter(function(){
	$(".mapcontent").parent().parent().css("background","rgba(255,255,255,0)");
	$(".mapcontent").parent().parent().css("height","1px");
	$(".mapcontent").parent().parent().css("border","none");
//	alert($(".mapcontent").parent().parent().css("background"));
	});
});

</script>


	<!-- top_event_bnr -->
	<div class="top_bnr top_event"   id="lineBanner">
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
		
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/gcenmaps/gcenmap.js"></script><script type="text/javascript">
var pageNo = 1;
	/* st_xpos = '37.4783093' * 1.0,
	st_ypos = '126.89102460000004' * 1.0,
	map; */

var largeMap,
	detailMap;
	
/* 	특별할인
window.onload = function() {
	// 특별 할인 레이어팝업 html 생성
	// iframe 불러오는 데에 오래 걸려서 시/도, 구/군 셀렉트 박스 옵션 값이 공백으로 나오는 현상 발생하여 onload로 위치 옮김.
	$('#popup_promotion').html("<iframe src='/branch/lsmLayer' width='100%' height='100%' frameborder='0'></iframe>");
};
 */
$(function() {
	initMaps(st_xpos, st_ypos);	// 전체 매장 지도 표시
	/*
		다른 페이지로 이동했다가 뒤로 가기로 해당 페이지 접근 시,
		시/도 구분 없어서 매장 리스트 못 불러오는 현상 때문에 추가
	*/
	if($('#region_code_1').val() == ""){
		$('#region_code_1').val('01');
		getRegion(function() {
			$('#region_code_01').val('0122');
			findBranch('address');	// 주소로 검색한 목록 호출
		});
	}else{
		findBranch('address');	// 주소로 검색한 목록 호출
		
	}

	$('#name').on('keydown', function(key) {
		if(key.keyCode == 13) {
			findBranch('name');
		}
	});

	
});


//매장 찾기 검색 영역 탭 변경
//@param		optn	주소로 검색(address), 매장명 검색(name) 구분 값
//@thisArea

/*  function getRegion(callbackFunc) {
 	if ($('#region_code_1').val() == '') return;
 	if ($('#region_code_1').val() == '01'){
		var htmlStr = '<option value="">구/군</option>'; 
		
 	}

 	$.ajax({
		url: '/branch/regionSubListAjax',
		data: { region_code_1 : $('#region_code_1').val()},
		type: 'get',
		dataType: 'json',
		success: function(data) {
			if (data.status == 'success') {
				var htmlStr = '<option value="">구/군</option>';
				$.each(data.resultData, function(index, addrObj) {
					htmlStr += '<option value="'+ addrObj.region_code_2 +'">'+ addrObj.region_sub_nm +'</option>';
				});

				$('#region_code_2').html(htmlStr);
			} else {
				alert(data.msg);
			}

			if (typeof callbackFunc === 'function') {
		        callbackFunc();
		    }
		},
		error: function() {
			// alert('처리도중 오류가 발생했습니다.');
		}
	});  
 
}  */


//레이어 팝업 열기
//@param	optn	특별 할인(promotion), 매장지도 전체보기(detail_map), 매장 상세보기(detail_view) 구분 값
/* function openLayerPopup(optn) {
		
	 if (optn == 'promotion') {
 		$('html, body').css({'overflow-y': 'hidden', 'height' : '100%'});
		$('#popup_promotion').addClass('open');
	} else

		
	if (optn == 'detail_map') {
		if (largeMap.markerList.length == 0) {
			markAllBranchs();
		}

		$('#storeview_map').addClass('open');
		location.href = '#storeview_map';

		// 매장 찾기 목록의 첫번째 매장을 중심점으로 잡음.
 		if ($(map.markerLayer).find('.marker_box').length > 0) {
			var map_st_xpos = $(map.markerLayer).find('.marker_box').find('.marker_info').data('st_ypos');
			var map_st_ypos = $(map.markerLayer).find('.marker_box').find('.marker_info').data('st_xpos');
			largeMap.setCenter(map_st_ypos, map_st_xpos, 13);
		} else {
			largeMap.setZoomLevel(13);
		}
 
		// 지도가 여러개일 경우, addMarker 후 레이어 팝업 띄우면 지도와 마커게 보이지 않는 현상 발생. -> 레이어 팝업 띄운 후에 지도와 마커를 다시 불러와야 함.
		largeMap.reloadMarker();
		largeMap.redrawMap();

	} else if (optn == 'detail_view') {
		$('#storeview_detail').addClass('open');
		location.href = '#storeview_detail';
	}
} */

function closeLayer() {
 	$('html, body').css('overflow-y', '');
	$('#popup_promotion').removeClass('open');
};

//지도 초기화
function initMaps(param_st_xpos, param_st_ypos) {
	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 																																		
	    mapOption = {
	        center: new daum.maps.LatLng(${centerX}, ${centerY}), // 지도의 중심좌표
	        level: ${mapsize}, // 지도의 확대 레벨
	        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
	// 메인 지도  (전체 매장)
/* 	map = new gcen.api.maps.Map(document.getElementById("map_canvas"), "https://dmap.gcen.co.kr/dmap201702/tile.png", mapOptions);
	map.setActionControl("markerclick"); // 지도 제어를 마커클릭을 바꿈 */
	//map.levelBarShow(); // 레벨바 보여주기 -> 레벨바를 생성하면 id로 이벤트가 동작하게 되어있어서 3개의 맵에 대해서 적용이 불가능함 

	// 확대보기 지도 (전체 매장)
	largeMap = new gcen.api.maps.Map(document.getElementById("map_large_canvas"), "https://dmap.gcen.co.kr/dmap201702/tile.png", mapOptions);
	largeMap.setActionControl("markerclick"); // 지도 제어를 마커클릭을 바꿈
	//largeMap.levelBarShow();

	// 상세보기 지도 (매장 1개에 대한 지도 표시)
	/* detailMap = new gcen.api.maps.Map(document.getElementById("map_detail_canvas"), "https://dmap.gcen.co.kr/dmap201702/tile.png", mapOptions); */
	detailMap = new daum.maps.Map(document.getElementById("map_detail_canvas"), "//dapi.kakao.com/v2/maps/sdk.js?appkey=d2da6f30f4df7d35993f892c831fc0ee", mapOptions);
	detailMap.setActionControl("markerclick"); // 지도 제어를 마커클릭을 바꿈
	//detailMap.levelBarShow();
}




/*
 특별할인X
 
 특별할인 진행 매장 찾기.
function schAllPrmt() {
	$('#region_code_1, #region_code_2, #branch_name').val('');
	$('#schPrmt').addClass('active');	// 특별 프로모션

	var paramArr = [];
	paramArr[0] = 'pageNo=1';
	paramArr[1] = 'schAllPrmt=Y';
	appendBranch(paramArr);
}

// 특별 프로모션 on/off 버튼 토글 및 검색
function toggleSpclPrmtn(thisArea) {
	$(thisArea).toggleClass('active');

	// 검색어가 올바르지 않을 경우, 특별 프로모션 검색 기능 동작 안함
	var schGubun = $('ul.btn_tab > li.active').data('val');
	var result = findBranch(schGubun);
	if (!result) {
		$(thisArea).toggleClass('active');
	}
} */

//지도 객체에 마커 위치 설정하기.
//@param mapObj			마커 추가할 지도 객체
//@param branchObj		매장 상세 정보
//@param detailBtnYn	상세보기 버튼 노출 유무
/* function addMarker(mapObj, branchObj, detailBtnYn) {
	할인 X
	var onSale = branchObj.wrapp_sales;
	var offSale = (!!!branchObj.off_wrapp_sale) ? onSale : branchObj.off_wrapp_sale;
 
	// 마커 정보창 설정
	var infoDiv = '<c:forEach items="${shoplist }" var="shoplist" varStatus="loop">';
	infoDiv += '<div class="marker_info" data-gmapx="'+st_xpos+'" data-gmapy="'+st_ypos+'" style="display: none;">';
	infoDiv += '<strong>' + ${shoplist.st_name} + '</strong>'
		
			+'<div>'
			+'	<ul>'
			+'		<li>온라인 방문포장 '+ onSale +'%</li>'
			+'		<li>오프라인 방문포장 '+ offSale +'%</li>'
			+'	</ul>'
			+'</div>';
			 
	if (detailBtnYn) {
		infoDiv += '<div class="btn_wrap">'
		+'	<div class="btn_fix_rgt">'
		+'		<a href="javascript:openDetailPop(\'' + ${shoplist.st_no} + '\');" class="btn"><span class="btn_txt">상세보기</span></a>'
		+'	</div>'
		+'</div>';
	}
	infoDiv += '</div>';
	infoDiv += '</c:forEach>';

	// 마커 클릭 이벤트 등록
	var branchMarker = new gcen.api.maps.Marker(branchObj.st_ypos, branchObj.st_xpos, markerImg, 77, 68); // 마커생성
	$(branchMarker.markerbox).append(infoDiv);
	branchMarker.attach('click', function() {
		var markerboxObj = this.markerbox;
		if ($(markerboxObj).find('.marker_info').is(":visible")) {
			// 다시 핀 선택 시, 정보창 닫음
			$(markerboxObj).find('.marker_info').hide();
		} else {
			// 핀 선택 시, 다른 매장 정보 창 닫고 해당 핀에 대한 정보창 노출
			$(markerboxObj).parent().find('.marker_info').hide();
			$(markerboxObj).find('.marker_info').show();
		}
	});

	mapObj.addMarker(branchMarker); // 메인 지도에 마커 추가
} */

//모든 매장 지도 표시
function markAllBranchs() {
	largeMap.clearMarkers();

	$.ajax({
		url: '/branch/allListAjax',
		type: 'get',
		dataType: 'json',
		async: false,
		success: function(data) {
			$.each(jQuery.parseJSON(data.resultData.positionListStr), function(index, branch) {
				addMarker(largeMap, branch, true);	// 확대 보기 지도에 마커 추가
			});
		}
	});
}



//매장 찾기
//@param optn	주소로 검색(address), 매장명 검색(name) 구분 값
function findBranch(optn) {
	if (!!!optn) return false;

	// 검색 시 페이지 번호 초기화
	pageNo = 1;

	// 검색 파라미터 설정
	var paramArr = [];
	paramArr[0] = 'pageNo=' + pageNo;

	if (optn == 'address') {
		if ($('#region_code_1').val() == '') {
			alert('시/도를 선택해주세요.');
			return false;
		} else if ($('#region_code_2').val() == '') {
			alert('구/군을 선택해주세요.');
			return false;
		}

		paramArr[1] = 'region_code_2=' + $('#region_code_2').val();
	} else if (optn == 'name') {
		if ($('#store_name').val().length == 0) {
			alert('매장명을 입력해주세요.');
			return false;
		}

		paramArr[1] = 'name=' + encodeURIComponent(encodeURIComponent($('#store_name').val()));
	} else {
		return false;
	}

	appendBranch(paramArr);

	return true;
}


//상세 보기 레이어 팝업 열기
function openDetailPop(st_no) {
	$.ajax({
		url: '/branch/detail',
		data: { st_no : st_no},
		type: 'get',
		dataType: 'json',
		success: function(data) {
			if (data.status == 'success') {
				var contentsList = data.resultData.contents;
				var branch = data.resultData.detail[0];


				var address = '';
				if (branch.road_addr_ba != null) {
					address = branch.road_addr_ba + ((!!branch.road_addr_de) ? ' ' + branch.road_addr_de : '');
				} else if (branch.addr_ba != null) {
					address = branch.addr_ba + ((!!branch.addr_de) ? ' ' + branch.addr_de : '');
				}

				var businessHours = '';
				if (branch.branch_code == '86614') {// 강원 평창군 알펜시아점
					businessHours = '평일 11:00~21:00 / 주말 11:00~22:00';
				} else {
					businessHours = branch.trade_start + ' ~ ' + branch.trade_end;
				}

				var onSale = branch.wrapp_sales,
				offSale = (!!!branch.off_wrapp_sale) ? onSale : branch.off_wrapp_sale;

				var photosHtml = '',
					photoUrl;
				if (!!branch.branchphoto1) {
					photoUrl = 'https://cdn.dominos.co.kr/admin/upload/store/' + branch.branchphoto1;
					photosHtml += '<li><a href="#"><img src="'+ photoUrl +'" alt=""></a></li>';
				}
				if (!!branch.branchphoto2) {
					photoUrl = 'https://cdn.dominos.co.kr/admin/upload/store/' + branch.branchphoto2;
					photosHtml += '<li><a href="#"><img src="'+ photoUrl +'" alt=""></a></li>';
				}
				if (!!branch.branchphoto3) {
					photoUrl = 'https://cdn.dominos.co.kr/admin/upload/store/' + branch.branchphoto3;
					photosHtml += '<li><a href="#"><img src="'+ photoUrl +'" alt=""></a></li>';
				}

				if (branch.lsm != "") {
					var saleInfoArr = (branch.lsm).split('^');
					var saleInfoStr = '';
					for (var i=0; i<saleInfoArr.length ; i++) {
						if (i > 0) saleInfoStr += '<br />';
						saleInfoStr += saleInfoArr[i];
					}

					$('#detail_sale_info').html(saleInfoStr);
					$('#detail_sale_info').parent().show();
				} else {
					$('#detail_sale_info').parent().hide();
					$('#detail_sale_info').html('');
				}

				$('#detail_photos').html(photosHtml);
				$('#detail_off_sale').html(offSale);
				$('#detail_on_sale').html(onSale);
				$('#detail_name').text('도미노피자 ' + branch.branch_name);
				$("#detail_basket_wrapp").attr('href', 'javascript:goBasketWrapp("'+branch.branch_code+'")');


				$('#detail_tel').text(branch.tel);
				$('#detail_address').text(st_addr);
				$('#detail_business_hours').text(businessHours);
				if (!!branch.locinfo) {
					$('#detail_location_info').html(branch.locinfo);
				}else{
					$('#detail_location_info').html("");
				}
				if (!!branch.parking) {
					$('#detail_parking_info').html(branch.parking);
				}else{
					$('#detail_parking_info').html("");
				}

				// notice&event 영역
				var contentsHtml = '';
				$.each(contentsList, function (index, contents) {
					if (index > 0) {
						contentsHtml += ' ';
					}
					contentsHtml += contents.contents;
				});

				$('#detail_notice').text(contentsHtml);
				if (contentsHtml == '') {
					$('#detail_notice').parent().parent().hide();
				} else {
					$('#detail_notice').parent().parent().show();
				}

				// 레이어 팝업 열기
				if(branch.branch_code == "86508"){
					alert('"청담점 + 삼성점 합병운영 안내"\n2017.08.21(월)부터 기존 도미노피자 청담점 포장고객 도미노피자 삼성점으로 이용 부탁드립니다.');
					location.href = "/main";
				}else{
					openLayerPopup('detail_view');

					detailMap.clearMarkers();
					addMarker(detailMap, branch, false);	// 지도에 마커 추가
					detailMap.setCenter(st_ypos, st_xpos, 14);
				}
			}
		},
		error: function() {
			// alert('처리도중 오류가 발생했습니다.');
		}
	});
}

//매장 정보 조회 후 html 그리기
//@param	paramArr	 검색을 위한 파라미터(필수)
/* function appendBranch(paramArr) {
	if (paramArr == null || paramArr.length == 0) return;

	if($('#schPrmt').hasClass('active'))
		paramArr[paramArr.length] = 'schPrmt=Y';

	$.ajax({
		url: '/branch/listAjax',
		data: paramArr.join('&'),
		type: 'get',
		dataType: 'json',
		async: false,
		success: function(data) {
			if (data.status == 'success') {
				var branchList = data.resultData.branchList,
					totalCount = data.resultData.totalCount,
					htmlStr = '';

				if (pageNo == 1) {
					// 전체 목록 개수
					$('#em_total_count').text(totalCount);

					// redraw marker
					map.clearMarkers();
				}

				if (totalCount == 0) {
					$('#div_has_result').hide();
					$('#div_no_result').show(); // 매장검색 결과가 존재하지 않습니다.
				} else {
					$('#div_no_result').hide();
					$('#div_has_result').show();

					$.each(branchList, function(index, branch) {

						// 지도에 마커 표시.
						addMarker(map, branch, true);

						// 매장 목록 html
						var address = '';
						if (branch.road_addr_ba != null) {
							address = branch.road_addr_ba + ((!!branch.road_addr_de) ? ' ' + branch.road_addr_de : '');
						} else if (branch.addr_ba != null) {
							address = branch.addr_ba + ((!!branch.addr_de) ? ' ' + branch.addr_de : '');
						}
 						할인 X
						var onSale = branch.wrapp_sales,
							offSale = (!!!branch.off_wrapp_sale) ? onSale : branch.off_wrapp_sale;
 
						htmlStr += '<li>';
						htmlStr += '	<div class="shopcard">';
						htmlStr += '	<c:forEach items="${shoplist }" var="shoplist" varStatus="loop">';
						htmlStr += '		<div class="shopcard_content">';
						
 						방문포장할인 X
						htmlStr += '			<div class="shopcard_tag">';
						htmlStr += '				<div class="store_tag online_tag">';
						htmlStr += '					<p class="tag_title">방문포장</p>';
						htmlStr += '					<span class="tag_info">ON<br>LINE</span>';
						htmlStr += '					<span class="tag_sale">'+onSale+'<em>%</em></span>';
						htmlStr += '				</div>';
						htmlStr += '				<div class="store_tag offline_tag">';
						htmlStr += '					<p class="tag_title">방문포장</p>';
						htmlStr += '					<span class="tag_info">OFF<br>LINE</span>';
						htmlStr += '					<span class="tag_sale">'+offSale+'<em>%</em></span>';
						htmlStr += '				</div>';
						htmlStr += '			</div>'; 
						
						htmlStr += '			<p class="title">'+ ${shoplist.st_name} +'</p>';
						htmlStr += '			<p class="address">'+ ${shoplist.st_addr} +'</p>';
						//htmlStr += '			<p class="distance">15 KM</p>';
						htmlStr += '			<p class="phone_num"><span class="ico ico_s_phone"></span>'+ ${shoplist.st_tel} +'</p>';
						htmlStr += '			<div class="btn_box">';
						htmlStr += '				<a href="#none" onclick="openDetailPop('+ ${shoplist.st_no} +');" class="btn"><span class="btn_txt">상세보기</span></a>';
 						htmlStr += '				<a href="javascript:goBasketWrapp('+branch.branch_code+');" class="btn btn_red"><span class="btn_txt">방문포장</span></a>'; 
						htmlStr += '			</div>';
						htmlStr += '		</c:forEach>';						
						htmlStr += '		</div>';

						if (branch.lsm != null && branch.lsm.length > 0) {
							var lsmArr = branch.lsm.split('^'),
								lsmStr = '';

							for (var i=0; i<lsmArr.length ; i++) {
								lsmStr += '<li>' + lsmArr[i] + '</li>';
							}

							htmlStr += '		<div class="shopcard_bottom">';
							htmlStr += '			<p class="sale_txt">특별할인</p>';
							htmlStr += '			<ul class="sale_list">';
							htmlStr += lsmStr;
							htmlStr += '			</ul>';
							htmlStr += '		</div>';
						}

						htmlStr += '	</div>';
						htmlStr += '</li>';
					});
				}

				if (pageNo == 1) {
					$('#ul_shop_list').html(htmlStr);

					if (totalCount > 0) {
						// 검색 결과 첫번째 매장을 지도에 표시
						map.setCenter(branchList[0].st_ypos, branchList[0].st_xpos, 13);
					}
				} else {
					$('#ul_shop_list').append(htmlStr);
				}

				var navi = data.resultData.navi;
				if (navi.pageNo < navi.lastPageNo && navi.lastPageNo > 1) { // ajax 더보기 기능
					document.getElementById('ul_shop_list').onscroll = function() {
						if ($(this)[0].scrollHeight - $(this)[0].scrollTop == $(this).outerHeight()) {
							var pageNoIndex = paramArr.indexOf('pageNo=' + pageNo);
							if (pageNoIndex > -1) {
								++pageNo;
								paramArr[pageNoIndex] = 'pageNo=' + pageNo;
							}

							appendBranch(paramArr);
						}
					};
				} else if (navi.pageNo != 1) { // 페이징 기능 멈춤.
					document.getElementById('ul_shop_list').onscroll = null;
				}
			}

		},
		error: function(a, b, c) {
			// console.log(a);
			// console.log(b);
			// console.log(c);
		}
	});
}
 */
function goBasketWrapp(branch_no) {
		/* if(!confirm("로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?")) {
			return;
		}
		
		location.href = "/delivery/branchWrappProc?branch_code="+branch_code; */

}

</script>

<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="store">
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="<c:url value='/Pizza/MainPage.pz'/>">HOME</a></li>
				<li><span>매장찾기</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>매장찾기</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="tab_type">
			<ul class="btn_tab">
				<c:if test="${names==null || names!=1 }">
					<li class="active" data-val="address"><a href="#"
						onclick="navTabs(this); return false;">주소로 검색</a></li>
					<li data-val="name"><a href="#"
						onclick="navname(this); return false;">매장명 검색</a></li>
				</c:if>

				<c:if test="${!(names==null || names!=1 )}">
					<li data-val="address"><a href="#"
						onclick="navTabs(this); return false;">주소로 검색</a></li>
					<li class="active" data-val="name"><a href="#"
						onclick="navname(this); return false;">매장명 검색</a></li>
				</c:if>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">
				<!-- form_container 여기에 넣기 -->
				
				
									<div class="form_container">
					
					
						<!-- 주소로 찾기 검색 영역 -->
					<c:if test="${names==null || names!=1 }" var="named" >
						<div class="form_group selbox" id="div_addr_srch">
					</c:if>
					<c:if test="${!named }">
						<div class="form_group selbox" id="div_addr_srch" style="display:none; " >
					</c:if>
							<!-- form_field 이 줄 이하로 넣기 -->
							<div class="form_field">
								<div class="sel_box">
									<select class="sido1" id="region_code_1" onchange="getRegion();">
										<option value="00" >시/도</option>
										<option value="01" <c:if test="${requestScope.si=='서울' }">selected </c:if>>서울</option>
										<option value="02" <c:if test="${requestScope.si=='인천' }">selected </c:if>>인천</option>
										<option value="03" <c:if test="${requestScope.si=='경기' }">selected </c:if>>경기</option>
										<option value="04" <c:if test="${requestScope.si=='강원' }">selected </c:if>>강원</option>
										<option value="05" <c:if test="${requestScope.si=='충남' }">selected </c:if>>충남</option>
										<option value="06" <c:if test="${requestScope.si=='충북' }">selected </c:if>>충북</option>
										<option value="07" <c:if test="${requestScope.si=='대전' }">selected </c:if>>대전</option>
										<option value="08" <c:if test="${requestScope.si=='경남' }">selected </c:if>>경남</option>
										<option value="09" <c:if test="${requestScope.si=='경북' }">selected </c:if>>경북</option>
										<option value="10" <c:if test="${requestScope.si=='대구' }">selected </c:if>>대구</option>
										<option value="11" <c:if test="${requestScope.si=='전남' }">selected </c:if>>전남</option>
										<option value="12" <c:if test="${requestScope.si=='전북' }">selected </c:if>>전북</option>
										<option value="13" <c:if test="${requestScope.si=='광주' }">selected </c:if>>광주</option>
										<option value="14" <c:if test="${requestScope.si=='울산' }">selected </c:if>>울산</option>
										<option value="15" <c:if test="${requestScope.si=='부산' }">selected </c:if>>부산</option>
										<option value="16" <c:if test="${requestScope.si=='제주' }">selected </c:if>>제주</option>
										<option value="17" <c:if test="${requestScope.si=='세종특별자치시' }">selected </c:if>>세종특별자치시</option>
									</select>
								</div>
							</div>
							
							<div class="form_field">
								<div class="sel_box">
									<select class="sido2" id="region_code_00">
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected</c:if>>구/군</option>								
									</select>
									
									<select class="sido2" id="region_code_01" >
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>
										<option value="0111" <c:if test="${requestScope.gugun=='강남구' }">selected </c:if>>강남구</option>
										<option value="0110" <c:if test="${requestScope.gugun=='강동구' }">selected </c:if>>강동구</option>
										<option value="0117" <c:if test="${requestScope.gugun=='강북구' }">selected </c:if>>강북구</option>
										<option value="0124" <c:if test="${requestScope.gugun=='강서구' }">selected </c:if>>강서구</option>
										<option value="0120" <c:if test="${requestScope.gugun=='관악구' }">selected </c:if>>관악구</option>
										<option value="0118" <c:if test="${requestScope.gugun=='광진구' }">selected </c:if>>광진구</option>
										<option value="0121" <c:if test="${requestScope.gugun=='구로구' }">selected </c:if>>구로구</option>
										<option value="0122" <c:if test="${requestScope.gugun=='금천구' }">selected</c:if>>금천구</option>
										<option value="0115" <c:if test="${requestScope.gugun=='노원구' }">selected </c:if>>노원구</option>
										<option value="0108" <c:if test="${requestScope.gugun=='도봉구' }">selected </c:if>>도봉구</option>
										<option value="0106" <c:if test="${requestScope.gugun=='동대문구'}">selected </c:if>>동대문구</option>
										<option value="0123" <c:if test="${requestScope.gugun=='동작구' }">selected </c:if>>동작구</option>
										<option value="0104" <c:if test="${requestScope.gugun=='마포구' }">selected </c:if>>마포구</option>
										<option value="0103" <c:if test="${requestScope.gugun=='서대문구'}">selected </c:if>>서대문구</option>
										<option value="0113" <c:if test="${requestScope.gugun=='서초구' }">selected </c:if>>서초구</option>
										<option value="0109" <c:if test="${requestScope.gugun=='성동구' }">selected </c:if>>성동구</option>
										<option value="0112" <c:if test="${requestScope.gugun=='성북구' }">selected </c:if>>성북구</option>
										<option value="0114" <c:if test="${requestScope.gugun=='송파구' }">selected </c:if>>송파구</option>
										<option value="0125" <c:if test="${requestScope.gugun=='양천구' }">selected </c:if>>양천구</option>
										<option value="0119" <c:if test="${requestScope.gugun=='영등포구'}">selected </c:if>>영등포구</option>
										<option value="0116" <c:if test="${requestScope.gugun=='용산구'}">selected </c:if>>용산구</option>
										<option value="0105" <c:if test="${requestScope.gugun=='은평구'}">selected </c:if>>은평구</option>
										<option value="0102" <c:if test="${requestScope.gugun=='종로구'}">selected </c:if>>종로구</option>
										<option value="0101" <c:if test="${requestScope.gugun=='중구' }">selected </c:if>>중구</option>
										<option value="0107" <c:if test="${requestScope.gugun=='중랑구'}">selected </c:if>>중랑구</option>
									</select>
									
									<select class="sido2" id="region_code_02" >
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>
										<option value="0202" <c:if test="${requestScope.gugun=='0202' }">selected </c:if>>계양구</option>
										<option value="0203" <c:if test="${requestScope.gugun=='남구' }">selected </c:if>>남구</option>
										<option value="0204" <c:if test="${requestScope.gugun=='남동구' }">selected </c:if>>남동구</option>
										<option value="0206" <c:if test="${requestScope.gugun=='부평구' }">selected </c:if>>부평구</option>
										<option value="0207" <c:if test="${requestScope.gugun=='서구' }">selected </c:if>>서구</option>
										<option value="0208" <c:if test="${requestScope.gugun=='연수구' }">selected </c:if>>연수구</option>
										<option value="0210" <c:if test="${requestScope.gugun=='중구' }">selected </c:if>>중구</option>
									</select>
									<select class="sido2" id="region_code_03">
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>									
										<option value="0301" <c:if test="${requestScope.gugun=='고양시' }">selected </c:if>>고양시</option>
										<option value="0302" <c:if test="${requestScope.gugun=='과천시' }">selected </c:if>>과천시</option>
										<option value="0303" <c:if test="${requestScope.gugun=='광명시' }">selected </c:if>>광명시</option>
										<option value="0304" <c:if test="${requestScope.gugun=='광주시' }">selected </c:if>>광주시</option>
										<option value="0305" <c:if test="${requestScope.gugun=='구리시' }">selected </c:if>>구리시</option>
										<option value="0306" <c:if test="${requestScope.gugun=='군포시' }">selected </c:if>>군포시</option>
										<option value="0307" <c:if test="${requestScope.gugun=='김포시' }">selected </c:if>>김포시</option>
										<option value="0308" <c:if test="${requestScope.gugun=='남양주시' }">selected </c:if>>남양주시</option>
										<option value="0309" <c:if test="${requestScope.gugun=='동두천시' }">selected </c:if>>동두천시</option>
										<option value="0310" <c:if test="${requestScope.gugun=='부천시' }">selected </c:if>>부천시</option>
										<option value="0311" <c:if test="${requestScope.gugun=='성남시' }">selected </c:if>>성남시</option>
										<option value="0312" <c:if test="${requestScope.gugun=='수원시' }">selected </c:if>>수원시</option>
										<option value="0313" <c:if test="${requestScope.gugun=='시흥시' }">selected </c:if>>시흥시</option>
										<option value="0314" <c:if test="${requestScope.gugun=='안산시' }">selected </c:if>>안산시</option>
										<option value="0315" <c:if test="${requestScope.gugun=='안성시' }">selected </c:if>>안성시</option>
										<option value="0316" <c:if test="${requestScope.gugun=='안양시' }">selected </c:if>>안양시</option>
										<option value="0327" <c:if test="${requestScope.gugun=='양주시' }">selected </c:if>>양주시</option>
										<option value="0317" <c:if test="${requestScope.gugun=='양평군' }">selected </c:if>>양평군</option>
										<option value="0318" <c:if test="${requestScope.gugun=='여주군' }">selected </c:if>>여주군</option>
										<option value="0320" <c:if test="${requestScope.gugun=='오산시' }">selected </c:if>>오산시</option>
										<option value="0321" <c:if test="${requestScope.gugun=='용인시' }">selected </c:if>>용인시</option>
										<option value="0322" <c:if test="${requestScope.gugun=='의왕시' }">selected </c:if>>의왕시</option>
										<option value="0323" <c:if test="${requestScope.gugun=='의정부시' }">selected </c:if>>의정부시</option>
										<option value="0324" <c:if test="${requestScope.gugun=='이천시' }">selected </c:if>>이천시</option>
										<option value="0325" <c:if test="${requestScope.gugun=='파주시' }">selected </c:if>>파주시</option>
										<option value="0328" <c:if test="${requestScope.gugun=='평택시' }">selected </c:if>>평택시</option>
										<option value="0329" <c:if test="${requestScope.gugun=='포천시' }">selected </c:if>>포천시</option>
										<option value="0330" <c:if test="${requestScope.gugun=='하남시' }">selected </c:if>>하남시</option>
										<option value="0331" <c:if test="${requestScope.gugun=='화성시' }">selected </c:if>>화성시</option>
									</select>
									<select class="sido2" id="region_code_04">
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>																			
										<option value="0401" <c:if test="${requestScope.gugun=='강릉시' }">selected </c:if>>강릉시</option>
										<option value="0403" <c:if test="${requestScope.gugun=='동해시' }">selected </c:if>>동해시</option>
										<option value="0404" <c:if test="${requestScope.gugun=='삼척시' }">selected </c:if>>삼척시</option>
										<option value="0405" <c:if test="${requestScope.gugun=='속초시' }">selected </c:if>>속초시</option>
										<option value="0408" <c:if test="${requestScope.gugun=='영월군' }">selected </c:if>>영월군</option>
										<option value="0409" <c:if test="${requestScope.gugun=='원주시' }">selected </c:if>>원주시</option>
										<option value="0410" <c:if test="${requestScope.gugun=='인제군' }">selected </c:if>>인제군</option>
										<option value="0411" <c:if test="${requestScope.gugun=='정선군' }">selected </c:if>>정선군</option>
										<option value="0412" <c:if test="${requestScope.gugun=='철원군' }">selected </c:if>>철원군</option>
										<option value="0413" <c:if test="${requestScope.gugun=='춘천시' }">selected </c:if>>춘천시</option>
										<option value="0414" <c:if test="${requestScope.gugun=='태백시' }">selected </c:if>>태백시</option>
										<option value="0415" <c:if test="${requestScope.gugun=='평창군' }">selected </c:if>>평창군</option>
										<option value="0416" <c:if test="${requestScope.gugun=='홍천군' }">selected </c:if>>홍천군</option>
										<option value="0418" <c:if test="${requestScope.gugun=='횡성군' }">selected </c:if>>횡성군</option>
									</select>
									<select class="sido2" id="region_code_05">
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>									
										<option value="0501" <c:if test="${requestScope.gugun=='계룡시' }">selected </c:if>>계룡시</option>
										<option value="0502" <c:if test="${requestScope.gugun=='공주시' }">selected </c:if>>공주시</option>
										<option value="0504" <c:if test="${requestScope.gugun=='논산시' }">selected </c:if>>논산시</option>
										<option value="0505" <c:if test="${requestScope.gugun=='당진군' }">selected </c:if>>당진군</option>
										<option value="0506" <c:if test="${requestScope.gugun=='보령시' }">selected </c:if>>보령시</option>
										<option value="0508" <c:if test="${requestScope.gugun=='서산시' }">selected </c:if>>서산시</option>
										<option value="0510" <c:if test="${requestScope.gugun=='아산시' }">selected </c:if>>아산시</option>
										<option value="0513" <c:if test="${requestScope.gugun=='천안시' }">selected </c:if>>천안시</option>
										<option value="0516" <c:if test="${requestScope.gugun=='홍성군' }">selected </c:if>>홍성군</option>
									</select>
									<select class="sido2" id="region_code_06">	
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>										
										<option value="0606" <c:if test="${requestScope.gugun=='음성군' }">selected </c:if>>음성군</option>
										<option value="0607" <c:if test="${requestScope.gugun=='제천시' }">selected </c:if>>제천시</option>
										<option value="0608" <c:if test="${requestScope.gugun=='증평군' }">selected </c:if>>증평군</option>
										<option value="0610" <c:if test="${requestScope.gugun=='청원군' }">selected </c:if>>청원군</option>
										<option value="0611" <c:if test="${requestScope.gugun=='청주시' }">selected </c:if>>청주시</option>
										<option value="0612" <c:if test="${requestScope.gugun=='충주시' }">selected </c:if>>충주시</option>
									</select>
									<select class="sido2" id="region_code_07">	
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>										
										<option value="0701" <c:if test="${requestScope.gugun=='대덕구' }">selected </c:if>>대덕구</option>
										<option value="0702" <c:if test="${requestScope.gugun=='동구' }">selected </c:if>>동구</option>
										<option value="0703" <c:if test="${requestScope.gugun=='서구' }">selected </c:if>>서구</option>
										<option value="0704" <c:if test="${requestScope.gugun=='유성구' }">selected </c:if>>유성구</option>
										<option value="0705" <c:if test="${requestScope.gugun=='중구' }">selected </c:if>>중구</option>
									</select>
									<select class="sido2" id="region_code_08">	
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>										
										<option value="0801" <c:if test="${requestScope.gugun=='거제시' }">selected </c:if>>거제시</option>
										<option value="0802" <c:if test="${requestScope.gugun=='거창군' }">selected </c:if>>거창군</option>
										<option value="0804" <c:if test="${requestScope.gugun=='김해시' }">selected </c:if>>김해시</option>
										<option value="0806" <c:if test="${requestScope.gugun=='마산시' }">selected </c:if>>마산시</option>
										<option value="0807" <c:if test="${requestScope.gugun=='밀양시' }">selected </c:if>>밀양시</option>
										<option value="0808" <c:if test="${requestScope.gugun=='사천시' }">selected </c:if>>사천시</option>
										<option value="0810" <c:if test="${requestScope.gugun=='양산시' }">selected </c:if>>양산시</option>
										<option value="0812" <c:if test="${requestScope.gugun=='진주시' }">selected </c:if>>진주시</option>
										<option value="0813" <c:if test="${requestScope.gugun=='진해시' }">selected </c:if>>진해시</option>
										<option value="0815" <c:if test="${requestScope.gugun=='창원시' }">selected </c:if>>창원시</option>
										<option value="0816" <c:if test="${requestScope.gugun=='통영시' }">selected </c:if>>통영시</option>
									</select>
									<select class="sido2" id="region_code_09">
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>											
										<option value="0901" <c:if test="${requestScope.gugun=='경산시' }">selected </c:if>>경산시</option>
										<option value="0902" <c:if test="${requestScope.gugun=='경주시' }">selected </c:if>>경주시</option>
										<option value="0904" <c:if test="${requestScope.gugun=='구미시' }">selected </c:if>>구미시</option>
										<option value="0906" <c:if test="${requestScope.gugun=='김천시' }">selected </c:if>>김천시</option>
										<option value="0907" <c:if test="${requestScope.gugun=='문경시' }">selected </c:if>>문경시</option>
										<option value="0909" <c:if test="${requestScope.gugun=='상주시' }">selected </c:if>>상주시</option>
										<option value="0911" <c:if test="${requestScope.gugun=='안동시' }">selected </c:if>>안동시</option>
										<option value="0914" <c:if test="${requestScope.gugun=='영주시' }">selected </c:if>>영주시</option>
										<option value="0915" <c:if test="${requestScope.gugun=='영천시' }">selected </c:if>>영천시</option>
										<option value="0922" <c:if test="${requestScope.gugun=='칠곡군' }">selected </c:if>>칠곡군</option>
										<option value="0923" <c:if test="${requestScope.gugun=='포항시' }">selected </c:if>>포항시</option>
									</select>
									<select class="sido2" id="region_code_10">	
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>										
										<option value="1001" <c:if test="${requestScope.gugun=='남구' }">selected </c:if>>남구</option>
										<option value="1002" <c:if test="${requestScope.gugun=='달서구' }">selected </c:if>>달서구</option>
										<option value="1003" <c:if test="${requestScope.gugun=='달성군' }">selected </c:if>>달성군</option>
										<option value="1004" <c:if test="${requestScope.gugun=='동구' }">selected </c:if>>동구</option>
										<option value="1005" <c:if test="${requestScope.gugun=='북구' }">selected </c:if>>북구</option>
										<option value="1007" <c:if test="${requestScope.gugun=='수성구' }">selected </c:if>>수성구</option>
										<option value="1008" <c:if test="${requestScope.gugun=='중구' }">selected </c:if>>중구</option>
									</select>
									<select class="sido2" id="region_code_11">	
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>										
										<option value="1104" <c:if test="${requestScope.gugun=='광양시' }">selected </c:if>>광양시</option>
										<option value="1106" <c:if test="${requestScope.gugun=='나주시' }">selected </c:if>>나주시</option>
										<option value="1108" <c:if test="${requestScope.gugun=='목포시' }">selected </c:if>>목포시</option>
										<option value="1109" <c:if test="${requestScope.gugun=='무안군' }">selected </c:if>>무안군</option>
										<option value="1111" <c:if test="${requestScope.gugun=='순천시' }">selected </c:if>>순천시</option>
										<option value="1113" <c:if test="${requestScope.gugun=='여수시' }">selected </c:if>>여수시</option>
										<option value="1122" <c:if test="${requestScope.gugun=='화순군' }">selected </c:if>>화순군</option>
									</select>
									<select class="sido2" id="region_code_12">	
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>										
										<option value="1202" <c:if test="${requestScope.gugun=='군산시' }">selected </c:if>>군산시</option>
										<option value="1203" <c:if test="${requestScope.gugun=='김제시' }">selected </c:if>>김제시</option>
										<option value="1204" <c:if test="${requestScope.gugun=='남원시' }">selected </c:if>>남원시</option>
										<option value="1205" <c:if test="${requestScope.gugun=='무주군' }">selected </c:if>>무주군</option>
										<option value="1209" <c:if test="${requestScope.gugun=='익산시' }">selected </c:if>>익산시</option>
										<option value="1212" <c:if test="${requestScope.gugun=='전주시' }">selected </c:if>>전주시</option>
										<option value="1213" <c:if test="${requestScope.gugun=='정읍시' }">selected </c:if>>정읍시</option>
									</select>
									<select class="sido2" id="region_code_13">	
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>										
										<option value="1301" <c:if test="${requestScope.gugun=='광산구' }">selected </c:if>>광산구</option>
										<option value="1302" <c:if test="${requestScope.gugun=='남구' }">selected </c:if>>남구</option>
										<option value="1303" <c:if test="${requestScope.gugun=='동구' }">selected </c:if>>동구</option>
										<option value="1304" <c:if test="${requestScope.gugun=='북구' }">selected </c:if>>북구</option>
										<option value="1305" <c:if test="${requestScope.gugun=='서구' }">selected </c:if>>서구</option>
									</select>
									<select class="sido2" id="region_code_14">	
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>										
										<option value="1401" <c:if test="${requestScope.gugun=='남구' }">selected </c:if>>남구</option>
										<option value="1402" <c:if test="${requestScope.gugun=='동구' }">selected </c:if>>동구</option>
										<option value="1403" <c:if test="${requestScope.gugun=='북구' }">selected </c:if>>북구</option>
										<option value="1404" <c:if test="${requestScope.gugun=='울주군' }">selected </c:if>>울주군</option>
										<option value="1405" <c:if test="${requestScope.gugun=='중구' }">selected </c:if>>중구</option>
									</select>
									<select class="sido2" id="region_code_15">	
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>										
										<option value="1501" <c:if test="${requestScope.gugun=='강서구' }">selected </c:if>>강서구</option>
										<option value="1502" <c:if test="${requestScope.gugun=='금정구' }">selected </c:if>>금정구</option>
										<option value="1503" <c:if test="${requestScope.gugun=='기장군' }">selected </c:if>>기장군</option>
										<option value="1504" <c:if test="${requestScope.gugun=='남구' }">selected </c:if>>남구</option>
										<option value="1506" <c:if test="${requestScope.gugun=='동래구' }">selected </c:if>>동래구</option>
										<option value="1507" <c:if test="${requestScope.gugun=='부산진구' }">selected </c:if>>부산진구</option>
										<option value="1508" <c:if test="${requestScope.gugun=='북구' }">selected </c:if>>북구</option>
										<option value="1509" <c:if test="${requestScope.gugun=='사상구' }">selected </c:if>>사상구</option>
										<option value="1510" <c:if test="${requestScope.gugun=='사하구' }">selected </c:if>>사하구</option>
										<option value="1511" <c:if test="${requestScope.gugun=='서구' }">selected </c:if>>서구</option>
										<option value="1512" <c:if test="${requestScope.gugun=='수영구' }">selected </c:if>>수영구</option>
										<option value="1513" <c:if test="${requestScope.gugun=='연제구' }">selected </c:if>>연제구</option>
										<option value="1514" <c:if test="${requestScope.gugun=='영도구' }">selected </c:if>>영도구</option>
										<option value="1516" <c:if test="${requestScope.gugun=='해운대구' }">selected </c:if>>해운대구</option>
									</select>
									<select class="sido2" id="region_code_16">	
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>										
										<option value="1601" <c:if test="${requestScope.gugun=='서귀포시' }">selected </c:if>>서귀포시</option>
										<option value="1602" <c:if test="${requestScope.gugun=='제주시' }">selected </c:if>>제주시</option>
									</select>
									<select class="sido2" id="region_code_17">	
										<option value="" <c:if test="${requestScope.gugun=='구/군' }">selected </c:if>>구/군</option>										
										<option value="1701" <c:if test="${requestScope.gugun=='세종시' }">selected </c:if>>세종시</option>
									</select>
									
								</div>
							</div>
																
							<div class="form_field">
								<a href="#" class="btn btn_red btn_srch" onclick="findStore();"><span class="btn_txt">검색</span></a>
							</div>
						</div>
						<!-- // 주소로 찾기 검색 영역 -->
						<!-- 매장명으로 찾기 검색 영역 -->
					
					<c:if test="${!named }">
						<div class="form_group selbox" id="div_name_srch">
					</c:if>
				
					<c:if test="${named }">
						<div class="form_group selbox" id="div_name_srch" style="display: none;">
					</c:if>
				
					
							<div class="form_field">
								<div class="form_item">
									<label for="st_name" class="i_label" style="position: absolute; visibility: hidden;">매장명 검색</label>
									<input type="text" id="store_name" class="sido3" placeholder="매장명 검색" >
								</div>
							</div>
							<div class="form_field">
								<a href="#" class="btn btn_red btn_srch" onclick="findStoreName();"><span class="btn_txt">검색</span></a>
							</div>
						</div>
						<!-- // 매장명으로 찾기 검색 영역 -->
					</div>
					<!-- //form_container -->	
				
				
				
					<div class="special_offer">
						<a href="#" onclick="getLocation(); return false;" class="btn btn2"><span class="btn_txt">나와 가까운 매장찾기</span></a>
					</div>
					 
				</div>
			</div>
		</div>
		<!-- //tab_menu -->

		<div class="shop_totalnum">
			<p>총 <em id="em_total_count"  >${count}</em>개의 매장</p>
<!-- 특별할인X <span>특별 프로모션<a href="#" class="btn_ico btn_on_off" onclick="toggleSpclPrmtn(this); return false;" id="schPrmt"></a></span> -->
		</div>
		<!-- //shop_totalnum -->
		
		
		<c:if test="${count==0}" var="result">
		<div class="findresult_map" id="div_no_result">
			<div class="result_empty">
				<span class="ico ico_findmap_null"></span>
				<p>죄송합니다.<br>매장검색 결과가 존재하지 않습니다.</p>
			</div>
		</div>
		</c:if>
		<c:if test="${not result}">
		<div class="shop_find" id="div_has_result">
			<div class="shop_map">
				<div id="map">
					<div id="map_canvas" style="height:660px; position: relative; top:0px; background-color: rgb(229, 227, 223); overflow: auto;"> 
						<div id="map_canvas_GcenMaps_viewport" style="position: relative; width: 100%; height: 100%; z-index: 0; overflow: hidden;">
							<div id="map_canvas_GcenMaps_markerlayer" style="position: absolute; width: 100%; height: 100%; z-index: 700; overflow: hidden;">
								<div class="marker_box" style="position: absolute; left: 206.5px; top: 262px;">
<!-- 									<div class="marker_info" data-gmapx="st_xpos" data-gmapy="st_ypos" style="display: block;">
											<strong></strong>
											<div class="btn_wrap">	
												<div class="btn_fix_rgt">		
												<a href="#" class="btn"><span class="btn_txt">상세보기</span></a>	
												</div>
											</div>
									</div> 	 -->
										
										
										
										<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2da6f30f4df7d35993f892c831fc0ee"></script>
											<script>
												var mapContainer = document.getElementById('map'), // 지도를 표시할 div 																																		
												    mapOption = {
												        center: new daum.maps.LatLng(${centerX}, ${centerY}), // 지도의 중심좌표
												        level: ${mapsize}, // 지도의 확대 레벨
												        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
												    }; 
												// 지도를 생성한다 
												var map = new daum.maps.Map(mapContainer, mapOption); 
												// 마커 이미지의 주소 실패시 'http://i66.tinypic.com/28ovbk.png' 입력
												var markerImageUrl = 'http://imageshack.com/a/img922/3816/bBfeoC.png', 
												    markerImageSize = new daum.maps.Size(70, 78), // 마커 이미지의 크기
												    markerImageOptions = { 
												        offset : new daum.maps.Point(20, 42)// 마커 좌표에 일치시킬 이미지 안의 좌표
												    };
												// 마커 이미지를 생성한다
												var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
										 
												// 지도에 마커를 생성하고 표시한다
/* 												var marker = new daum.maps.Marker({
												    position: new daum.maps.LatLng(37.4961476, 126.90789819999998), // 마커의 좌표
												
												    image : markerImage, // 마커의 이미지
												    map: map // 마커를 표시할 지도 객체
												}); */
												
												var positions = [
													<c:forEach items="${shoplist }" var="shoplist" varStatus="loop" >
													{
												        
												        content: '<div class="mapcontent" style="display: position: absolute; z-index: 1; bottom: 1px; left: 10%; width: 150px; margin-left: 30px; padding: 11px; background-color: #fff; border: 1px solid #bfbfbf; border-radius: 8px; font-size: 1.1em;"><strong>${shoplist.st_name}</strong></div>', 
												        latlng: new daum.maps.LatLng(${shoplist.st_xpos}, ${shoplist.st_ypos})
												    }
													<c:if test="${!loop.last}">
													,
													</c:if>
													</c:forEach>
														
												];
												for (var i = 0; i < positions.length; i ++) {
												    
												    // 마커 이미지를 생성합니다    
												   // var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
												    
												    // 마커를 생성합니다
												    var marker = new daum.maps.Marker({
												        map: map, // 마커를 표시할 지도
												        position: positions[i].latlng, // 마커를 표시할 위치
												        image : markerImage // 마커 이미지 
												    });
												    var infowindow = new daum.maps.InfoWindow({
												        content: positions[i].content // 인포윈도우에 표시할 내용
												    });
												    
												    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
												    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
												}
												// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
												function makeOverListener(map, marker, infowindow) {
												    return function() {
												        infowindow.open(map, marker);
												    };
												}

												// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
												function makeOutListener(infowindow) {
												    return function() {
												        infowindow.close();
												    };
												}
												/*  var iwContents = [
													<c:forEach items="${shoplist }" var="shoplist" varStatus="loop" >
													{
														'<div style="padding:5px;">${shoplist.st_name} <br><a href="<c:url value=''/>" style="color:blue" target="_blank">상세보기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
												    	iwPosition : new daum.maps.LatLng(${shoplist.st_xpos}, ${shoplist.st_ypos}) //인포윈도우 표시 위치입니다
													}<c:if test="${!loop.last}">
													,
													</c:if>
											    			
											    	</c:forEach>
												];  */
												
											    // 마커 이미지의 이미지 크기 입니다
											    var imageSize = new daum.maps.Size(24, 35); 
											    
												
												
												
										/* 	// 인포윈도우를 생성합니다
											var infowindow = new daum.maps.InfoWindow({
											    position : iwPosition[i].latlng, 
											    content : iwContent[i].content 
											});
											  
											// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
											infowindow.open(map, marker);  */
												
												
												
											</script>
									
									
								</div>	<!-- marker_box -->
							</div>	<!-- map_canvas_GcenMaps_markerlayer -->

						</div> <!-- map_canvas_GcenMaps_viewport -->
					</div>
					<!-- //map_canvas -->
				</div>
			</div>
			<!-- //shop_map -->
			<div class="shop_list">
				<ul id="ul_shop_list">
				<c:forEach items="${shoplist }" var="shoplist" >
					<li>
						<div class="shopcard">
							<div class="shopcard_content">
								<p class="title">${shoplist.st_name }</p>
								<p class="addr">${shoplist.st_addr }</p>
								<p class="phone_num">
									<span class="ico ico_s_phone"></span>${shoplist.st_tel }
								</p>
								<div class="btn_box">
									<a href="#" onclick="showDetail(${shoplist.st_no});" class="btn">
										<span class="btn_txt">상세보기</span>
									</a>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
				</ul><!-- CALL AJAX -->
			</div>
			<!-- //shop_map -->
		</div>
		<!-- //shop_find -->
		</c:if>
	</div>
	<!-- //content -->
</div>

<!-- //container -->

<!-- 매장 상세보기 팝업(s)) -->
<div class="pop_layer pop_type" id="storeview_detail">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>매장 상세보기</h2>
		</div>
		<div class="pop_content">
			<c:forEach items="${shoplist }" var="shoplist" varStatus="loop">
			<div id="de${shoplist.st_no}" class="detdiv"  style="display: none;"  >
			
			<div class="storeview_title">
				<p id="detail_name">${shoplist.st_name }</p>
			</div>
			
			<!-- //title -->
			<div class="btn_wrap">

			</div>
			<!-- //button -->
			<div class="store_information">
				<div class="pop_content_wrapper">
					<div class="store_infobox">
						<div class="store_map" id="detail_map">
							<div id="map_detail_canvas" style="width: 420px; height:330px; position: relative; top:0px; background-color: rgb(229, 227, 223); overflow: auto;"></div>
								<div id="map_detail_canvas_GcenMaps_viewport" style="position: relative; width: 100%; height: 100%; z-index: 0; overflow: hidden;">
									<div id="map_detail_canvas_GcenMaps_markerlayer" style="position: absolute; width: 100%; height: 100%; z-index: 700; overflow: hidden;">
										<div class="marker_box" style="position: absolute; left: 171.5px; top: 97px;">
											<!-- <div class="marker_info" data-gmapx="37.564732" data-gmapy="126.993168" style="display: none;"> -->
											<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2da6f30f4df7d35993f892c831fc0ee"></script>
											<script>
												var mapContainer = document.getElementById('detail_map'), // 지도를 표시할 div 																																		
											    	mapOption = {
											        center: new daum.maps.LatLng(${shoplist.st_xpos}, ${shoplist.st_ypos}), // 지도의 중심좌표
											        level: 2, // 지도의 확대 레벨
											        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
											    	}; 
											    // 지도를 생성한다 
												var detail_map = new daum.maps.Map(mapContainer, mapOption);
												// 마커 이미지의 주소 실패시 'http://i66.tinypic.com/28ovbk.png' 입력
												var markerImageUrl = 'http://imageshack.com/a/img922/3816/bBfeoC.png', 
												    markerImageSize = new daum.maps.Size(70, 78), // 마커 이미지의 크기
												    markerImageOptions = { 
												        offset : new daum.maps.Point(20, 42)// 마커 좌표에 일치시킬 이미지 안의 좌표
												    };
												// 마커 이미지를 생성한다
												var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);																																   		    
																																																																									
												// 마커 이미지를 생성합니다    
												// var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
												    
											    // 마커를 생성합니다
											    var marker = new daum.maps.Marker({
											        map: detail_map, // 마커를 표시할 지도
											        position: new daum.maps.LatLng(${shoplist.st_xpos}, ${shoplist.st_ypos}), // 마커를 표시할 위치												       
											        image : markerImage // 마커 이미지 
											    });
												   
												
											</script>
											<!-- </div> -->
										</div>
									</div>
								</div>
							</div>
						<!-- //store_map -->
						<div class="store_information_lst">
							<ul>
								<li>
									<div class="info_title"><span class="ico ico_store_info"></span><span class="txt_store">전화번호</span></div>
									<div class="info_desc" id="detail_tel">${shoplist.st_tel }</div>
								</li>
								<li>
									<div class="info_title"><span class="ico ico_store_info3"></span><span class="txt_store">주소</span></div>
									<div class="info_desc" id="detail_address">${shoplist.st_addr }</div>
								</li>
								<li>
									<div class="info_title"><span class="ico ico_store_info4"></span><span class="txt_store">영업시간</span></div>
									<div class="info_desc" id="detail_business_hours">${shoplist.st_time }</div>
								</li>
								<li>
									<div class="info_title"><span class="ico ico_store_info5"></span><span class="txt_store">위치정보</span></div>
									<div class="info_desc" id="detail_location_info">${shoplist.st_road }</div>
								</li>
								<li>
									<div class="info_title"><span class="ico ico_store_info6"></span><span class="txt_store">주차정보</span></div>
									<div class="info_desc" id="detail_parking_info">${shoplist.st_parkin }</div>
								</li>
<!-- 								<li>
									 매장 할인 X <div class="info_title"><span class="ico ico_store_info7"></span><span class="txt_store">Notice &amp;<br>Event</span></div> 
									 매장별 할인 X <div class="info_desc"><em id="detail_notice">배달주문 25% 할인</em></div>
								</li> -->
							</ul>
						</div>
						<!-- //store_information_lst -->
					</div>
				</div>
			</div>
			<!-- //store_information -->

			<!-- //slae_area -->
			<div class="sample_slide">
				<div class="slide_wrap btn_center btn_type" style="width:100%;margin:0 auto;">
					<ul class="slides" id="detail_photos"></ul>
				</div>
			</div>

			<!-- //slide -->
			</div>
			</c:forEach>
		</div>
		
		<a href="#" class="btn_ico btn_close">닫기</a>
	</div>
</div>
<!-- //매장 상세보기 팝업(e) -->

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
