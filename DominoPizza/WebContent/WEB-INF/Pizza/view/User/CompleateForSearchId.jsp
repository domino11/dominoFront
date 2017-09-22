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
		<%@include file="/WEB-INF/Pizza/template/Top.jsp" %>
		
		<br><br><br><br><br><br><br><br>
<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="srch_wrap">


<div class="srch_area">
			<div class="result">
				<strong><span class="user_name">${name}</span>님의 ID 는 <em class="user_id">${id}</em> 입니다.</strong>
				<p>신용평가기관을 통해 실명 인증된 도미노피자 아이디입니다.</p>
				<div class="btn_wrap">
					<div class="btn_fix_center">
						<a href="<c:url value='/User/Login.pz'/>" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">로그인</span></a>
						<a href="<c:url value='/User/DominoSearchforIDorPWD.pz'/>" class="btn btn_mdle btn_blue btn_basic"><span class="btn_txt">비밀번호 찾기</span></a>
					</div>
				</div>
			</div>
		</div>
		
		<br><br><br><br>
		<%@include file="/WEB-INF/Pizza/template/foot.jsp" %>
		</div>
		</div>
</body>
</html>