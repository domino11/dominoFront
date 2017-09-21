<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
    
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="euc-kr">
<title>도미노피자</title>
<meta name="viewport" id="viewport" content="width=1119px, user-scalable=yes">
<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css">
<script type="text/javascript" src="/resources/js/jquery1.11.1.js"></script>
<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
<script type="text/javascript" src="/resources/js/d2CommonUtil.js"></script>
</head>
<body>

<script>


//구글 맵 API키값:AIzaSyDmAha71igXMISM4aYIpTHXnsUfEM6MfTc
//주소로 위치 찾기용
var geocoder;
//지도 표시용
var map;
var latitude;
var longitude;
window.onload = function () {
if (navigator.geolocation) {
  //현재위치의 위도/경도 얻기]
  navigator.geolocation.getCurrentPosition(showLocation);
  //주소로 위치 찾기위한 지오코드 얻기]
  geocoder = new google.maps.Geocoder();
}

};////////////////////onload

var showLocation = function (position) {
//위도 얻기]
var latitude = position.coords.latitude;
//경도 얻기]
var longitude = position.coords.longitude;

map = new google.maps.Map(document.getElementById('map'), {
  center: { lat: latitude, lng: longitude },
  scrollwheel: false,
  zoom: 16
});

//Create a marker and set its position.
var marker = new google.maps.Marker({
 /* map: map,*/
  position: { lat: latitude, lng: longitude },
  title: '한국소프트웨어 인재개발원'
});
//위의 map: map,를 주석처리시 아래 메소드로 마커 표시
marker.setMap(map);


}/////////////////////showLocation
function test() {
var address = document.getElementById('addr1').value;
    address = address.split("(")[0];
    
    
geocoder.geocode({ 'address': address }, function (results, status) {
  if (status == 'OK') {
	  map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
  } else {
      alert(' 주소 호출시 오류가 발생하였습니다. 관리자에게 문의해주세요!!ㅠㅠ ' + status);
  }
  var ret = results[0].geometry.location;

  top.document.location.href="<c:url value='AddrIn.pz' />?ret="+ret+"&addr="+address;
  
});

}



</script>

		<div style="visibility: hidden;" >
		
        <div id="map" style="width:0px;height:0px"></div>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDmAha71igXMISM4aYIpTHXnsUfEM6MfTc"
                async defer></script>
		</div>



<form id="searchFrm" name="searchFrm" id="searchFrm" action="/" method="get" onsubmit="return searchBranch();">
<input type="hidden" name="xdot" id="xdot" value="" />
<input type="hidden" name="ydot" id="ydot" value="" />
<input type="hidden" name="zip2" id="zip2" value=""/>
<input type="hidden" name="zip3" id="zip3" value=""/>
<input type="hidden" name="zip3_r" id="zip3_r" value=""/>
<input type="hidden" name="zip4_r" id="zip4_r" value=""/>
<input type="hidden" name="zip3_sub" id="zip3_sub" value=""/>
	<div class="pop_content adr_add_frame"><!-- 프레임html영역클래스구별 : adr_add_frame -->
		<div class="tab tab_type2">
			<ul class="btn_tab">
			
			
				<li class="active" data-val="R"><a>도로명 주소</a></li>
				
				
				
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">
					<div class="adr_form">
						<ul id="typeR">
							
					

							<li class="form_adr_srch">
								<label for="adr_srch">우편 번호</label>
								<div class="form_group">
								
									<div class="form_field">
										<div class="form_item">
										<input type="text" id="post1" class="i_text input0" readonly="" size="5" name="post1">
										
										<input style="margin-top: 2px" type="text" id="post2" class="i_text input0"  readonly="" size="5" name="post2">
										
										</div>
									</div>
									<div class="form_field">
										<div class="form_item">
											<a onclick="openDaumPostcode();" style="cursor:pointer" class="btn"><span class="btn_txt">주소 검색</span></a>
										</div>
									</div>
									
								</div>

							</li>

						</ul>
					</div>
				</div>
				
				
				
			</div>
		</div>
		<div class="adr_form">
			<ul>


				<li class="form_adr_srch">
					<div class="lst_adr">
						
						<p>※ 시/군/구, 동/면/읍, 번지/건물명이 없는 경우는 배달이 불가능한<br>지역입니다. 이러한 경우에는 주소를 입력하지 않아도 회원가입이<br>정상적으로 이뤄집니다.<br></p>
					</div>
				</li>
				<li class="form_adr_detail">
					<label for="ip_adr_detail">상세주소</label>
					<div class="form_group">
						<div class="form_field">
							<div class="form_item">
							
								<input type="text" name="zip_code_4" id="addr1"  class="i_text" readonly  title="주소 입력"/>
							</div>
						</div>
					</div>
					<div class="form_group">
						<div class="form_field">
							<div class="form_item">
								<input type="text" name="detail_address" id="addr2" value="" maxlength="50" onkeypress="if(event.keyCode==13){ addDelivery();return false; }" class="i_text" placeholder="한글 25자까지 입력 가능"  title="상세 주소" />
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>

		<div class="btn_wrap">
			<div class="btn_fix_center">
				<a onclick="test();" class="btn btn_red btn_mdle btn_block"><span class="btn_txt">등록하기</span></a>
			</div>
		</div>
	</div>
</form>
</body>

<script>



var param = {};
$(document).ready(function() {
	$('.tab > .btn_tab>li>a').click(function(e){
		e.preventDefault();
		var idx = $(this).parent().index();
		var tcw = $(this).closest('.btn_tab').next('.tab_content_wrap');

		$(this).parent().addClass('active').siblings().removeClass('active');
		tcw.children().eq(idx).addClass('active').siblings().removeClass('active');

		$("#zip_code_4").val("");
		$("#detail_address").val("");

		$('#addrList').html("<li>검색결과가 없습니다.</li>");

	});

	$(".input1").change(function() {
		var addrType = $(".btn_tab li.active").data("val");

		$("#type"+addrType+" .input2 option:gt(0)").remove();
		$("#type"+addrType+" .input3 option:gt(0)").remove();
		$("#type"+addrType+" .input4 option:gt(0)").remove();
		$("#type"+addrType+" .input5").val("");


		getAddrList(1, $("#zip_code_"+addrType+"2"), $(this).val(), '', '', '', '', addrType, '');
	});

	$(".input2").change(function() {
		var addrType = $(".btn_tab li.active").data("val");

		$("#type"+addrType+" .input3 option:gt(0)").remove();
		$("#type"+addrType+" .input4 option:gt(0)").remove();
		$("#type"+addrType+" .input5").val("");

		var obj = $("#zip_code_"+addrType+"3");
		if(addrType == "R") obj = $("#chosung");

		getAddrList(2, obj, $("#zip_code_"+addrType+"1").val(), $(this).val(), '', '', '', addrType, '');

	});

	$("#chosung").change(function()  {
		var addrType = $(".btn_tab li.active").data("val");

		$("#type"+addrType+" .input4 option:gt(0)").remove();
		$("#type"+addrType+" .input5").val("");

		var obj = $("#zip_code_R3");


		getAddrList(3, obj, $("#zip_code_"+addrType+"1").val(), $("#zip_code_R2").val(), '', $(this).val(), '', addrType, '');
	});

});

function getAddrList(step, obj, zip1, zip2, zip3, chosung, keyword, addr_type, dong_type) {
	$.ajax({
		type: "GET",
		url: "/delivery/getAddrAjax",
		data: {
			zip_code1 : zip1,
			zip_code2 : zip2,
			zip_code3 : zip3,
			chosung : encodeURIComponent(chosung),
			keyword : encodeURIComponent(keyword),
			addr_type : addr_type,
			dong_type : dong_type
		},
		success:function(data) {
			if(data.resultData) {
				$.each(data.resultData.result, function(i, v) {
					if(addr_type != 'R' && step == 2)
						obj.append("<option value='"+v.code+"|"+v.subdong+"'>"+v.addr+"</option>");
					else
						obj.append("<option value='"+v.code+"'>"+v.addr+"</option>");
				});
			}

		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
}


function searchBranch(){
	var addr_type = $(".btn_tab li.active").data("val");

	if($('#zip_code_' + addr_type + '1').val().isBlank()) { alert('시/군/구을 선택해주세요.'); return;}
	if($('#zip_code_' + addr_type + '2').val().isBlank()) { alert('시/군/구을 선택해주세요.'); return;}

	if(addr_type == "R") {
		if($('#chosung').val().isBlank()) { alert('초성을 선택해주세요.'); return; }
	}

	if(addr_type == "A") {
		if($('#zip_code_' + addr_type + '3').val().isBlank()) { alert('동/면/읍까지 선택후 검색 가능합니다.'); return; }
	}
	else if(addr_type == "R") {
		if($('#zip_code_' + addr_type + '3').val().isBlank()) { alert('도로명까지 선택후 검색 가능합니다.'); return; }
	}

	if(addr_type != "R") {
		if(addr_type == "C") {
			if($('#keyword_' + addr_type).val().isBlank()) { alert('검색할 건물상호를 입력해주세요.'); return; }
		}
		else {
			if($('#keyword_' + addr_type).val().isBlank()) { alert('검색할 번지를 입력해주세요.'); return; }
		}
	}

	// 건물상호, 지번 검색시 행정동, 법정동 구분 값
	var dong_type = "";
	var zip3 = "";
	if(addr_type != "R") {
		var dArr = $('#zip_code_' + addr_type + '3').val().split("|");
		zip3 = dArr[0];
		if(dArr[1] != null) dong_type = dArr[1];
	}
	else {
		zip3 = $('#zip_code_' + addr_type + '3').val();
	}

	$('#addrList').html("<li>조회중입니다...</li>");
	$.ajax({
		type: "GET",
		url: "/delivery/getAddrAjax",
		data: {
			zip_code1 : $('#zip_code_' + addr_type + '1').val(),
			zip_code2 : $('#zip_code_' + addr_type + '2').val(),
			zip_code3 : zip3,
			chosung : encodeURIComponent($('#chosung').val()),
			keyword : encodeURIComponent($('#keyword_' + addr_type).val()),
			addr_type : addr_type,
			dong_type : dong_type
		},
		success:function(data) {
			$('#zip_code_4').val('');
			$('#addrList').html("");
			if(data.resultData.result.length > 0) {
				$.each(data.resultData.result, function(i, v) {
					$('#addrList').append('<li><a href="javascript:zipcode4Click(\''+v.addr+'\', \''+v.addrSub+'\', \''+v.xdot+'\', \''+v.ydot+'\', \''+v.subdong+'\');">'+v.addr+'</a></li>');

				});
			} else {
				$('#addrList').html("<li>검색결과가 없습니다.</li>");
			}
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});

}

function zipcode4Click(obj, obj_sub, xdot, ydot, subdong){
	if(obj_sub == "null") obj_sub = "";
	if(xdot == "null") xdot = "";
	if(ydot == "null") ydot = "";
	if(subdong == "null") subdong = "";



	var addr_type = $(".btn_tab li.active").data("val");

	if(addr_type == "A") { // 지번검색
		var zip1 = $('#zip_code_' + addr_type + '1  option:selected').text();
		var zip2 = $('#zip_code_' + addr_type + '2  option:selected').text();
		var zip3 = $('#zip_code_' + addr_type + '3  option:selected').text();
		var resultZip = zip1 + " " + zip2 + " " + zip3 + " " + obj;
	}
	else {
		var objStr = obj;
		var arr = objStr.split(" ");
		$('#zip2').val(arr[1]);
		$('#zip3').val(arr[2]);
	}
	$('#zip_code_4').val(obj);

	// 매칭되는 도로명 & 지번 & 건물 처리
	if(obj_sub != "" && obj_sub != "undefined") {
		var obj_sub_arr = obj_sub.split("|");
		var zip3_r = obj_sub_arr[0];
		var zip4_r = obj_sub_arr[1];
		$('#zip3_r').val(zip3_r);
		$('#zip4_r').val(zip4_r);
	}

	// 도로명 주소 검색시 읍/면 정보 추가
	if(subdong != "" && subdong != "undefined") {
		$('#zip3_sub').val(subdong);
	}else{
		$('#zip3_sub').val("");
	}

	$('#xdot').val(xdot);
	$('#ydot').val(ydot);
	$('#detail_address').focus();
}

var proc = false;

function addDelivery(addr_type){
	var addr_type = $(".btn_tab li.active").data("val");

	if(!checkSpace($('#zip_code_' + addr_type + '1'),"시/도를 선택해주세요")) return;

	var alert_txt = "";
	if(addr_type == "A") {
		if(!checkSpace($('#zip_code_' + addr_type + '2'),"시/군/구를 선택해주세요")) return;
		if(!checkSpace($('#zip_code_' + addr_type + '3'),"동/면/읍을 선택해주세요")) return;
		alert_txt = "번지검색 후";
	}
	else if(addr_type == "R") {
		if(!checkSpace($('#chosung'),"도로 초성을 선택해주세요")) return;
		if(!checkSpace($('#zip_code_' + addr_type + '3'),"도로명을 선택해주세요")) return;
		alert_txt = "건물번호 검색 후";
	}
	else {
		if(!checkSpace($('#zip_code_' + addr_type + '2'),"시/군/구를 선택해주세요")) return;
		alert_txt = "건물상호 검색 후";
	}

	if(!checkSpace($('#zip_code_4'), alert_txt + " 해당되는 주소를 클릭해주세요.")) return;



	var zip1 = $('#zip_code_' + addr_type + '1  option:selected').text();
	var chosung = $('#chosung').val();
	var zip2, zip3, zip4;

	if(addr_type == "A" || addr_type == "R") {
		zip2 = $('#zip_code_' + addr_type + '2  option:selected').text();
		zip3 = $('#zip_code_' + addr_type + '3  option:selected').text();
		zip4 = $('#zip_code_4').val();
	}
	else {
		zip2 = $('#zip_code_' + addr_type + '2  option:selected').text();
		zip3 = "";
		var zip3Arr = $('#zip_code_4').val().split(' ');
		if($('#zip_code_' + addr_type + '3  option:selected').text() == "전체") {
			zip3 = zip3Arr[2];
			if(zip3Arr.length > 4) {
				var tmp="";
				$.each(zip3Arr, function(i, resultVal) {
					if(i > 2) {
						if(i == 3)
							tmp = tmp + resultVal;
						else if(i > 3)
							tmp = tmp + " " + resultVal;
					}
				});
				zip4 = tmp;
			}
			else {
				zip4 = zip3Arr[3];
			}
		}
		else {
			zip3 = $('#zip_code_' + addr_type + '3  option:selected').text();
			if(zip3Arr.length > 4) {
				var tmp="";
				jQuery.each(zip3Arr, function(i, resultVal) {
					if(i > 2) {
						if(i == 3)
							tmp = tmp + resultVal;
						else if(i > 3)
							tmp = tmp + " " + resultVal;
					}
				});
				zip4 = tmp;
			}
			else {
				zip4 = zip3Arr[3];
			}
		}
	}
	// 현재 등록하는 주소지에 따라 road_yn, seek_gbn을 세팅해준다.
	var road_yn = '';
	var seek_gbn = '';
	if(addr_type == "C"){ // 건물상호
		road_yn = 'N';
		seek_gbn = '2';
	}else if(addr_type == "A"){ // 지번
		road_yn = 'N';
		seek_gbn = '3';
	}else{ // 도로명
		road_yn = 'Y';
		seek_gbn = '1';
	}

	if($('#zip3_sub').val() != "") zip3 = $('#zip3_sub').val() + ' ' + zip3;

	var detail = $('#detail_address').val();

	if(proc) {
		alert("배달지 등록중입니다.");
		return;
	}

	proc = true;
 	$.ajax({
		type: "POST",
		url: "/delivery/procAjax",
		data: {
			order_gubun : "O",
			address_gubun : "1",
			zip_code1 : encodeURIComponent(zip1),
			zip_code2 : encodeURIComponent(zip2),
			zip_code3 : encodeURIComponent(zip3),
			zip_code4 : encodeURIComponent(zip4),
			chosung : encodeURIComponent(chosung),
			detail_address : encodeURIComponent(detail),
			xdot : $('#xdot').val(),
			ydot : $('#ydot').val(),
			road_yn : road_yn,
			seek_gbn : seek_gbn,
			zip_code3_r : encodeURIComponent($('#zip3_r').val()),
			zip_code4_r : encodeURIComponent($('#zip4_r').val())
		},
		success:function(data) {
			if(data.resultData.result == "success") {
				parent.addDeliveryComplete(data.resultData.delivery);
			} else if(data.resultData.result == "maxDelivery") {
				proc = false;
				alert("배달지는 최대 5개까지 등록 가능합니다.\n추가로 등록하시려면 리스트에서 불필요한 배달지를 삭제 해 주세요.");
				parent.closeLayer();
			} else if(data.resultData.result == "noDelivery") {
				proc = false;
		 		alert("해당 지역은 배달이 불가능한 지역입니다.\n전화(1577-3082) 또는 주변매장에 직접 방문하여 주문해주시기 바랍니다.");
		 		return;
		 	} else {
				proc = false;
				alert("다시 시도해주세요.");
			}

		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});

</script>



<script>







function openDaumPostcode() {
 var width = 500; //팝업창이 실행될때 위치지정
 var height = 600; //팝업창이 실행될때 위치지정
 new daum.Postcode({
     width : width, //팝업창이 실행될때 위치지정
     height : height, //팝업창이 실행될때 위치지정
     oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

         // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
         var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
         var extraRoadAddr = ''; // 도로명 조합형 주소 변수

         // 법정동명이 있을 경우 추가한다.
         if(data.bname !== ''){
             extraRoadAddr += data.bname;
         }
         // 건물명이 있을 경우 추가한다.
         if(data.buildingName !== ''){
             extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
         }
         // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
         if(extraRoadAddr !== ''){
             extraRoadAddr = ' (' + extraRoadAddr + ')';
         }
         // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
         if(fullRoadAddr !== ''){
             fullRoadAddr += extraRoadAddr;
         }
          
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         document.getElementById("post1").value = data.postcode1;
         document.getElementById("post2").value = data.postcode2;
         document.getElementById("addr1").value = fullRoadAddr;
         document.getElementById("addr2").value = data.jibunAddress;

         document.getElementById('addr2').focus();
     }
 }).open({
     left : (window.screen.width / 2) - (width / 2), //팝업창이 실행될때 위치지정
     top : (window.screen.height / 2) - (height / 2) //팝업창이 실행될때 위치지정
 });
}



</script>
	
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
 <script src="<c:url value='/BootStrap/js/bootstrap.min.js' />" ></script>

	
	

}
</script>
</html>