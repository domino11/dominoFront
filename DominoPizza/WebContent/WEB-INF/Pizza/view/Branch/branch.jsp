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
		
		//$('.sido2').val() == '금천구';
		$('.sido2').hide();
		$('#region_code_01').show();
		
		// 마이쿠폰 정보 조회(가입회원)
		

		// 주문&주문트레커 조회(가입회원/인증회원)
		
	});

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
	
	var shopsido = $('#sido2').text(st_addr);
	
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
			$('#region_code_2').val('0122');
			findBranch('st_addr');	// 주소로 검색한 목록 호출
		});
	}else{
		findBranch('st_addr');	// 주소로 검색한 목록 호출
	}

	$('#st_name').on('keydown', function(key) {
		if(key.keyCode == 13) {
			findBranch('st_name');
		}
	});

	
});


//매장 찾기 검색 영역 탭 변경
//@param		optn	주소로 검색(address), 매장명 검색(name) 구분 값
//@thisArea
function navTabs(optn, thisArea) {
	if (optn == 'st_addr') {
		// 서울 금천구로 셀렉트박스 초기화 후 검색
		$('#region_code_1').val('01');
		getRegion(function() {
			$('#region_code_2').val('0122');
			findBranch('st_addr');
		});

		$('#div_name_srch').hide();
		$('#div_addr_srch').show();
	} else if (optn == 'st_name') {
		// 매장명 검색어 초기화
		$('#st_name').val('');

		// 검색 파라미터 설정
		var paramArr = [];
		paramArr[0] = 'pageNo=' + pageNo;
		paramArr[1] = 'region_code_2=0122';

		// 서울 중구를 디폴트 목록으로 노출
		appendBranch(paramArr);

		$('#div_addr_srch').hide();
		$('#div_name_srch').show();
	} else {
		return;
	}

	$('ul.btn_tab li').removeClass('active');
	$(thisArea).parent().addClass('active');
}
 function getRegion(callbackFunc) {
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
 
} 

//레이어 팝업 열기
//@param	optn	특별 할인(promotion), 매장지도 전체보기(detail_map), 매장 상세보기(detail_view) 구분 값
function openLayerPopup(optn) {
	/*	특별할인X
	 if (optn == 'promotion') {
 		$('html, body').css({'overflow-y': 'hidden', 'height' : '100%'});
		$('#popup_promotion').addClass('open');
	} else

		*/ 
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
}

function closeLayer() {
 	$('html, body').css('overflow-y', '');
	$('#popup_promotion').removeClass('open');
};

//지도 초기화
function initMaps(param_st_xpos, param_st_ypos) {
	var mapOptions = {
		startx : param_st_ypos, // 지도 시작좌표X (경도)
		starty : param_st_xpos, // 지도 시작좌표Y (위도)
		startlevel : 14	// 지도 축척 시작 레벨
	};
 
	// 메인 지도  (전체 매장)
	map = new gcen.api.maps.Map(document.getElementById("map_canvas"), "https://dmap.gcen.co.kr/dmap201702/tile.png", mapOptions);
	map.setActionControl("markerclick"); // 지도 제어를 마커클릭을 바꿈
	//map.levelBarShow(); // 레벨바 보여주기 -> 레벨바를 생성하면 id로 이벤트가 동작하게 되어있어서 3개의 맵에 대해서 적용이 불가능함 

	// 확대보기 지도 (전체 매장)
	largeMap = new gcen.api.maps.Map(document.getElementById("map_large_canvas"), "https://dmap.gcen.co.kr/dmap201702/tile.png", mapOptions);
	largeMap.setActionControl("markerclick"); // 지도 제어를 마커클릭을 바꿈
	//largeMap.levelBarShow();

	// 상세보기 지도 (매장 1개에 대한 지도 표시)
	detailMap = new gcen.api.maps.Map(document.getElementById("map_detail_canvas"), "https://dmap.gcen.co.kr/dmap201702/tile.png", mapOptions);
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
function addMarker(mapObj, branchObj, detailBtnYn) {
/*	할인 X
	var onSale = branchObj.wrapp_sales;
	var offSale = (!!!branchObj.off_wrapp_sale) ? onSale : branchObj.off_wrapp_sale;
 */
	// 마커 정보창 설정
	var infoDiv = '<c:forEach items="${shoplist }" var="shoplist" varStatus="loop">';
	infoDiv += '<div class="marker_info" data-gmapx="'+${shoplist.st_xpos}+'" data-gmapy="'+${shoplist.st_ypos}+'" style="display: none;">';
	infoDiv += '<strong>' + ${shoplist.st_name} + '</strong>'
			/* 방문포장할인 X
			+'<div>'
			+'	<ul>'
			+'		<li>온라인 방문포장 '+ onSale +'%</li>'
			+'		<li>오프라인 방문포장 '+ offSale +'%</li>'
			+'	</ul>'
			+'</div>';
			 */
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
}

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

	if (optn == 'st_addr') {
		if ($('#region_code_1').val() == '') {
			alert('시/도를 선택해주세요.');
			return false;
		} else if ($('#region_code_2').val() == '') {
			alert('구/군을 선택해주세요.');
			return false;
		}

		paramArr[1] = 'region_code_2=' + $('#region_code_2').val();
	} else if (optn == 'name') {
		if ($('#name').val().length == 0) {
			alert('매장명을 입력해주세요.');
			return false;
		}

		paramArr[1] = 'name=' + encodeURIComponent(encodeURIComponent($('#name').val()));
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
					detailMap.setCenter(branch.st_ypos, branch.st_xpos, 14);
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
function appendBranch(paramArr) {
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
						var st_addr = '';
						if (branch.road_addr_ba != null) {
							st_addr = branch.road_addr_ba + ((!!branch.road_addr_de) ? ' ' + branch.road_addr_de : '');
						} else if (branch.addr_ba != null) {
							st_addr = branch.addr_ba + ((!!branch.addr_de) ? ' ' + branch.addr_de : '');
						}
/* 						할인 X
						var onSale = branch.wrapp_sales,
							offSale = (!!!branch.off_wrapp_sale) ? onSale : branch.off_wrapp_sale;
 */
						htmlStr += '<li>';
						htmlStr += '	<div class="shopcard">';
						htmlStr += '	<c:forEach items="${shoplist }" var="shoplist" varStatus="loop">';
						htmlStr += '		<div class="shopcard_content">';
						
/* 						방문포장할인 X
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
						htmlStr += '			</div>'; */
						
						htmlStr += '			<p class="title">'+ ${shoplist.st_name} +'</p>';
						htmlStr += '			<p class="st_addr">'+ ${shoplist.st_addr} +'</p>';
						//htmlStr += '			<p class="distance">15 KM</p>';
						htmlStr += '			<p class="phone_num"><span class="ico ico_s_phone"></span>'+ ${shoplist.st_tel} +'</p>';
						htmlStr += '			<div class="btn_box">';
						htmlStr += '				<a href="#none" onclick="openDetailPop('+ ${shoplist.st_no} +');" class="btn"><span class="btn_txt">상세보기</span></a>';
/* 			할인X		htmlStr += '				<a href="javascript:goBasketWrapp('+branch.branch_code+');" class="btn btn_red"><span class="btn_txt">방문포장</span></a>'; */
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

function goBasketWrapp(branch_code) {
	if(branch_code == '86508'){
		alert('"청담점 + 삼성점 합병운영 안내"\n2017.08.21(월)부터 기존 도미노피자 청담점 포장고객 도미노피자 삼성점으로 이용 부탁드립니다.');
		location.href = "/main";
	}else{
		
			if(!confirm("로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?")) {
				return;
			}
		
		location.href = "/delivery/branchWrappProc?branch_code="+branch_code;
	}
}

</script>

<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="store">
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><span>매장찾기</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>매장찾기</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="tab_type">
			<ul class="btn_tab">
				<li class="active" data-val="st_addr"><a href="#" onclick="navTabs('st_addr', this); return false;">주소로 검색</a></li>
				<li data-val="st_name"><a href="#" onclick="navTabs('st_name', this); return false;">매장명 검색</a></li>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">

					<div class="form_container">
						<!-- 주소로 찾기 검색 영역 -->
						<div class="form_group selbox" id="div_addr_srch">
							<div class="form_field">
								<div class="sel_box">
									<select id="region_code_1" onchange="getRegion();">
										<option value="">시/도</option>
										<option value="01"  selected >서울</option>
										<option value="02" >인천</option>
										<option value="03" >경기</option>
										<option value="04" >강원</option>
										<option value="05" >충남</option>
										<option value="06" >충북</option>
										<option value="07" >대전</option>
										<option value="08" >경남</option>
										<option value="09" >경북</option>
										<option value="10" >대구</option>
										<option value="11" >전남</option>
										<option value="12" >전북</option>
										<option value="13" >광주</option>
										<option value="14" >울산</option>
										<option value="15" >부산</option>
										<option value="16" >제주</option>
										<option value="17" >세종특별자치시</option>
									</select>
								</div>
							</div>
							<div class="form_field">
								<div class="sel_box">
									<select class="sido2" id="region_code_01" >
										<option value="">구/군</option>
										<option value="0111" >강남구</option>
										<option value="0110" >강동구</option>
										<option value="0117" >강북구</option>
										<option value="0124" >강서구</option>
										<option value="0120" >관악구</option>
										<option value="0118" >광진구</option>
										<option value="0121" >구로구</option>
										<option value="0122" selected>금천구</option>
										<option value="0115" >노원구</option>
										<option value="0108" >도봉구</option>
										<option value="0106" >동대문구</option>
										<option value="0123" >동작구</option>
										<option value="0104" >마포구</option>
										<option value="0103" >서대문구</option>
										<option value="0113" >서초구</option>
										<option value="0109" >성동구</option>
										<option value="0112" >성북구</option>
										<option value="0114" >송파구</option>
										<option value="0125" >양천구</option>
										<option value="0119" >영등포구</option>
										<option value="0116" >용산구</option>
										<option value="0105" >은평구</option>
										<option value="0102" >종로구</option>
										<option value="0101" >중구</option>
										<option value="0107" >중랑구</option>
									</select>
									
									<select class="sido2" id="region_code_02" >
										<option value="">구/군</option>
										<option value="0202">계양구</option>
										<option value="0203">남구</option>
										<option value="0204">남동구</option>
										<option value="0206">부평구</option>
										<option value="0207">서구</option>
										<option value="0208">연수구</option>
										<option value="0210">중구</option>
									</select>
									<select class="sido2" id="region_code_03">
										<option value="">구/군</option>									
										<option value="0301">고양시</option>
										<option value="0302">과천시</option>
										<option value="0303">광명시</option>
										<option value="0304">광주시</option>
										<option value="0305">구리시</option>
										<option value="0306">군포시</option>
										<option value="0307">김포시</option>
										<option value="0308">남양주시</option>
										<option value="0309">동두천시</option>
										<option value="0310">부천시</option>
										<option value="0311">성남시</option>
										<option value="0312">수원시</option>
										<option value="0313">시흥시</option>
										<option value="0314">안산시</option>
										<option value="0315">안성시</option>
										<option value="0316">안양시</option>
										<option value="0327">양주시</option>
										<option value="0317">양평군</option>
										<option value="0318">여주군</option>
										<option value="0320">오산시</option>
										<option value="0321">용인시</option>
										<option value="0322">의왕시</option>
										<option value="0323">의정부시</option>
										<option value="0324">이천시</option>
										<option value="0325">파주시</option>
										<option value="0328">평택시</option>
										<option value="0329">포천시</option>
										<option value="0330">하남시</option>
										<option value="0331">화성시</option>
									</select>
									<select class="sido2" id="region_code_04">
										<option value="">구/군</option>																			
										<option value="0401">강릉시</option>
										<option value="0403">동해시</option>
										<option value="0404">삼척시</option>
										<option value="0405">속초시</option>
										<option value="0408">영월군</option>
										<option value="0409">원주시</option>
										<option value="0410">인제군</option>
										<option value="0411">정선군</option>
										<option value="0412">철원군</option>
										<option value="0413">춘천시</option>
										<option value="0414">태백시</option>
										<option value="0415">평창군</option>
										<option value="0416">홍천군</option>
										<option value="0418">횡성군</option>
									</select>
									<select class="sido2" id="region_code_05">
										<option value="">구/군</option>									
										<option value="0501">계룡시</option>
										<option value="0502">공주시</option>
										<option value="0504">논산시</option>
										<option value="0505">당진군</option>
										<option value="0506">보령시</option>
										<option value="0508">서산시</option>
										<option value="0510">아산시</option>
										<option value="0513">천안시</option>
										<option value="0516">홍성군</option>
									</select>
									<select class="sido2" id="region_code_06">	
										<option value="">구/군</option>										
										<option value="0606">음성군</option>
										<option value="0607">제천시</option>
										<option value="0608">증평군</option>
										<option value="0610">청원군</option>
										<option value="0611">청주시</option>
										<option value="0612">충주시</option>
									</select>
									<select class="sido2" id="region_code_07">	
										<option value="">구/군</option>										
										<option value="0701">대덕구</option>
										<option value="0702">동구</option>
										<option value="0703">서구</option>
										<option value="0704">유성구</option>
										<option value="0705">중구</option>
									</select>
									<select class="sido2" id="region_code_08">	
										<option value="">구/군</option>										
										<option value="0801">거제시</option>
										<option value="0802">거창군</option>
										<option value="0804">김해시</option>
										<option value="0806">마산시</option>
										<option value="0807">밀양시</option>
										<option value="0808">사천시</option>
										<option value="0810">양산시</option>
										<option value="0812">진주시</option>
										<option value="0813">진해시</option>
										<option value="0815">창원시</option>
										<option value="0816">통영시</option>
									</select>
									<select class="sido2" id="region_code_09">
										<option value="">구/군</option>											
										<option value="0901">경산시</option>
										<option value="0902">경주시</option>
										<option value="0904">구미시</option>
										<option value="0906">김천시</option>
										<option value="0907">문경시</option>
										<option value="0909">상주시</option>
										<option value="0911">안동시</option>
										<option value="0914">영주시</option>
										<option value="0915">영천시</option>
										<option value="0922">칠곡군</option>
										<option value="0923">포항시</option>
									</select>
									<select class="sido2" id="region_code_10">	
										<option value="">구/군</option>										
										<option value="1001">남구</option>
										<option value="1002">달서구</option>
										<option value="1003">달성군</option>
										<option value="1004">동구</option>
										<option value="1005">북구</option>
										<option value="1007">수성구</option>
										<option value="1008">중구</option>
									</select>
									<select class="sido2" id="region_code_11">	
										<option value="">구/군</option>										
										<option value="1104">광양시</option>
										<option value="1106">나주시</option>
										<option value="1108">목포시</option>
										<option value="1109">무안군</option>
										<option value="1111">순천시</option>
										<option value="1113">여수시</option>
										<option value="1122">화순군</option>
									</select>
									<select class="sido2" id="region_code_12">	
										<option value="">구/군</option>										
										<option value="1202">군산시</option>
										<option value="1203">김제시</option>
										<option value="1204">남원시</option>
										<option value="1205">무주군</option>
										<option value="1209">익산시</option>
										<option value="1212">전주시</option>
										<option value="1213">정읍시</option>
									</select>
									<select class="sido2" id="region_code_13">	
										<option value="">구/군</option>										
										<option value="1301">광산구</option>
										<option value="1302">남구</option>
										<option value="1303">동구</option>
										<option value="1304">북구</option>
										<option value="1305">서구</option>
									</select>
									<select class="sido2" id="region_code_14">	
										<option value="">구/군</option>										
										<option value="1401">남구</option>
										<option value="1402">동구</option>
										<option value="1403">북구</option>
										<option value="1404">울주군</option>
										<option value="1405">중구</option>
									</select>
									<select class="sido2" id="region_code_15">	
										<option value="">구/군</option>										
										<option value="1501">강서구</option>
										<option value="1502">금정구</option>
										<option value="1503">기장군</option>
										<option value="1504">남구</option>
										<option value="1506">동래구</option>
										<option value="1507">부산진구</option>
										<option value="1508">북구</option>
										<option value="1509">사상구</option>
										<option value="1510">사하구</option>
										<option value="1511">서구</option>
										<option value="1512">수영구</option>
										<option value="1513">연제구</option>
										<option value="1514">영도구</option>
										<option value="1516">해운대구</option>
									</select>
									<select class="sido2" id="region_code_16">	
										<option value="">구/군</option>										
										<option value="1601">서귀포시</option>
										<option value="1602">제주시</option>
									</select>
									<select class="sido2" id="region_code_17">	
										<option value="">구/군</option>										
										<option value="1701">세종시</option>
									</select>
									
								</div>
							</div>
							<div class="form_field">
								<a href="#" class="btn btn_red btn_srch" onclick="findBranch('st_addr'); return false;"><span class="btn_txt">검색</span></a>
							</div>
						</div>
						<!-- // 주소로 찾기 검색 영역 -->
						<!-- 매장명으로 찾기 검색 영역 -->
						<div class="form_group selbox" id="div_name_srch" style="display: none;">
							<div class="form_field">
								<div class="form_item">
									<label for="st_name" class="i_label">매장명 검색</label>
									<input type="text" id="st_name" class="i_text">
								</div>
							</div>
							<div class="form_field">
								<a href="#" class="btn btn_red btn_srch" onclick="findBranch('st_name'); return false;"><span class="btn_txt">검색</span></a>
							</div>
						</div>
						<!-- // 매장명으로 찾기 검색 영역 -->
					</div>
					<!-- //form_container -->
<!-- 
				특별할인X
					<div class="special_offer">
						<a href="#" onclick="schAllPrmt(); return false;" class="btn btn2"><span class="btn_txt">특별할인 진행 매장찾기</span></a>
						<p onclick="openLayerPopup('promotion'); return false;"><span class="ico ico_ex_mark"></span><em>특별할인 안내</em></p>
					</div>
					 -->
				</div>

			</div>
		</div>
		<!-- //tab_menu -->

		<div class="shop_totalnum">
			<p>총 <em id="em_total_count">0</em>개의 매장</p>
<!-- 특별할인X <span>특별 프로모션<a href="#" class="btn_ico btn_on_off" onclick="toggleSpclPrmtn(this); return false;" id="schPrmt"></a></span> -->
		</div>
		<!-- //shop_totalnum -->

		<div class="findresult_map" id="div_no_result" style="display: none;">
			<div class="result_empty">
				<span class="ico ico_findmap_null"></span>
				<p>죄송합니다.<br>매장검색 결과가 존재하지 않습니다.</p>
				<!-- 2016-10-13 // 전체매장보기 버튼 추가(s) -->
				<a href="#" onclick="openLayerPopup('detail_map'); return false;" class="btn btn_mdle btn_gray btn_basic"><span class="btn_txt">전체 매장보기</span></a>
				<!-- 2016-10-13 // 전체매장보기 버튼 추가(e) -->
			</div>
		</div>

		<div class="shop_find" id="div_has_result">
			<div class="shop_map">
				<div id="map" style="height:660px; position: relative; top:0px; background-color: rgb(229, 227, 223); overflow: auto;">
					<div id="map_canvas" style="height:660px; position: relative; top:0px; background-color: rgb(229, 227, 223); overflow: auto;"> 
						<div id="map_canvas_GcenMaps_viewport" style="position: relative; width: 100%; height: 100%; z-index: 0; overflow: hidden;">
					 	<c:forEach items="${shoplist }" var="shoplist" varStatus="loop"> 
							<div id="map_canvas_GcenMaps_markerlayer" style="position: absolute; width: 100%; height: 100%; z-index: 700; overflow: hidden;">
								<div class="marker_box" style="position: absolute; left: 206.5px; top: 262px;">
									<div class="marker_info" data-gmapx="${shoplist.st_xpos }" data-gmapy="${shoplist.st_ypos }" style="display: block;">
											<strong>${shoplist.st_name }</strong>
											<div class="btn_wrap">	
												<div class="btn_fix_rgt">		
												<a href="javascript:openDetailPop('86520');" class="btn"><span class="btn_txt">상세보기</span></a>	
												</div>
											</div>
									</div> <!-- marker_info -->	
										
										
										
										<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2da6f30f4df7d35993f892c831fc0ee"></script>
											<script>
												var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
													st_xpos = 37.4783093 * 1.0,
													st_ypos = 126.89102460000004 * 1.0,
												    mapOption = {
												        center: new daum.maps.LatLng(st_xpos, st_ypos), // 지도의 중심좌표
												        level: 3, // 지도의 확대 레벨
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
												var marker = new daum.maps.Marker({
												    position: new daum.maps.LatLng(st_xpos, st_ypos), // 마커의 좌표
												    image : markerImage, // 마커의 이미지
												    map: map // 마커를 표시할 지도 객체
												});
										
												// 마커에 mouseover 이벤트를 등록한다
												daum.maps.event.addListener(marker, 'mouseover', function() {
												    console.log('마커에 mouseover 이벤트가 발생했습니다!');
												});
										
												// 마커에 mouseout 이벤트 등록
												daum.maps.event.addListener(marker, 'mouseout', function() {
												    console.log('마커에 mouseout 이벤트가 발생했습니다!');
												});
											</script>
									<a href="#" class="btn_screen" onclick="openLayerPopup('detail_map'); return false;"><span class="ico ico_screen2"></span></a>
									
								</div>	<!-- marker_box -->
							</div>	<!-- map_canvas_GcenMaps_markerlayer -->
							</c:forEach> 
						</div> <!-- map_canvas_GcenMaps_viewport -->
					</div>
					<!-- //map_canvas -->
				</div>
			</div>
			<!-- //shop_map -->
			<div class="shop_list">
				<ul id="ul_shop_list">
				<c:forEach items="${shoplist }" var="shoplist" varStatus="loop">
					<li>	
						<div class="shopcard">		
							<div class="shopcard_content">
<!-- 							포장할인X			
								<div class="shopcard_tag">				
									<div class="store_tag online_tag">					
										<p class="tag_title">방문포장</p>					
										<span class="tag_info">ON<br>LINE</span>					
										<span class="tag_sale">20<em>%</em></span>				
									</div>				
									<div class="store_tag offline_tag">					
										<p class="tag_title">방문포장</p>					
										<span class="tag_info">OFF<br>LINE</span>					
										<span class="tag_sale">20<em>%</em></span>				
									</div>			
								</div>	 -->		
								<p class="title">${shoplist.st_name }</p>			
								<p class="st_addr">${shoplist.st_addr }</p>			
								<p class="phone_num">
									<span class="ico ico_s_phone"></span>${shoplist.st_tel }
								</p>			
								<div class="btn_box">				
									<a href="#none" onclick="openDetailPop(86296);" class="btn">
										<span class="btn_txt">상세보기</span>
									</a>				
									<a href="javascript:goBasketWrapp(86296);" class="btn btn_red">
										<span class="btn_txt">방문포장</span>
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

	</div>
	<!-- //content -->
</div>
<!-- //container -->

<!-- 특별할인X 
	특별할인 팝업(s)
<div class="pop_layer" id="popup_promotion"></div>
//특별할인 팝업(e)
 -->
<!-- 매장지도 전체보기 팝업(s)) -->
<div class="pop_layer pop_type" id="storeview_map">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>매장지도 전체보기</h2>
		</div>
		<div class="pop_content">
			<div class="map_view">
				<div id="map">
					<div id="map_large_canvas" style="height:835px; position: relative; top:0px; background-color: rgb(229, 227, 223); overflow: auto;"></div>
				</div>
			</div>
		</div>
		<a href="#" onclick="$('.marker_info').hide(); return false;" class="btn_ico btn_close">닫기</a>
	</div>
</div>
<!-- //매장지도 전체보기 팝업(e) -->

<!-- 매장 상세보기 팝업(s)) -->
<div class="pop_layer pop_type" id="storeview_detail">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>매장 상세보기</h2>
		</div>
		<div class="pop_content">
			<input type="hidden" id="st_no" value="" />
			<div class="storeview_title">
				<p id="detail_name">도미노피자 응암점</p>
<!-- 				
				방문포장할인
				<div class="sale_tag">
					<div class="store_tag online_tag">
						<p class="tag_title">방문포장</p>
						<span class="tag_info">ON<br>LINE</span>
						<span class="tag_sale"><span id="detail_on_sale"></span><em>%</em></span>
					</div>
					<div class="store_tag offline_tag">
						<p class="tag_title">방문포장</p>
						<span class="tag_info">OFF<br>LINE</span>
						<span class="tag_sale"><span id="detail_off_sale"></span><em>%</em></span>
					</div>
				</div> -->
			</div>
			<!-- //title -->

			<div class="btn_wrap">
				<div class="btn_fix_lft">
					<a href="#" class="btn btn_mdle btn_red" id="detail_basket_wrapp"><span class="btn_txt">방문포장 주문하기</span></a>
				</div>
			</div>
			<!-- //button -->

<!-- 
			특별할인X
			<div class="sale_area">
				<div class="pop_content_wrapper">
					<p class="sale_txt">특별할인</p>
					<p class="sale_list" id="detail_sale_info">
						특정피자(L)배달 30%, 클래식 5종 방문포장, 클래식 5종 방문포장
					</p>
				</div>
			</div>
 -->
			<div class="store_information">
				<div class="pop_content_wrapper">
					<div class="store_infobox">
						<div class="store_map">
							<div id="map_detail_canvas" style="width: 420px; height:330px; position: relative; top:0px; background-color: rgb(229, 227, 223); overflow: auto;"></div>
						</div>
						<!-- //store_map -->
						<div class="store_information_lst">
							<ul>
								<!-- <li>
									<div class="info_title"><span class="ico ico_store_info2"></span><span class="txt_store">거리</span></div>
									<div class="info_desc">15 Km</div>
								</li> -->
								<li>
									<div class="info_title"><span class="ico ico_store_info"></span><span class="txt_store">전화번호</span></div>
									<div class="info_desc" id="detail_tel">${st_tel }</div>
								</li>
								<li>
									<div class="info_title"><span class="ico ico_store_info3"></span><span class="txt_store">주소</span></div>
									<div class="info_desc" id="detail_address">${st_addr }</div>
								</li>
								<li>
									<div class="info_title"><span class="ico ico_store_info4"></span><span class="txt_store">영업시간</span></div>
									<div class="info_desc" id="detail_business_hours">${st_time }</div>
								</li>
<!-- 								<li>
									<div class="info_title"><span class="ico ico_store_info5"></span><span class="txt_store">위치정보</span></div>
									<div class="info_desc" id="detail_location_info">지하철 6호선 증산역 3번출구앞</div>
								</li> -->
								<li>
									<div class="info_title"><span class="ico ico_store_info6"></span><span class="txt_store">주차정보</span></div>
									<div class="info_desc" id="detail_parking_info">${st_parkin }</div>
								</li>
								<li>
									<!-- 매장 할인 X <div class="info_title"><span class="ico ico_store_info7"></span><span class="txt_store">Notice &amp;<br>Event</span></div> -->
									<!-- 매장별 할인 X <div class="info_desc"><em id="detail_notice">배달주문 25% 할인</em></div> -->
								</li>
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
