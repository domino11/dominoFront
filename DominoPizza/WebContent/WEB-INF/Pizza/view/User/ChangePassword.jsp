<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<!-- 2] CDN(Content Deliver Network)주소 사용-->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<!-- Deprecated 된 함수사용 -->
	<script src="http://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="/resources/js/selectbox.js"></script><!-- js 수정함. -->
	<script type="text/javascript" src="/resources/js/d2CommonUtil.js"></script>
	<script type="text/javascript" src="/resources/js/Cookie.js"></script>
	<script type="text/javascript" src="/resources/js/basket_w.js"></script>

</head>
<body>
		<!-- top_event_bnr -->
		<div class="top_bnr top_event" id="lineBanner">
			<div class="top_event_wrap">
				<a href="javascript:;" class="btn_ico btn_event_close" onclick="lineBannerClose(); return false;">close</a>
			</div>
		</div>
		
		
		<br><br><br><br><br><br><br><br>
<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="srch_wrap">


<div class="pop_layer pop_type open" id="userinfo_confirm">
	<form name="popForm" id="popForm" method="post">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>비밀번호 변경</h2>
		</div>
		<div class="pop_content">

			<div class="form_box">
				<div class="lst_type_dot">
					<ul>
						<li>
							<label for="pop_passwd">현재 비밀번호</label>
							<div class="form_group">
								<div class="form_field">
									<div class="form_item">
										<input type="password" id="pop_passwd" name="pop_passwd" class="i_text" onkeydown="javascript:if(event.keyCode==13){confirmMemberProc(); return false;}">
									</div>
								</div>
								<span class="i_error show"id="pop_passwd_alert"></span>
							</div>
						</li>
						<li>
							<label for="pop_passwd">새 비밀번호</label>
							<div class="form_group">
								<div class="form_field">
									<div class="form_item">
										<input type="password" id="pop_passwd" name="pop_passwd" class="i_text" onkeydown="javascript:if(event.keyCode==13){confirmMemberProc(); return false;}">
									</div>
								</div>
								<span class="i_error show"id="pop_passwd_alert"></span>
							</div>
						</li>
						<li>
							<label for="pop_passwd">새 비밀번호 확인</label>
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
		<a href="window.close()';" onclick="window.close()" class="btn_ico btn_close" data-type="confirm">닫기</a>
	</div>
	</form>
</div>
		
		
		</div>
		</div>
</body>
</html>