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
	<!-- 2] CDN(Content Deliver Network)주소 사용-->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<!-- Deprecated 된 함수사용 -->
	<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
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
<%@include file="/WEB-INF/Pizza/template/Top.jsp" %>
<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="mypage">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="<c:url value='/Pizza/MainPage.pz' />">HOME</a></li>
				<li><a href="<c:url value='/User/MyPage_Mania.pz' />">나의 정보</a></li>
				<li><span>설정변경</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>나의 정보</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="tab tab_type4">
			<ul class="btn_tab">
				<li class="active"><a href="<c:url value='/User/MyPage_Mania.pz'/>">매니아 등급</a></li>
				<li class=""><a href="/mypage/myOrderList">주문조회</a></li>
				<li class=""><a href="<c:url value='/User/Mypage_coupon.pz'/>">쿠폰</a></li>
				<li class=""><a href="<c:url value='/User/Mypage_ChangeSetting.pz'/>">설정변경</a></li>
				
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content">1</div>
				<!-- //tab_content -->
				<div class="tab_content">2</div>
				<div class="tab_content">3</div>
				<div class="tab_content active">
					<div class="join_area">
						<div class="join_info_guide">
							<dl>
								<dt>개인정보 입력 안내문</dt>
								<dd>회원정보를 정확히 기입하셔야 주문이나 이벤트에 대한 불이익이 없습니다.</dd>
							</dl>
						</div>
						<div class="join_form">
							<ul>
								<li class="form_name">
									<label for="">이름</label>
									<span class="u_text" id="name_area"></span>
								</li>
								<li class="form_id">
									<label for="">아이디</label>
									<span class="u_text"></span>
								</li>
								<li class="form_pw v2">
									<label for="">비밀번호</label>
									<a href="javascript:;" class="btn"><span class="btn_txt">비밀번호 변경</span></a>
								</li>
								<li class="form_birth">
									<label for="birth_s">생년월일</label>
									<div class="form_group">
										<div class="form_field">
											<span class="custom_form">
												<input type="radio" name="birth_fl" id="birth_s" value="S">
												<label for="birth_s" class="ip_rdo3">
													<em></em><span>양력</span>
												</label>
											</span>
										</div>
										<div class="form_field">
											<span class="custom_form">
												<input type="radio" name="birth_fl" id="birth_m" value="M">
												<label for="birth_m" class="ip_rdo3">
													<em></em><span>음력</span>
												</label>
											</span>
										</div>
										<div class="form_field">
											<div class="sel_box" style="width:120px;">
												<select name="byear" id="byear" class="selected">
													<option value="">년</option>
												</select>
											</div>
										</div>
										<div class="form_field">
											<div class="sel_box" style="width:120px;">
												<select name="bmonth" id="bmonth" class="selected">
													<option>월</option>
												</select>
											</div>
										</div>
										<div class="form_field">
											<div class="sel_box" style="width:120px;">
												<select name="bday" id="bday" class="selected">
													<option>일</option>
												</select>
											</div>
										</div>
										<span class="i_error show"></span>
									</div>
								</li>
								<li class="form_phone">
									<label for="u_phone">휴대전화</label>
									<div class="form_group">
										<div class="form_field">
											<div class="sel_box" style="width:120px;">
												<select name="sel_hand_tel_agency" id="sel_hand_tel_agency" class="selected">
													<option value="">선택</option>
												</select>
											</div>
										</div>
										<div class="form_field">
											<div class="sel_box" style="width:120px;">
												<select name="sel_hand_tel1" id="sel_hand_tel1" class="selected">
												</select>
											</div>
										</div>
										<div class="form_field">
											<div class="form_item">
												<span class="i_label" style="position: absolute;"></span>
												<input type="text" name="hand_tel2" id="hand_tel2" maxlength="4" value="" class="i_text">
											</div>
										</div>
										<div class="form_field">
											<div class="form_item">
												<span class="i_label" style="position: absolute;"></span>
												<input type="text" name="hand_tel3" id="hand_tel3" maxlength="4" value="" class="i_text">
											</div>
										</div>
										<span class="i_error show"></span>
									</div>
								</li>
								<li class="form_email">
									<label for="u_email">이메일</label>
									<div class="form_group">
										<div class="form_field">
											<div class="form_item">
												<label for="" class="i_label" style="position: absolute;"></label>
												<input type="text" name="email1" id="email1" value="" class="i_text">
											</div>
										</div>
										<div class="form_field"><span class="txt_at">@</span></div>
										<div class="form_field">
											<div class="form_item">
												<label for="" class="i_label" style="position: absolute;"></label>
												<input type="text" name="email2" id="email2" value="" class="i_text">
											</div>
										</div>
										<div class="form_field">
											<div class="sel_box" style="width:120px;">
												<select class="selected" name="email3" id="email3">
												</select>
											</div>
										</div>
										<span class="i_error show"></span>
									</div>
								</li>
								<li class="form_num">
									<label for="">인증번호 발송</label>
									<div class="form_group">
										<div class="form_field">
											<span class="custom_form">
												<input type="radio" name="rdb_auth_type" id="rdb_auth_type1" value="H">
												<label for="rdb_auth_type1" class="ip_rdo3 checked">
													<em></em><span>휴대전화</span>
												</label>
											</span>
										</div>
										<div class="form_field">
											<span class="custom_form">
												<input type="radio" name="rdb_auth_type" id="rdb_auth_type2" value="E">
												<label for="rdb_auth_type2" class="ip_rdo3">
													<em></em><span>이메일</span>
												</label>
											</span>
										</div>
										<div class="form_field">
											<div class="form_item">
												<a href="javascript:;" class="btn"><span class="btn_txt">인증번호 발송</span></a>
											</div>
										</div>
										<span class="i_error check">- 휴대전화 번호 및 이메일 주소를 변경하셨을 경우에 한하여 인증절차를 거쳐야 정보 수정이 완료 됩니다.</span>
									</div>
								</li>
								<li class="form_num_chk">
									<label for="security_no">인증번호 입력</label>
									<div class="form_group">
										<div class="form_field">
											<div class="form_item">
												<input type="text" name="security_no" id="security_no" maxlength="20" class="i_text">
											</div>
										</div>
										<div class="form_field">
											<div class="form_item">
												<a href="javascript:;" class="btn"><span class="btn_txt">인증하기</span></a>
											</div>
										</div>
										<span class="i_error show" id="security_aleart"></span>
									</div>
								</li>
								<li class="form_info_agree">
										<label for="">정보 수신동의</label>
										<div class="form_group">
											<div class="form_field field_full">
												<span class="custom_form">
													<input type="checkbox" id="chk_dm_fl" name="chk_dm_fl" value="Y">
													<label for="chk_dm_fl" class="ip_chk">
														<em></em><span>이메일/전달 DM등을 통한 제품 및 이벤트 정보수신에 동의합니다. (선택)</span>
													</label>
												</span>
											</div>
											<div class="form_field field_full">
												<span class="custom_form">
													<input type="checkbox" id="chk_ds_fl" name="chk_ds_fl" value="Y">
													<label for="chk_ds_fl" class="ip_chk">
														<em></em><span>이메일/전달 DM등을 통한 제품 및 이벤트 정보수신에 동의합니다. (선택)</span>
													</label>
												</span>
											</div>
											<div class="lst_type">
												<ul>
													<li>정보수신 미 동의 시 이벤트 / 할인쿠폰 / 신제품 등의 안내를 받으실 수 없습니다.</li>
													<li>SMS 및 이메일 수신동의 시 방문포장 피자 40% 할인쿠폰이 제공됩니다.</li>
												</ul>
											</div>
										</div>
								</li>
								<li class="form_privacy">
									<label for="info_years1">개인정보<br>유효기간 선택</label>
									<div class="form_group">
										<div class="form_field">
											<span class="custom_form">
												<input type="radio" name="info_years" id="info_years1" value="1">
												<label for="info_years1" class="ip_rdo3 checked">
													<em></em><span>1년</span>
												</label>
											</span>
										</div>
										<div class="form_field">
											<span class="custom_form">
												<input type="radio" name="info_years" id="info_years3" value="3">
												<label for="info_years3" class="ip_rdo3">
													<em></em><span>3년</span>
												</label>
											</span>
										</div>
										<div class="form_field">
											<span class="custom_form">
												<input type="radio" name="info_years" id="info_years5" value="5">
												<label for="info_years5" class="ip_rdo3">
													<em></em><span>5년</span>
												</label>
											</span>
										</div>
										<p class="form_txt">설정하신 기간동안 로그인/주문 등의 서비스 이용이 없을 시, 휴면계정으로 처리되어 각종 이벤트/쿠폰혜택을 받아보실 수 없습니다.</p>
									</div>
								</li>
							</ul>
						</div>

						<div class="btn_wrap">
							<div class="btn_fix_center">
								<a href="javascript:location.reload();" class="btn btn_mdle btn_blue btn_basic"><span class="btn_txt">초기화</span></a>
								<a href="javascript:;" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">수정</span></a>
							</div>
						</div>
						<!-- //btn_wrap -->
						<div class="withdraw">
							도미노피자를 더 이상 이용하지 않는다면 <a href="javascript:;"><em>회원탈퇴 바로가기<span class="ico ico_more"></span></em></a>
						</div>
					</div>
					<!-- //join_area -->
					</form>
				</div>
				<!-- //tab_content -->
			</div>
			<!-- //tab_content_wrap -->
		</div>
		<!-- //tab -->
	</div>
	<!-- //content -->
</div>
<!-- //container -->

<!-- 비밀번호 확인 팝업(s) -->
<div class="pop_layer pop_type open" id="userinfo_confirm">
	<form name="popForm" id="popForm" method="post">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>비밀번호 확인</h2>
		</div>
		<div class="pop_content">
			<div class="confirm_msg">회원님의 정보를 안전하게 보호하기 <br />위해 비밀번호를 다시 한번 확인합니다.</div>

			<div class="form_box">
				<div class="lst_type_dot">
					<ul>
						<li>
							<label for="u_id">아이디</label>
							<div class="form_area">
								<p>${ID}</p>
							</div>
						</li>
						<li>
							<label for="pop_passwd">비밀번호</label>
							<div class="form_group">
								<div class="form_field">
									<div class="form_item">
										<input type="password" id="pop_passwd" name="pop_passwd" class="i_text" onkeydown="javascript:if(event.keyCode==13){confirmMemberProc(); return false;}">
									</div>
								</div>
								<span class="i_error show"id="pop_passwd_alert"></span>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<div class="btn_wrap">
				<div class="btn_fix_center">
					<a href="javascript:;" class="btn btn_mdle btn_red btn_basic" onclick="confirmMemberProc(); return false;" data-type="confirm"><span class="btn_txt">확인</span></a>
				</div>
			</div>
		</div>
		<a href="javascript:location.href = '<c:url value='/User/MyPage_Mania.pz'/>';" onclick="javascript:location.href = '<c:url value='/User/MyPage_Mania.pz'/>';" class="btn_ico btn_close" data-type="confirm">닫기</a>
	</div>
	</form>
</div>
<!-- //비밀번호 확인 팝업(e) -->
<script src="/resources/js/member.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".bg").unbind("click");
	
	var str = window.location.search;
    var objURL = {};

    str.replace(
        new RegExp( "([^?=&]+)(=([^&]*))?", "g" ),
        function( $0, $1, $2, $3 )
        {
            objURL[ $1 ] = $3;
        }
    );
	
    var token = objURL.code;
    
	if(token !== undefined && token !== '' && token !== null)
	{
		var id_type = objURL.id_type;
		
		if(id_type === 'OFF')
			alert('페이코 간편 로그인이 해제되었습니다.\n도미노피자에서 페이코 간편 로그인을 이용할 수 없습니다.');		
		else if(id_type === 'DEL')
			alert('페이코 간편 로그인이 삭제되었습니다.\n도미노피자에서 페이코 간편 로그인정보가 삭제되었습니다.');
		else if(id_type === 'ON')
			alert('페이코 간편 로그인이 되었습니다.\n도미노피자에서 페이코 간편 로그인을 이용할 수 있습니다.');
		
		if(typeof(history.pushState) == 'function')
		{
			var renewURL = location.href.split('?')[0];
			history.pushState(null, null, renewURL);
		}
		
		$.ajax({
			type: "POST",
			url: "/member/setLoginId",
			data: 
			{ 
				"token" : token,
				"id_type":id_type
			},
			dataType : "json",
			success:function(data) 
			{			
				
			},
			error: function (error)
			{
				alert("다시 시도해주세요.");
			}
		});
	}
});


//설정 변경 전 본인 확인
function confirmMemberProc(){
	if($("#pop_passwd").val() == ""){
		$("#pop_passwd_alert").text("비밀번호를 입력해주세요.");
		$("#pop_passwd").focus();
		return;
	}

	$.ajax({
		type: "POST",
		url: "<c:url value='/User/CheckIdPwd.pz'/>",
		data: {	pwd : $('#pop_passwd').val(),
				},
		success:function(data) {
			if (data == "loginok"){
				alert('인증이 완료 되었습니다');
				location.href="<c:url value='/User/Mypage_ChangeSettings.pz'/>";
			} else {
				$("#pop_passwd_alert").text("비밀번호가 일치하지 않습니다.");
				$("#pop_passwd").focus();
			}
		},
		error: function (error){
			alert($('#pop_passwd').val());
			alert("다시 시도해주세요.");
		}
	});
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

		<%@include file="/WEB-INF/Pizza/template/foot.jsp" %>
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
	<noscript>
	<iframe src="//www.googletagmanager.com/ns.html?id=GTM-TR97KL" height="0" width="0" style="display:none;visibility:hidden">
	</iframe>
	</noscript>
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
