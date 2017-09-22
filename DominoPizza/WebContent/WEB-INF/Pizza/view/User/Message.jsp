<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 어느 컨트롤러에서 왔는지에 따라 분기 -->
<c:choose>   

   <c:when test="${WHERE eq 'SEC' }">
      <c:set var="SUC_MSG" value="로그인 되었습니다."/>
      <c:set var="FAIL_MSG" value="회원이 아닙니다."/>
      <c:set var="SUC_URL" value="/User/Join.pz"/>
   </c:when>
   
   <c:when test="${WHERE eq 'S_ID' }">
      <c:set var="FAIL_MSG" value="존재하지 않는 아이디 입니다."/>
      <c:set var="SUC_URL" value="/User/IdSearchCompleate.pz"/>
   </c:when>
   
   <c:when test="${WHERE eq 'S_PWD' }">
      <c:set var="SUC_MSG" value="비밀번호 가 변경 되었습니다."/>
      <c:set var="FAIL_MSG" value="이름 혹은 아이디가 존재하지 않습니다."/>
      <c:set var="SUC_URL" value="/User/DominoSearchforIDorPWD.pz"/>
   </c:when>
   
   <c:when test="${WHERE eq 'EXIST' }">
      <c:set var="SUC_MSG" value="회원가입이 완료 되었습니다."/>
      <c:set var="FAIL_MSG" value="이미 존재하는 아이디 입니다."/>
      <c:set var="SUC_URL" value="/Pizza/MainPage.pz"/>
   </c:when>

   <c:when test="${WHERE eq 'CHG' }">
      <c:set var="SUC_MSG" value="수정이 완료 되었습니다."/>
      <c:set var="FAIL_MSG" value="수정 실패 하였습니다."/>
      <c:set var="SUC_URL" value="/User/MyPage_Mania.pz"/>
   </c:when>   
   
   <c:when test="${WHERE eq 'CHKPWD' }">
      <c:set var="SUC_MSG" value=""/>
      <c:set var="FAIL_MSG" value="비밀번호 가 일치하지 않습니다."/>
      <c:set var="SUC_URL" value="/User/MyPage_Mania.pz"/>
   </c:when>
   
   <c:when test="${WHERE eq 'OKPWD' }">
      <c:set var="SUC_MSG" value="새로운 비밀번호 가 설정 되었습니다."/>
      <c:set var="FAIL_MSG" value="비밀번호 수정 실패."/>
      <c:set var="SUC_URL" value="/User/Mypage_ChangeSettings.pz"/>
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
     
   </c:choose>
</script>