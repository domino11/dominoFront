<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="euc-kr">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>���̳�����</title>
	<meta name="viewport" id="viewport" content="width=1119px, user-scalable=yes">
	<meta http-equiv='cache-control' content='no-cache'>
	<meta http-equiv='expires' content='0'>
	<meta http-equiv='pragma' content='no-cache'>
	<link rel="shortcut icon" href="https://cdn.dominos.co.kr/renewal2016/ko/w/img/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/font.css' />">
	
	<!-- Style - ��� ���� ���� ����ϴ� css-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/style.css'/>" />
	<!--  basic �� css -->
	
	
	<link rel="stylesheet" type="text/css" href="<c:url value='https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css' />">
	
	<!--  ���ʿ� -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery.jcarousel.min.js'/>"></script>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/jcarousel.connected-carousels.css' /> ">
	<script type="text/javascript" src="<c:url value='/Pizza/js/jcarousel.connected-carousels.js' /> "></script>
	
	
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery1.11.1.js' />"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/ui.js' />"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery.flexslider.js' />"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/selectbox.js' />"></script><!-- js ������. -->
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
		
		//$('.sido2').val() == '��õ��';
		$('.sido2').hide();
		$('#region_code_01').show();
		
		// �������� ���� ��ȸ(����ȸ��)
		

		// �ֹ�&�ֹ�Ʈ��Ŀ ��ȸ(����ȸ��/����ȸ��)
		
	});

	//��/���� ���� ����Ʈ �ڽ��� ��/�� ��� ����
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
	
	//������ ȸ�� ����
	function goLoginPop() 
	{
		if(location.pathname !== '/global/login')
			location.href = '/global/login';
	}
	
	var shopsido = $('#sido2').text(st_addr);
	
</script>
<!-- Naver Anlytics ����-->
<script>
var WCSLOG_URL = location.protocol == "https:" ? "https://wcs.naver.net/wcslog.js" : "http://wcs.naver.net/wcslog.js";
document.write(unescape("%3Cscript type='text/javascript' src='" + WCSLOG_URL +"' %3E%3C/script%3E"));
</script>
<!-- // Naver Anlytics ����-->

<!-- ī���� ����-->
<script data-kz-key="7944084e2b522564"
data-kz-namespace="kzs"
src="//cdn.kaizenplatform.net/s/79/44084e2b522564.js" charset="utf-8">
</script> 
<!-- ī���� ����-->

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
	
/* 	Ư������
window.onload = function() {
	// Ư�� ���� ���̾��˾� html ����
	// iframe �ҷ����� ���� ���� �ɷ��� ��/��, ��/�� ����Ʈ �ڽ� �ɼ� ���� �������� ������ ���� �߻��Ͽ� onload�� ��ġ �ű�.
	$('#popup_promotion').html("<iframe src='/branch/lsmLayer' width='100%' height='100%' frameborder='0'></iframe>");
};
 */
$(function() {
	initMaps(st_xpos, st_ypos);	// ��ü ���� ���� ǥ��
	/*
		�ٸ� �������� �̵��ߴٰ� �ڷ� ����� �ش� ������ ���� ��,
		��/�� ���� ��� ���� ����Ʈ �� �ҷ����� ���� ������ �߰�
	*/
	if($('#region_code_1').val() == ""){
		$('#region_code_1').val('01');
		getRegion(function() {
			$('#region_code_2').val('0122');
			findBranch('st_addr');	// �ּҷ� �˻��� ��� ȣ��
		});
	}else{
		findBranch('st_addr');	// �ּҷ� �˻��� ��� ȣ��
	}

	$('#st_name').on('keydown', function(key) {
		if(key.keyCode == 13) {
			findBranch('st_name');
		}
	});

	
});


//���� ã�� �˻� ���� �� ����
//@param		optn	�ּҷ� �˻�(address), ����� �˻�(name) ���� ��
//@thisArea
function navTabs(optn, thisArea) {
	if (optn == 'st_addr') {
		// ���� ��õ���� ����Ʈ�ڽ� �ʱ�ȭ �� �˻�
		$('#region_code_1').val('01');
		getRegion(function() {
			$('#region_code_2').val('0122');
			findBranch('st_addr');
		});

		$('#div_name_srch').hide();
		$('#div_addr_srch').show();
	} else if (optn == 'st_name') {
		// ����� �˻��� �ʱ�ȭ
		$('#st_name').val('');

		// �˻� �Ķ���� ����
		var paramArr = [];
		paramArr[0] = 'pageNo=' + pageNo;
		paramArr[1] = 'region_code_2=0122';

		// ���� �߱��� ����Ʈ ������� ����
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
		var htmlStr = '<option value="">��/��</option>'; 
		
 	}

 	$.ajax({
		url: '/branch/regionSubListAjax',
		data: { region_code_1 : $('#region_code_1').val()},
		type: 'get',
		dataType: 'json',
		success: function(data) {
			if (data.status == 'success') {
				var htmlStr = '<option value="">��/��</option>';
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
			// alert('ó������ ������ �߻��߽��ϴ�.');
		}
	});  
 
} 

//���̾� �˾� ����
//@param	optn	Ư�� ����(promotion), �������� ��ü����(detail_map), ���� �󼼺���(detail_view) ���� ��
function openLayerPopup(optn) {
	/*	Ư������X
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

		// ���� ã�� ����� ù��° ������ �߽������� ����.
		if ($(map.markerLayer).find('.marker_box').length > 0) {
			var map_st_xpos = $(map.markerLayer).find('.marker_box').find('.marker_info').data('st_ypos');
			var map_st_ypos = $(map.markerLayer).find('.marker_box').find('.marker_info').data('st_xpos');
			largeMap.setCenter(map_st_ypos, map_st_xpos, 13);
		} else {
			largeMap.setZoomLevel(13);
		}

		// ������ �������� ���, addMarker �� ���̾� �˾� ���� ������ ��Ŀ�� ������ �ʴ� ���� �߻�. -> ���̾� �˾� ��� �Ŀ� ������ ��Ŀ�� �ٽ� �ҷ��;� ��.
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

//���� �ʱ�ȭ
function initMaps(param_st_xpos, param_st_ypos) {
	var mapOptions = {
		startx : param_st_ypos, // ���� ������ǥX (�浵)
		starty : param_st_xpos, // ���� ������ǥY (����)
		startlevel : 14	// ���� ��ô ���� ����
	};
 
	// ���� ����  (��ü ����)
	map = new gcen.api.maps.Map(document.getElementById("map_canvas"), "https://dmap.gcen.co.kr/dmap201702/tile.png", mapOptions);
	map.setActionControl("markerclick"); // ���� ��� ��ĿŬ���� �ٲ�
	//map.levelBarShow(); // ������ �����ֱ� -> �����ٸ� �����ϸ� id�� �̺�Ʈ�� �����ϰ� �Ǿ��־ 3���� �ʿ� ���ؼ� ������ �Ұ����� 

	// Ȯ�뺸�� ���� (��ü ����)
	largeMap = new gcen.api.maps.Map(document.getElementById("map_large_canvas"), "https://dmap.gcen.co.kr/dmap201702/tile.png", mapOptions);
	largeMap.setActionControl("markerclick"); // ���� ��� ��ĿŬ���� �ٲ�
	//largeMap.levelBarShow();

	// �󼼺��� ���� (���� 1���� ���� ���� ǥ��)
	detailMap = new gcen.api.maps.Map(document.getElementById("map_detail_canvas"), "https://dmap.gcen.co.kr/dmap201702/tile.png", mapOptions);
	detailMap.setActionControl("markerclick"); // ���� ��� ��ĿŬ���� �ٲ�
	//detailMap.levelBarShow();
}

/*
 Ư������X
 
 Ư������ ���� ���� ã��.
function schAllPrmt() {
	$('#region_code_1, #region_code_2, #branch_name').val('');
	$('#schPrmt').addClass('active');	// Ư�� ���θ��

	var paramArr = [];
	paramArr[0] = 'pageNo=1';
	paramArr[1] = 'schAllPrmt=Y';
	appendBranch(paramArr);
}

// Ư�� ���θ�� on/off ��ư ��� �� �˻�
function toggleSpclPrmtn(thisArea) {
	$(thisArea).toggleClass('active');

	// �˻�� �ùٸ��� ���� ���, Ư�� ���θ�� �˻� ��� ���� ����
	var schGubun = $('ul.btn_tab > li.active').data('val');
	var result = findBranch(schGubun);
	if (!result) {
		$(thisArea).toggleClass('active');
	}
} */

//���� ��ü�� ��Ŀ ��ġ �����ϱ�.
//@param mapObj			��Ŀ �߰��� ���� ��ü
//@param branchObj		���� �� ����
//@param detailBtnYn	�󼼺��� ��ư ���� ����
function addMarker(mapObj, branchObj, detailBtnYn) {
/*	���� X
	var onSale = branchObj.wrapp_sales;
	var offSale = (!!!branchObj.off_wrapp_sale) ? onSale : branchObj.off_wrapp_sale;
 */
	// ��Ŀ ����â ����
	var infoDiv = '<c:forEach items="${shoplist }" var="shoplist" varStatus="loop">';
	infoDiv += '<div class="marker_info" data-gmapx="'+${shoplist.st_xpos}+'" data-gmapy="'+${shoplist.st_ypos}+'" style="display: none;">';
	infoDiv += '<strong>' + ${shoplist.st_name} + '</strong>'
			/* �湮�������� X
			+'<div>'
			+'	<ul>'
			+'		<li>�¶��� �湮���� '+ onSale +'%</li>'
			+'		<li>�������� �湮���� '+ offSale +'%</li>'
			+'	</ul>'
			+'</div>';
			 */
	if (detailBtnYn) {
		infoDiv += '<div class="btn_wrap">'
		+'	<div class="btn_fix_rgt">'
		+'		<a href="javascript:openDetailPop(\'' + ${shoplist.st_no} + '\');" class="btn"><span class="btn_txt">�󼼺���</span></a>'
		+'	</div>'
		+'</div>';
	}
	infoDiv += '</div>';
	infoDiv += '</c:forEach>';

	// ��Ŀ Ŭ�� �̺�Ʈ ���
	var branchMarker = new gcen.api.maps.Marker(branchObj.st_ypos, branchObj.st_xpos, markerImg, 77, 68); // ��Ŀ����
	$(branchMarker.markerbox).append(infoDiv);
	branchMarker.attach('click', function() {
		var markerboxObj = this.markerbox;
		if ($(markerboxObj).find('.marker_info').is(":visible")) {
			// �ٽ� �� ���� ��, ����â ����
			$(markerboxObj).find('.marker_info').hide();
		} else {
			// �� ���� ��, �ٸ� ���� ���� â �ݰ� �ش� �ɿ� ���� ����â ����
			$(markerboxObj).parent().find('.marker_info').hide();
			$(markerboxObj).find('.marker_info').show();
		}
	});

	mapObj.addMarker(branchMarker); // ���� ������ ��Ŀ �߰�
}

//��� ���� ���� ǥ��
function markAllBranchs() {
	largeMap.clearMarkers();

	$.ajax({
		url: '/branch/allListAjax',
		type: 'get',
		dataType: 'json',
		async: false,
		success: function(data) {
			$.each(jQuery.parseJSON(data.resultData.positionListStr), function(index, branch) {
				addMarker(largeMap, branch, true);	// Ȯ�� ���� ������ ��Ŀ �߰�
			});
		}
	});
}



//���� ã��
//@param optn	�ּҷ� �˻�(address), ����� �˻�(name) ���� ��
function findBranch(optn) {
	if (!!!optn) return false;

	// �˻� �� ������ ��ȣ �ʱ�ȭ
	pageNo = 1;

	// �˻� �Ķ���� ����
	var paramArr = [];
	paramArr[0] = 'pageNo=' + pageNo;

	if (optn == 'st_addr') {
		if ($('#region_code_1').val() == '') {
			alert('��/���� �������ּ���.');
			return false;
		} else if ($('#region_code_2').val() == '') {
			alert('��/���� �������ּ���.');
			return false;
		}

		paramArr[1] = 'region_code_2=' + $('#region_code_2').val();
	} else if (optn == 'name') {
		if ($('#name').val().length == 0) {
			alert('������� �Է����ּ���.');
			return false;
		}

		paramArr[1] = 'name=' + encodeURIComponent(encodeURIComponent($('#name').val()));
	} else {
		return false;
	}

	appendBranch(paramArr);

	return true;
}


//�� ���� ���̾� �˾� ����
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
				if (branch.branch_code == '86614') {// ���� ��â�� ����þ���
					businessHours = '���� 11:00~21:00 / �ָ� 11:00~22:00';
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
				$('#detail_name').text('���̳����� ' + branch.branch_name);
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

				// notice&event ����
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

				// ���̾� �˾� ����
				if(branch.branch_code == "86508"){
					alert('"û���� + �Ｚ�� �պ�� �ȳ�"\n2017.08.21(��)���� ���� ���̳����� û���� ����� ���̳����� �Ｚ������ �̿� ��Ź�帳�ϴ�.');
					location.href = "/main";
				}else{
					openLayerPopup('detail_view');

					detailMap.clearMarkers();
					addMarker(detailMap, branch, false);	// ������ ��Ŀ �߰�
					detailMap.setCenter(branch.st_ypos, branch.st_xpos, 14);
				}
			}
		},
		error: function() {
			// alert('ó������ ������ �߻��߽��ϴ�.');
		}
	});
}

//���� ���� ��ȸ �� html �׸���
//@param	paramArr	 �˻��� ���� �Ķ����(�ʼ�)
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
					// ��ü ��� ����
					$('#em_total_count').text(totalCount);

					// redraw marker
					map.clearMarkers();
				}

				if (totalCount == 0) {
					$('#div_has_result').hide();
					$('#div_no_result').show(); // ����˻� ����� �������� �ʽ��ϴ�.
				} else {
					$('#div_no_result').hide();
					$('#div_has_result').show();

					$.each(branchList, function(index, branch) {

						// ������ ��Ŀ ǥ��.
						addMarker(map, branch, true);

						// ���� ��� html
						var st_addr = '';
						if (branch.road_addr_ba != null) {
							st_addr = branch.road_addr_ba + ((!!branch.road_addr_de) ? ' ' + branch.road_addr_de : '');
						} else if (branch.addr_ba != null) {
							st_addr = branch.addr_ba + ((!!branch.addr_de) ? ' ' + branch.addr_de : '');
						}
/* 						���� X
						var onSale = branch.wrapp_sales,
							offSale = (!!!branch.off_wrapp_sale) ? onSale : branch.off_wrapp_sale;
 */
						htmlStr += '<li>';
						htmlStr += '	<div class="shopcard">';
						htmlStr += '	<c:forEach items="${shoplist }" var="shoplist" varStatus="loop">';
						htmlStr += '		<div class="shopcard_content">';
						
/* 						�湮�������� X
						htmlStr += '			<div class="shopcard_tag">';
						htmlStr += '				<div class="store_tag online_tag">';
						htmlStr += '					<p class="tag_title">�湮����</p>';
						htmlStr += '					<span class="tag_info">ON<br>LINE</span>';
						htmlStr += '					<span class="tag_sale">'+onSale+'<em>%</em></span>';
						htmlStr += '				</div>';
						htmlStr += '				<div class="store_tag offline_tag">';
						htmlStr += '					<p class="tag_title">�湮����</p>';
						htmlStr += '					<span class="tag_info">OFF<br>LINE</span>';
						htmlStr += '					<span class="tag_sale">'+offSale+'<em>%</em></span>';
						htmlStr += '				</div>';
						htmlStr += '			</div>'; */
						
						htmlStr += '			<p class="title">'+ ${shoplist.st_name} +'</p>';
						htmlStr += '			<p class="st_addr">'+ ${shoplist.st_addr} +'</p>';
						//htmlStr += '			<p class="distance">15 KM</p>';
						htmlStr += '			<p class="phone_num"><span class="ico ico_s_phone"></span>'+ ${shoplist.st_tel} +'</p>';
						htmlStr += '			<div class="btn_box">';
						htmlStr += '				<a href="#none" onclick="openDetailPop('+ ${shoplist.st_no} +');" class="btn"><span class="btn_txt">�󼼺���</span></a>';
/* 			����X		htmlStr += '				<a href="javascript:goBasketWrapp('+branch.branch_code+');" class="btn btn_red"><span class="btn_txt">�湮����</span></a>'; */
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
							htmlStr += '			<p class="sale_txt">Ư������</p>';
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
						// �˻� ��� ù��° ������ ������ ǥ��
						map.setCenter(branchList[0].st_ypos, branchList[0].st_xpos, 13);
					}
				} else {
					$('#ul_shop_list').append(htmlStr);
				}

				var navi = data.resultData.navi;
				if (navi.pageNo < navi.lastPageNo && navi.lastPageNo > 1) { // ajax ������ ���
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
				} else if (navi.pageNo != 1) { // ����¡ ��� ����.
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
		alert('"û���� + �Ｚ�� �պ�� �ȳ�"\n2017.08.21(��)���� ���� ���̳����� û���� ����� ���̳����� �Ｚ������ �̿� ��Ź�帳�ϴ�.');
		location.href = "/main";
	}else{
		
			if(!confirm("�α����� �ʿ��� �����Դϴ�.\n�α��� �Ͻðڽ��ϱ�?")) {
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
				<li><span>����ã��</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>����ã��</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="tab_type">
			<ul class="btn_tab">
				<li class="active" data-val="st_addr"><a href="#" onclick="navTabs('st_addr', this); return false;">�ּҷ� �˻�</a></li>
				<li data-val="st_name"><a href="#" onclick="navTabs('st_name', this); return false;">����� �˻�</a></li>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">

					<div class="form_container">
						<!-- �ּҷ� ã�� �˻� ���� -->
						<div class="form_group selbox" id="div_addr_srch">
							<div class="form_field">
								<div class="sel_box">
									<select id="region_code_1" onchange="getRegion();">
										<option value="">��/��</option>
										<option value="01"  selected >����</option>
										<option value="02" >��õ</option>
										<option value="03" >���</option>
										<option value="04" >����</option>
										<option value="05" >�泲</option>
										<option value="06" >���</option>
										<option value="07" >����</option>
										<option value="08" >�泲</option>
										<option value="09" >���</option>
										<option value="10" >�뱸</option>
										<option value="11" >����</option>
										<option value="12" >����</option>
										<option value="13" >����</option>
										<option value="14" >���</option>
										<option value="15" >�λ�</option>
										<option value="16" >����</option>
										<option value="17" >����Ư����ġ��</option>
									</select>
								</div>
							</div>
							<div class="form_field">
								<div class="sel_box">
									<select class="sido2" id="region_code_01" >
										<option value="">��/��</option>
										<option value="0111" >������</option>
										<option value="0110" >������</option>
										<option value="0117" >���ϱ�</option>
										<option value="0124" >������</option>
										<option value="0120" >���Ǳ�</option>
										<option value="0118" >������</option>
										<option value="0121" >���α�</option>
										<option value="0122" selected>��õ��</option>
										<option value="0115" >�����</option>
										<option value="0108" >������</option>
										<option value="0106" >���빮��</option>
										<option value="0123" >���۱�</option>
										<option value="0104" >������</option>
										<option value="0103" >���빮��</option>
										<option value="0113" >���ʱ�</option>
										<option value="0109" >������</option>
										<option value="0112" >���ϱ�</option>
										<option value="0114" >���ı�</option>
										<option value="0125" >��õ��</option>
										<option value="0119" >��������</option>
										<option value="0116" >��걸</option>
										<option value="0105" >����</option>
										<option value="0102" >���α�</option>
										<option value="0101" >�߱�</option>
										<option value="0107" >�߶���</option>
									</select>
									
									<select class="sido2" id="region_code_02" >
										<option value="">��/��</option>
										<option value="0202">��籸</option>
										<option value="0203">����</option>
										<option value="0204">������</option>
										<option value="0206">����</option>
										<option value="0207">����</option>
										<option value="0208">������</option>
										<option value="0210">�߱�</option>
									</select>
									<select class="sido2" id="region_code_03">
										<option value="">��/��</option>									
										<option value="0301">����</option>
										<option value="0302">��õ��</option>
										<option value="0303">�����</option>
										<option value="0304">���ֽ�</option>
										<option value="0305">������</option>
										<option value="0306">������</option>
										<option value="0307">������</option>
										<option value="0308">�����ֽ�</option>
										<option value="0309">����õ��</option>
										<option value="0310">��õ��</option>
										<option value="0311">������</option>
										<option value="0312">������</option>
										<option value="0313">�����</option>
										<option value="0314">�Ȼ��</option>
										<option value="0315">�ȼ���</option>
										<option value="0316">�Ⱦ��</option>
										<option value="0327">���ֽ�</option>
										<option value="0317">����</option>
										<option value="0318">���ֱ�</option>
										<option value="0320">�����</option>
										<option value="0321">���ν�</option>
										<option value="0322">�ǿս�</option>
										<option value="0323">�����ν�</option>
										<option value="0324">��õ��</option>
										<option value="0325">���ֽ�</option>
										<option value="0328">���ý�</option>
										<option value="0329">��õ��</option>
										<option value="0330">�ϳ���</option>
										<option value="0331">ȭ����</option>
									</select>
									<select class="sido2" id="region_code_04">
										<option value="">��/��</option>																			
										<option value="0401">������</option>
										<option value="0403">���ؽ�</option>
										<option value="0404">��ô��</option>
										<option value="0405">���ʽ�</option>
										<option value="0408">������</option>
										<option value="0409">���ֽ�</option>
										<option value="0410">������</option>
										<option value="0411">������</option>
										<option value="0412">ö����</option>
										<option value="0413">��õ��</option>
										<option value="0414">�¹��</option>
										<option value="0415">��â��</option>
										<option value="0416">ȫõ��</option>
										<option value="0418">Ⱦ����</option>
									</select>
									<select class="sido2" id="region_code_05">
										<option value="">��/��</option>									
										<option value="0501">����</option>
										<option value="0502">���ֽ�</option>
										<option value="0504">����</option>
										<option value="0505">������</option>
										<option value="0506">���ɽ�</option>
										<option value="0508">�����</option>
										<option value="0510">�ƻ��</option>
										<option value="0513">õ�Ƚ�</option>
										<option value="0516">ȫ����</option>
									</select>
									<select class="sido2" id="region_code_06">	
										<option value="">��/��</option>										
										<option value="0606">������</option>
										<option value="0607">��õ��</option>
										<option value="0608">����</option>
										<option value="0610">û����</option>
										<option value="0611">û�ֽ�</option>
										<option value="0612">���ֽ�</option>
									</select>
									<select class="sido2" id="region_code_07">	
										<option value="">��/��</option>										
										<option value="0701">�����</option>
										<option value="0702">����</option>
										<option value="0703">����</option>
										<option value="0704">������</option>
										<option value="0705">�߱�</option>
									</select>
									<select class="sido2" id="region_code_08">	
										<option value="">��/��</option>										
										<option value="0801">������</option>
										<option value="0802">��â��</option>
										<option value="0804">���ؽ�</option>
										<option value="0806">�����</option>
										<option value="0807">�о��</option>
										<option value="0808">��õ��</option>
										<option value="0810">����</option>
										<option value="0812">���ֽ�</option>
										<option value="0813">���ؽ�</option>
										<option value="0815">â����</option>
										<option value="0816">�뿵��</option>
									</select>
									<select class="sido2" id="region_code_09">
										<option value="">��/��</option>											
										<option value="0901">����</option>
										<option value="0902">���ֽ�</option>
										<option value="0904">���̽�</option>
										<option value="0906">��õ��</option>
										<option value="0907">�����</option>
										<option value="0909">���ֽ�</option>
										<option value="0911">�ȵ���</option>
										<option value="0914">���ֽ�</option>
										<option value="0915">��õ��</option>
										<option value="0922">ĥ�</option>
										<option value="0923">���׽�</option>
									</select>
									<select class="sido2" id="region_code_10">	
										<option value="">��/��</option>										
										<option value="1001">����</option>
										<option value="1002">�޼���</option>
										<option value="1003">�޼���</option>
										<option value="1004">����</option>
										<option value="1005">�ϱ�</option>
										<option value="1007">������</option>
										<option value="1008">�߱�</option>
									</select>
									<select class="sido2" id="region_code_11">	
										<option value="">��/��</option>										
										<option value="1104">�����</option>
										<option value="1106">���ֽ�</option>
										<option value="1108">������</option>
										<option value="1109">���ȱ�</option>
										<option value="1111">��õ��</option>
										<option value="1113">������</option>
										<option value="1122">ȭ����</option>
									</select>
									<select class="sido2" id="region_code_12">	
										<option value="">��/��</option>										
										<option value="1202">�����</option>
										<option value="1203">������</option>
										<option value="1204">������</option>
										<option value="1205">���ֱ�</option>
										<option value="1209">�ͻ��</option>
										<option value="1212">���ֽ�</option>
										<option value="1213">������</option>
									</select>
									<select class="sido2" id="region_code_13">	
										<option value="">��/��</option>										
										<option value="1301">���걸</option>
										<option value="1302">����</option>
										<option value="1303">����</option>
										<option value="1304">�ϱ�</option>
										<option value="1305">����</option>
									</select>
									<select class="sido2" id="region_code_14">	
										<option value="">��/��</option>										
										<option value="1401">����</option>
										<option value="1402">����</option>
										<option value="1403">�ϱ�</option>
										<option value="1404">���ֱ�</option>
										<option value="1405">�߱�</option>
									</select>
									<select class="sido2" id="region_code_15">	
										<option value="">��/��</option>										
										<option value="1501">������</option>
										<option value="1502">������</option>
										<option value="1503">���屺</option>
										<option value="1504">����</option>
										<option value="1506">������</option>
										<option value="1507">�λ�����</option>
										<option value="1508">�ϱ�</option>
										<option value="1509">���</option>
										<option value="1510">���ϱ�</option>
										<option value="1511">����</option>
										<option value="1512">������</option>
										<option value="1513">������</option>
										<option value="1514">������</option>
										<option value="1516">�ؿ�뱸</option>
									</select>
									<select class="sido2" id="region_code_16">	
										<option value="">��/��</option>										
										<option value="1601">��������</option>
										<option value="1602">���ֽ�</option>
									</select>
									<select class="sido2" id="region_code_17">	
										<option value="">��/��</option>										
										<option value="1701">������</option>
									</select>
									
								</div>
							</div>
							<div class="form_field">
								<a href="#" class="btn btn_red btn_srch" onclick="findBranch('st_addr'); return false;"><span class="btn_txt">�˻�</span></a>
							</div>
						</div>
						<!-- // �ּҷ� ã�� �˻� ���� -->
						<!-- ��������� ã�� �˻� ���� -->
						<div class="form_group selbox" id="div_name_srch" style="display: none;">
							<div class="form_field">
								<div class="form_item">
									<label for="st_name" class="i_label">����� �˻�</label>
									<input type="text" id="st_name" class="i_text">
								</div>
							</div>
							<div class="form_field">
								<a href="#" class="btn btn_red btn_srch" onclick="findBranch('st_name'); return false;"><span class="btn_txt">�˻�</span></a>
							</div>
						</div>
						<!-- // ��������� ã�� �˻� ���� -->
					</div>
					<!-- //form_container -->
<!-- 
				Ư������X
					<div class="special_offer">
						<a href="#" onclick="schAllPrmt(); return false;" class="btn btn2"><span class="btn_txt">Ư������ ���� ����ã��</span></a>
						<p onclick="openLayerPopup('promotion'); return false;"><span class="ico ico_ex_mark"></span><em>Ư������ �ȳ�</em></p>
					</div>
					 -->
				</div>

			</div>
		</div>
		<!-- //tab_menu -->

		<div class="shop_totalnum">
			<p>�� <em id="em_total_count">0</em>���� ����</p>
<!-- Ư������X <span>Ư�� ���θ��<a href="#" class="btn_ico btn_on_off" onclick="toggleSpclPrmtn(this); return false;" id="schPrmt"></a></span> -->
		</div>
		<!-- //shop_totalnum -->

		<div class="findresult_map" id="div_no_result" style="display: none;">
			<div class="result_empty">
				<span class="ico ico_findmap_null"></span>
				<p>�˼��մϴ�.<br>����˻� ����� �������� �ʽ��ϴ�.</p>
				<!-- 2016-10-13 // ��ü���庸�� ��ư �߰�(s) -->
				<a href="#" onclick="openLayerPopup('detail_map'); return false;" class="btn btn_mdle btn_gray btn_basic"><span class="btn_txt">��ü ���庸��</span></a>
				<!-- 2016-10-13 // ��ü���庸�� ��ư �߰�(e) -->
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
												<a href="javascript:openDetailPop('86520');" class="btn"><span class="btn_txt">�󼼺���</span></a>	
												</div>
											</div>
									</div> <!-- marker_info -->	
										
										
										
										<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d2da6f30f4df7d35993f892c831fc0ee"></script>
											<script>
												var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
													st_xpos = 37.4783093 * 1.0,
													st_ypos = 126.89102460000004 * 1.0,
												    mapOption = {
												        center: new daum.maps.LatLng(st_xpos, st_ypos), // ������ �߽���ǥ
												        level: 3, // ������ Ȯ�� ����
												        mapTypeId : daum.maps.MapTypeId.ROADMAP // ��������
												    }; 
												// ������ �����Ѵ� 
												var map = new daum.maps.Map(mapContainer, mapOption); 
												// ��Ŀ �̹����� �ּ� ���н� 'http://i66.tinypic.com/28ovbk.png' �Է�
												var markerImageUrl = 'http://imageshack.com/a/img922/3816/bBfeoC.png', 
												    markerImageSize = new daum.maps.Size(70, 78), // ��Ŀ �̹����� ũ��
												    markerImageOptions = { 
												        offset : new daum.maps.Point(20, 42)// ��Ŀ ��ǥ�� ��ġ��ų �̹��� ���� ��ǥ
												    };
												// ��Ŀ �̹����� �����Ѵ�
												var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
										
												// ������ ��Ŀ�� �����ϰ� ǥ���Ѵ�
												var marker = new daum.maps.Marker({
												    position: new daum.maps.LatLng(st_xpos, st_ypos), // ��Ŀ�� ��ǥ
												    image : markerImage, // ��Ŀ�� �̹���
												    map: map // ��Ŀ�� ǥ���� ���� ��ü
												});
										
												// ��Ŀ�� mouseover �̺�Ʈ�� ����Ѵ�
												daum.maps.event.addListener(marker, 'mouseover', function() {
												    console.log('��Ŀ�� mouseover �̺�Ʈ�� �߻��߽��ϴ�!');
												});
										
												// ��Ŀ�� mouseout �̺�Ʈ ���
												daum.maps.event.addListener(marker, 'mouseout', function() {
												    console.log('��Ŀ�� mouseout �̺�Ʈ�� �߻��߽��ϴ�!');
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
<!-- 							��������X			
								<div class="shopcard_tag">				
									<div class="store_tag online_tag">					
										<p class="tag_title">�湮����</p>					
										<span class="tag_info">ON<br>LINE</span>					
										<span class="tag_sale">20<em>%</em></span>				
									</div>				
									<div class="store_tag offline_tag">					
										<p class="tag_title">�湮����</p>					
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
										<span class="btn_txt">�󼼺���</span>
									</a>				
									<a href="javascript:goBasketWrapp(86296);" class="btn btn_red">
										<span class="btn_txt">�湮����</span>
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

<!-- Ư������X 
	Ư������ �˾�(s)
<div class="pop_layer" id="popup_promotion"></div>
//Ư������ �˾�(e)
 -->
<!-- �������� ��ü���� �˾�(s)) -->
<div class="pop_layer pop_type" id="storeview_map">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>�������� ��ü����</h2>
		</div>
		<div class="pop_content">
			<div class="map_view">
				<div id="map">
					<div id="map_large_canvas" style="height:835px; position: relative; top:0px; background-color: rgb(229, 227, 223); overflow: auto;"></div>
				</div>
			</div>
		</div>
		<a href="#" onclick="$('.marker_info').hide(); return false;" class="btn_ico btn_close">�ݱ�</a>
	</div>
</div>
<!-- //�������� ��ü���� �˾�(e) -->

<!-- ���� �󼼺��� �˾�(s)) -->
<div class="pop_layer pop_type" id="storeview_detail">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>���� �󼼺���</h2>
		</div>
		<div class="pop_content">
			<input type="hidden" id="st_no" value="" />
			<div class="storeview_title">
				<p id="detail_name">���̳����� ������</p>
<!-- 				
				�湮��������
				<div class="sale_tag">
					<div class="store_tag online_tag">
						<p class="tag_title">�湮����</p>
						<span class="tag_info">ON<br>LINE</span>
						<span class="tag_sale"><span id="detail_on_sale"></span><em>%</em></span>
					</div>
					<div class="store_tag offline_tag">
						<p class="tag_title">�湮����</p>
						<span class="tag_info">OFF<br>LINE</span>
						<span class="tag_sale"><span id="detail_off_sale"></span><em>%</em></span>
					</div>
				</div> -->
			</div>
			<!-- //title -->

			<div class="btn_wrap">
				<div class="btn_fix_lft">
					<a href="#" class="btn btn_mdle btn_red" id="detail_basket_wrapp"><span class="btn_txt">�湮���� �ֹ��ϱ�</span></a>
				</div>
			</div>
			<!-- //button -->

<!-- 
			Ư������X
			<div class="sale_area">
				<div class="pop_content_wrapper">
					<p class="sale_txt">Ư������</p>
					<p class="sale_list" id="detail_sale_info">
						Ư������(L)��� 30%, Ŭ���� 5�� �湮����, Ŭ���� 5�� �湮����
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
									<div class="info_title"><span class="ico ico_store_info2"></span><span class="txt_store">�Ÿ�</span></div>
									<div class="info_desc">15 Km</div>
								</li> -->
								<li>
									<div class="info_title"><span class="ico ico_store_info"></span><span class="txt_store">��ȭ��ȣ</span></div>
									<div class="info_desc" id="detail_tel">${st_tel }</div>
								</li>
								<li>
									<div class="info_title"><span class="ico ico_store_info3"></span><span class="txt_store">�ּ�</span></div>
									<div class="info_desc" id="detail_address">${st_addr }</div>
								</li>
								<li>
									<div class="info_title"><span class="ico ico_store_info4"></span><span class="txt_store">�����ð�</span></div>
									<div class="info_desc" id="detail_business_hours">${st_time }</div>
								</li>
<!-- 								<li>
									<div class="info_title"><span class="ico ico_store_info5"></span><span class="txt_store">��ġ����</span></div>
									<div class="info_desc" id="detail_location_info">����ö 6ȣ�� ���꿪 3���ⱸ��</div>
								</li> -->
								<li>
									<div class="info_title"><span class="ico ico_store_info6"></span><span class="txt_store">��������</span></div>
									<div class="info_desc" id="detail_parking_info">${st_parkin }</div>
								</li>
								<li>
									<!-- ���� ���� X <div class="info_title"><span class="ico ico_store_info7"></span><span class="txt_store">Notice &amp;<br>Event</span></div> -->
									<!-- ���庰 ���� X <div class="info_desc"><em id="detail_notice">����ֹ� 25% ����</em></div> -->
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
		<a href="#" class="btn_ico btn_close">�ݱ�</a>
	</div>
</div>
<!-- //���� �󼼺��� �˾�(e) -->

<!-- �ε� �̹��� -->
		<div class="loading" id="defaultLoading" style="display:none;">
			<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/loading.gif" alt="loading">
			<div class="dim"></div>
		</div>
		<!-- // �ε� �̹��� -->

		<!-- ��ٱ��� ��� �佺Ʈ �˾�(s) -->
		<div class="pop_toast" id="card_add">
			<div class="bg"></div>
			<div class="pop_wrap">
				<div class="pop_content">
					<p>��ٱ��Ͽ� ��ҽ��ϴ�.</p>
				</div>
			</div>
		</div>

		<!-- //��ٱ��� ��� �佺Ʈ �˾�(e) -->

		<!-- ��ٱ���(s) -->
		<div class="pop_layer pop_type" id="cart_pop">
			<div class="bg"></div>
			<div class="pop_wrap">
				<div class="pop_header">
					<h2>��ٱ���</h2>
				</div>
				<!-- iframe src="100_cart_pop_frame.html" width="1000" height="832" frameborder="0"></iframe><!-- 2016-10-05//���������Ӵ�ü -->
				<a href="javascript:;" onclick="setBasketCnt();" class="btn_ico btn_close">�ݱ�</a>
			</div>
		</div>
		<!-- //��ٱ���(e) -->

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
	
	<!-- Naver Anlytics ����-->
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
	<script type="text/javascript">
	if (!wcs_add) var wcs_add={};
	wcs_add["wa"] = "s_273c36e36e8a";
	if (!_nasa) var _nasa={};
	wcs.inflow("dominos.co.kr");
	wcs_do(_nasa);
	</script>
	<!-- // Naver Anlytics ���� -->

	<!-- Google Tag Manager : dominos_web -->
	<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TR97KL" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-TR97KL');</script>
	<!-- End Google Tag Manager -->

<!-- 2017-05-08 // ê�� �߰�(s) -->

<div class="layer_chat">
	<div class="dim"></div>
	<div class="layer_content">
		<iframe id="chatUrl" src="" frameborder="0"></iframe>
		<a href="#" class="btn_close">�ݱ�</a>
	</div>
</div>
<!-- 2017-05-08 // ê�� �߰�(e) -->
		
</body>
<script>
cookieManager.makePCID("PCID", 10);
</script>
</html>
