<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 어느 컨트롤러에서 왔는지에 따라 분기 -->
<c:choose>   

   
   <c:when test="${WHERE eq 'INS' }">
      <c:set var="SUC_MSG" value="정상적으로 등록되었습니다."/>
      <c:set var="FAIL_MSG" value="주변에 매장이 없습니다."/>
      <c:set var="SUC_URL" value="/AddrSelect.pz"/>
   </c:when>
      <c:when test="${WHERE eq 'SID' }">
      <c:set var="SUC_MSG" value="정상적으로 등록되었습니다."/>
      <c:set var="FAIL_MSG" value="오류가 발생하였습니다."/>
      <c:set var="SUC_URL" value="menuList.pz?ty=101"/>
   </c:when>
      <c:when test="${WHERE eq 'BF' }">
      <c:set var="SUC_MSG" value="주문신청이 정상적으로 처리되었습니다."/>
      <c:set var="FAIL_MSG" value="오류가 발생하였습니다."/>
      <c:set var="SUC_URL" value="/Pizza/MainPage.pz"/>
   </c:when>   
   <c:when test="${WHERE eq 'DPNS' }">
      <c:set var="SUC_MSG" value="장바구니에 저장되었습니다."/>
      <c:set var="FAIL_MSG" value="오류가 발생하였습니다."/>
   </c:when>     
   
   <c:otherwise>
      <c:set var="SUC_MSG" value="삭제 성공"/>
      <c:set var="FAIL_MSG" value="삭제 실패"/>
      <c:set var="SUC_URL" value="/ReplyBBS/BBS/List.bbs"/>
   </c:otherwise>
</c:choose>


<script>
   <c:choose>
      <c:when test="${SUC_FAIL ==1}">
         alert("${SUC_MSG}");
         location.href='<c:url value="${SUC_URL}"/>';
      </c:when>
      <c:when test="${SUC_FAIL ==0}">
         alert("${FAIL_MSG}");
         history.back();
      </c:when>
      <c:when test="${SUC_FAIL ==2}">
      alert("${SUC_MSG}");
      history.go(-2);
   </c:when> 
   <c:when test="${SUC_FAIL ==3}">
   alert("${SUC_MSG}");
   history.back();
</c:when> 
<c:when test="${SUC_FAIL ==9}">
alert("주문하실 매장을 선택해주세요.");
location.href='<c:url value="/AddrCh.pz"/>';
</c:when> 
   </c:choose>
</script>