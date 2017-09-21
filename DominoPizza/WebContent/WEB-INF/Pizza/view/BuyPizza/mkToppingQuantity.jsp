<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 토핑 정량 확인하기 표 팝업(s)) -->
<div class="pop_layer pop_type pop_mkToppingQuantity" id="mkToppingQuantity">
		<div class="pop_wrap" style="top: 630px;">
				<div class="pop_header">
					<h2>토핑 정량 확인하기</h2>
				</div>
				<div class="pop_content">
					<div class="allergy_guide">
					</div>

					<div class="allergy_table">
						<table class="tbl_type">
							<caption>유발성분 표</caption>
							<colgroup>
								<col width="25%">
								<col width="5%">
								<col width="20%">
								<col width="25%">
								<col width="25%">
							</colgroup>
							<thead>
								<tr>
									<th>토핑</th>
									<th>사이즈</th>
									<th>그램(g)</th>
									<th>가격(원)</th>
								</tr>
							</thead>
							<tbody>
							                           
								<c:set value="false" var="one" />
								<c:forEach var="toppingList" items="${toppingList}" varStatus="loop">
		
									<tr class=" "> <!-- bg_tr_gray제거 -->
									<c:if test="${(loop.count) % 3 == 1 }">
										<td rowspan="3">${toppingList.t_name}</td>
									</c:if>
										<td>${toppingList.t_size}</td>
										<td>${toppingList.t_gram}</td>
										<td>${toppingList.t_price}</td>
									</tr>
									
								</c:forEach>																
							</tbody>
						</table>
					</div>
				</div>

				<a href="javascript:closeMkToppingQuantity();" class="btn_ico btn_close">닫기</a>
			</div>
<!-- //토핑 정량 확인하기 표 팝업(e) -->
</div>