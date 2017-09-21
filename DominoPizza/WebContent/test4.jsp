<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- 2] CDN(Content Deliver Network)주소 사용 -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<!-- Deprecated된 함수 사용시 아래 라이브러리 임베드 -->
	<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>


</head>
<script type="text/javascript">
var showLayer = function(layerNm) {
	alert("layerNm:"+layerNm);

};

</script>
<body>

		<p class="txt_topping" style="margin-top:30px">- 토핑은 최대 7개 선택 가능</p><p class="txt_topping">- 기본으로 모차렐라 치즈가 추가됩니다. (슈퍼스프림 피자 정량 기준)</p>
		<a href="javascript:showLayer('toppingAllergic');" class="btn_allergy_info" style="right:210px"><span class="ico ico_ex_mark"></span>토핑 알레르기 유발성분</a>
		<!-- 토핑 정량 확인하기 a태그의 클래스 topping_check 변경 -->
		<a href="javascript:showLayer('mkToppingQuantity');" class="btn_allergy_info"><span class="ico ico_ex_mark"></span>토핑 정량 확인하기</a>
		<!-- 위 a태그 2개는 topppingLayer에서 이동함. 자스 showLayer()의 인자로 -->
		


</body>
</html>