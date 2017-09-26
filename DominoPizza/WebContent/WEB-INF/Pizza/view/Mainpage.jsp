<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
   <link rel="shortcut icon" href="https://cdn.dominos.co.kr/renewal2016/ko/w/img/favicon.ico"/>
   <link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/font.css' />">
   
   <!-- Style - 모든 예제 공통 사용하는 css-->
<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/style.css'/>" />
<!--  basic 용 css -->
   
   
   <link rel="stylesheet" type="text/css" href="<c:url value='https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css' />">
   
   <!--  베너용 -->
   <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
   <script type="text/javascript" src="<c:url value='/Pizza/js/jquery.jcarousel.min.js'/>"></script>
   
   <link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/jcarousel.connected-carousels2.css' /> ">
   <script type="text/javascript" src="<c:url value='/Pizza/js/jcarousel.connected-carousels.js' /> "></script>
   
   <style>
   
   
   </style>
   
   <script type="text/javascript" src="<c:url value='/Pizza/js/jquery1.11.1.js' />"></script>
   <script type="text/javascript" src="<c:url value='/Pizza/js/ui.js' />"></script>
   <script type="text/javascript" src="<c:url value='/Pizza/js/jquery.flexslider.js' />"></script>
   <script type="text/javascript" src="<c:url value='/Pizza/js/selectbox.js' />"></script><!-- js 수정함. -->
   <script type="text/javascript" src="<c:url value='/Pizza/js/d2CommonUtil.js' />"></script>
   <script type="text/javascript" src="<c:url value='/Pizza/js/Cookie.js' />"></script>
   <script type="text/javascript" src="<c:url value='/Pizza/js/basket_w.js' />"></script>
   <script type="text/javascript">
   var CON_DOMAIN_URL = "http://web.dominos.co.kr";
   var CON_SSL_URL = "https://web.dominos.co.kr";
   var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";

   $(document).ready(function() {
      $.ajaxSetup({cache:false});

      setBasketCnt();

      // 마이쿠폰 정보 조회(가입회원)
      

      // 주문&주문트레커 조회(가입회원/인증회원)
      
   });
   var i = 1;
   var src = "https://cdn.dominos.co.kr/renewal2016/ko/w/images/logo.png"

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

</script>
<script>

$(function(){
   
   
   
      var a= function(){
         $(".test").fade
   
      }
      
      var b= function(){
            $(".test").get(i).src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/logo.png";
         $(".test").toggle(1000,function(){
               i=1;
            $(".test").on("click",function(){
               location.href="http://www.naver.com";
            });
            setTimeout(function(){
               a();
                  
               },3000);
         });
            }
      setTimeout(function(){
      a();
      },3000);

});
</script>


<!-- Naver Anlytics 공통-->
<script>
var WCSLOG_URL = location.protocol == "https:" ? "https://wcs.naver.net/wcslog.js" : "http://wcs.naver.net/wcslog.js";
document.write(unescape("%3Cscript type='text/javascript' src='" + WCSLOG_URL +"' %3E%3C/script%3E"));
</script>
<!-- // Naver Anlytics 공통-->
</head>
<body>

   <!-- top_event_bnr -->
   <div class="top_bnr top_event" id="lineBanner">
      <div class="top_event_wrap">
         <a href="javascript:;" class="btn_ico btn_event_close" onclick="lineBannerClose(); return false;">close</a>
      </div>
   </div>
   <!-- //top_event_bnr -->

   <div id="wrap">
   <jsp:include page="/WEB-INF/Pizza/template/Top.jsp" />



<div id="container">
   <div class="main_floating">
      <div class="quick_menu">
         <a href="javascript:goOrder('O');" class="quick_order"><span>온라인<br>주문하기</span></a>
      </div>
      
      <script>
      // 사이드 퀵메뉴 온라인주문하기
      function goOrder(O){
         location.href="<c:url value='/menuList.pz?ty=101' />";
      }
      </script>
      
<!--       <div class="quick_menu2">
         <a href="javascript:goOrder('Q');" class="quick_order2"></a>
      </div> --> <!-- 퀵 오더 있던곳 -->
<!--       <div class="quick_menu4 chat_order active">
<a href="javascript:goChat()" class="quick_order4"></a>
      </div> --> <!-- 챗봇 -->
      <div class="quick_menu3">
         <a href="/contents/present" class="quick_order3"></a>
      </div>      
      
      
<!-- 2017-07-05 // 챗봇 수정(e) -->
      <!-- 2017-07-05 // 플로팅 추가(s) -->
         <!-- 2017-07-05 // 플로팅 추가(e) -->
      </div>


        <div class="wrapper" style="width: 100%" >
           
            <div class="connected-carousels" style="width: 100% ;height:500px" >
                <div class="stage" style="width: 100%; height:500px" >
                
                    <div class="carousel carousel-stage" style="width: 100%; height:500px" >
                        <ul>
                            <li><a href="#"><img src="<c:url value='/Pizza/Image/1.jpg' />"  style="width:100%" height="500" alt=""></a></li>
                            <li><a href="#"><img src="<c:url value='/Pizza/Image/2.jpg' />"  style="width:100%" height="500" alt=""></a></li>
                            <li><a href="#"><img src="<c:url value='/Pizza/Image/3.jpg' />"  style="width:100%" height="500" alt=""></a></li>
                            <li><a href="#"><img src="<c:url value='/Pizza/Image/4.jpg' />"  style="width:100%" height="500" alt=""></a></li>
                           <li><a href="#"><img src="<c:url value='/Pizza/Image/5.jpg' />"  style="width:100%" height="500" alt=""></a></li>
                        
                        </ul>
                    </div>
<!--                      
                    <p class="photo-credits">
                        Photos by <a href="http://www.mw-fotografie.de">Marc Wiegelmann</a>
                    </p>
                     -->
                    <a href="#" class="prev prev-stage"><span>&lsaquo;</span></a>
                    <a href="#" class="next next-stage"><span>&rsaquo;</span></a>
                </div>

                <div class="navigation">
                  
                </div>
            </div>
        </div>
   
   
   <!-- content -->
   
   
   <div id="content" class="main">
      <!-- delivery_tracker -->
      <div class="delivery_tracker" style="display:none;" id="ingOrderInfo">
         <input type="hidden" id="tracker_order_no" value="">
         <p class="customer_tracker">현재 <strong></strong> 님의<br>주문상태는?</p>
         <ul class="list_tracker">
            <li>
               <span class="tracker_step" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
               <p>접수완료</p>
            </li>
            <li>
               <span class="tracker_step2" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
               <p>요리 중</p>
            </li>
            <li>
               <span class="tracker_step3" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
               <p>배달 중</p>
            </li>
            <li>
               <span class="tracker_step4" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
               <p>배달완료</p>
            </li>
         </ul>
      </div>
      <!-- //delivery_tracker -->

      <!-- customer_info -->
      <div class="customer_info">
      <ul>
         <c:if test="${empty ID }" var="idc" >
               <li>
                  <a href="<c:url value='/User/Login.pz' />">
                     <div class="img_info">
                        <img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info_2.png" alt="">
                     </div>
                     
                     <div class="txt_info">
                        <p>로그인하시면<br>풍성한 혜택이 가득!</p>
                        <div class="txt_info_right">
                           <span class="blue_box">로그인</span>
                        </div>
                     </div>
                     
                  </a>
               </li>
                           <li>
               <a href="/event/mania">
                  <div class="img_info">
                     <img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info2_2.png" alt="">
                  </div>
                  <div class="txt_info">
                     <p>온라인 회원만의<br>매니아 혜택</p>
                     <div class="txt_info_right">
                        <span class="ico ico_mania"></span>
                     </div>
                  </div>
               </a>
            </li>      
                     
                     </c:if>
                     
               <c:if test="${!idc }">
               <li>
               <a href="/mypage/myLevel">
                  <div class="img_info">
                     <img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info.png" alt="">
                  </div>
                  <div class="txt_info">
                     <p><span id="myMonth"></span> ${dto.name }님은<br><strong class="txt_royal" id="myLevel">${dto.r_name }</strong> 등급입니다.</p>
                     <div class="txt_info_right">
                        <span class="blue_box">혜택보기</span>
                     </div>
                  </div>
               </a>
            </li>
               <li class="exist_coupon">
               <a href="/mypage/myCoupon">
                  <div class="img_info">
                     <img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info2.png" alt="">
                  </div>
                  <div class="txt_info">
                     <p><span>${dto.name }</span> 님의<br>사용 가능한 쿠폰은?</p>
                     <div class="txt_info_right bar_line">
                        <p class="coupon_info" id="myCouponCnt">${dto.coupon }</p>
                        <span class="bar"></span>

                     </div>
                  </div>
               </a>
            </li>
            </c:if>
            <li>
               <a href="<c:url value='/branch.pz'/>">
                  <div class="img_info">
                     <img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info3_2.png" alt="">
                  </div>
                  <div class="txt_info">
                     <p>내 주변<br>이벤트 매장 찾기</p>
                     <div class="txt_info_right">
                        <span class="ico ico_store"></span>
                     </div>
                  </div>
               </a>
            </li>
         </ul>
         </div>
      </div>
      <!-- //customer_info -->



 </div> <!--  전체 다이브 -->
   <jsp:include page="/WEB-INF/Pizza/template/foot.jsp"></jsp:include>

</body>
<script>
cookieManager.makePCID("PCID", 10);
</script>


</html>
