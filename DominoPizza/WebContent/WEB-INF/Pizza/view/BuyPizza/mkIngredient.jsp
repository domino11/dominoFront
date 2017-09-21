<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 영양성분 표 팝업(s)) -->
<div class="pop_layer pop_type open" id="mykitchen_nutrient">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>영양성분 표</h2>
		</div>
		<div class="pop_content">
			<div class="mykitchen_table">
				<dl>
					<dt>1. 피자</dt>
					<dd>
						<table class="tbl_type">
							<caption>마이키친 영양성분 표</caption>
							<colgroup>
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
							</colgroup>
							<thead>
								<tr>
									<th>제품명<br>(마이키친<br>기본피자)</th>
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
							<tbody>
								<c:forEach items="${pizzaNutrientList}" var="item" varStatus="loop">
									<c:if test="${loop.count % 2== 0}" var="isEven">
										<c:set value="bg_tr_gray" var="addClass"/>
									</c:if>
									<c:if test="${!isEven}">
										<c:set value="" var="addClass"/>
									</c:if>
									<tr class="${addClass}">
										<td>${item.dough_name}${item.n_size}</td> <!-- 이름 왼쪽정렬 class="txt_align_lft" 삭제 -->
										<td>${item.n_gram}</td>
										<td>${item.n_stan}</td>
										<td>${item.n_stangram}</td>
										<td>${item.n_kcal}</td>
										<td>${item.n_protein}</td>
										<td>${item.n_sfat}</td>
										<td>${item.n_natrium}</td>
										<td>${item.n_sugar}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</dd>
					<dt>2. 토핑</dt>
					<dd>
						<table class="tbl_type">
							<caption>마이키친 영양성분 표</caption>
							<colgroup>
								<col width="143px">
								<col width="143px">
								<col width="143px">
								<col width="143px">
								<col width="143px">
								<col width="143px">
							</colgroup>
							<thead>
								<tr>
									<th>제품명</th>
									<th>열량(kcal/1회분)</th>
									<th>단백질 (g/1회분)</th>
									<th>포화지방 (g/1회분)</th>
									<th>나트륨 (mg/1회분)</th>
									<th>당류 (g/1회분)</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${toppingNutrientList}" var="item" varStatus="loop">
								<c:if test="${loop.count % 2== 0}" var="isEven">
									<c:set value="bg_tr_gray" var="addClass"/>
								</c:if>
								<c:if test="${!isEven}">
									<c:set value="" var="addClass"/>
								</c:if>
								<tr class="${addClass}">
									<td>${item.t_name}</td> <!-- 이름 왼쪽정렬 class="txt_align_lft" 삭제 -->
									<td>${item.t_kcal}</td>
									<td>${item.t_protein}</td>
									<td>${item.t_sfat}</td>
									<td>${item.t_natrium}</td>
									<td>${item.t_sugar}</td>
								</tr>
							</c:forEach>

							</tbody>
						</table>
					</dd>
				</dl>
			</div>
		</div>

		<a href="javascript:closeLayer();" class="btn_ico btn_close">닫기</a>
	</div>
</div>
<!-- //영양성분 표 팝업(e) -->

<!-- LOGGER 환경변수 설정 -->
<script type="text/javascript">
	_TRK_PI = "PLV";			// 웹페이지의 성격 정의
    _TRK_CP = "/메뉴/마이키친/영양성분 및 알레르기 유발성분";	// 카테고리명 전달
</script>
<!-- // LOGGER 환경변수 설정 -->