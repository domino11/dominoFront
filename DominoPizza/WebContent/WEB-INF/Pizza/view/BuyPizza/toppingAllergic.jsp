<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 토핑 알레르기 유발성분 표 팝업(s) -->
<div class="pop_layer pop_type pop_toppingAllergic" id="toppingAllergic">
	<div class="pop_wrap" style="top: 338px;">
			<div class="pop_header">
				<h2>토핑 알레르기 유발성분</h2>
			</div>
			<div class="pop_content">
				<div class="allergy_guide">
					<p>한국인에게 알레르기를 유발할 수 있는 12가지 식품에 대해 아래와 같이 제품별 상세 내용을 표기하여 안내해드립니다.<br>(괄호 안 식품이 해당 토핑에 포함되어있는 알레르기 유발 가능식품)</p>
					<dl>
						<dt>* 알레르기 유발 가능 식품 : </dt>
						<dd>토마토, 아황산류(이를 첨가하여 최종제품에 SO2로 10mg/kg 이상 함유한 경우에 한한다), 호두, 닭고기, 쇠고기, 오징어, 조개류(굴, 전복, 홍합 포함)</dd>
					</dl>
				</div>
	
				<div class="allergy_table">
					<table class="tbl_type">
						<caption>유발성분 표</caption>
						<colgroup>
							<col width="5%">
							<col width="25%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>토핑</th>
								<th>알레르기 유발성분 표기</th>
							</tr>
						</thead>
					<tbody>
						<c:forEach var="toppingList" items="${toppingList}" varStatus="loop">
							<c:if test="${(loop.count) % 2 == 0 }" var="is">
								<c:set value="bg_tr_gray" var="backColor" />
							</c:if>
							<c:if test="${!is}">
								<c:set value=" " var="backColor" />
							</c:if>
								<tr class="${backColor}">
									<td>${loop.count}</td>
									<td>${toppingList.t_name}</td>
									<td>${toppingList.t_allergy}</td>
								</tr>
						</c:forEach>
					</tbody>
					</table>
				</div>
			</div>
			<a href="javascript:closeAllergic();" class="btn_ico btn_close">닫기</a>
		</div>
</div>
<!-- 토핑 알레르기 유발성분 표 팝업(e) -->