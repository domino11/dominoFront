<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
   <link rel="stylesheet" type="text/css" href="/resources/css/font.css">
   <link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css?v1.0">
   
   <script type="text/javascript" src="<c:url value='/Pizza/js/jquery1.11.1.js' />"></script>
   <script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
   <script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/jquery.flexslider.js"></script>
   <script type="text/javascript" src="<c:url value='/Pizza/js/selectbox.js' />"></script><!-- js 수정함. -->
   <script type="text/javascript" src="<c:url value='/Pizza/js/d2CommonUtil.js' />"></script>
   <script type="text/javascript" src="<c:url value='/Pizza/js/Cookie.js' />"></script>
   <script type="text/javascript" src="<c:url value='/Pizza/js/basket_w.js' />"></script>
   
   <script type="text/javascript">
   var CON_DOMAIN_URL = "http://web.dominos.co.kr";
   var CON_SSL_URL = "https://web.dominos.co.kr";
   var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";

   $(document).ready(function() {
      $(".gnb_menu .menu01").addClass("on");
      
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
//                   console.log("마이쿠폰 정보 가져오기 실패");
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
//                             console.log("Left 주문내역 가져오기 실패");
                         }
                      }
                  } else {
//                      console.log("Left 주문내역 가져오기 실패");
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

   <!-- wrap  -->
   <div id="wrap">
   
   <jsp:include page="/WEB-INF/Pizza/template/Top.jsp" />
   
   
<script type="text/javascript">
var ajaxBasket = null;
function goUrl(url){
   location.href=url;
}

function addBasketGoods(goodsCode, qty){
   var goodsType = 'addGD';

   if(goodsCode.indexOf("RPZ") >= 0){
      goodsType = 'addPZ';
   }

   var addBasketComplete = function() {
      location.reload(true);
   };

   addBasket(goodsType, goodsCode, qty, "", "", addBasketComplete, "/basket/detail");
}

function changeBakset(goodsCode, seq, orgCnt, changeCnt) {

   // update goods order cnt
    $.ajax({
        url:'/basket/basketProc',
        type:'POST',
        dataType:'json',
        data: {
         action_code : "changeCT"
         , goods_code : goodsCode
         , goods_seq : seq
         , goods_count : changeCnt
         , count : orgCnt
      },
        success:function(data){
         if(data.resultData.result != "success")
            alert(data.resultData.msg);
         location.reload();
         //parent.location.reload();
      },
      beforeSend: function() {
         $("#defaultLoading").show();
       },
       complete: function() {
          $("#defaultLoading").hide();
       }
   });
}

function changeGoodsCnt(idx){
      if(confirm("해당 제품을 장바구니에서 삭제하시겠습니까?")){
         location.href="<c:url value='sessionDelete.pz' />?idx="+idx;
      }
   
}

var goBranch = function(){
   if(confirm("주문매장 변경 시 장바구니의 제품은 모두 초기화됩니다. 주문매장을 변경하시겠습니까?")) {
      location.href = "<c:url value='/AddrSelect.pz' />?reset=1";
   }
}

function alertBranch(){
   alert('"청담점 + 삼성점 합병운영 안내"\n2017.08.21(월)부터 기존 도미노피자 청담점 포장고객 도미노피자 삼성점으로 이용 부탁드립니다.');
   location.href = ("/main");
}
</script>

<!-- container -->
<div id="container">
   <!-- content -->
   <div id="content" class="cart_payment">

      <!-- sub_title -->
      <div class="sub_title">
         <ul class="sub_nav">
            <li><a href="#">HOME</a></li>
            <li><span>장바구니</span></li>
         </ul>
         <div class="sub_title_wrap">
            <h2>장바구니</h2>
         </div>
      </div>
      <!-- //sub_title -->


       <c:if test="${!empty BUYNUM }" var='isnull' >

      <div class="order_cart">
         <!-- 배달 -->
         <div class="order_section order_type">
               <div class="tit_order btn_tit2">
                  <strong>배달주문</strong>
                  <a href="javascript:goBranch();" class="btn"><span class="btn_txt">주문매장 변경</span></a>
               </div>
               <div class="order_adr">
                  <p class="addr_info">${DE_ADDR }</p>
                  <strong class="order_store_info">${ST_NAME }<span>(${ST_TEL })</span></strong>
               </div>
            </div>
         <!-- // 배달 -->
         <!-- 포장 -->
         <!-- // 포장 -->

         <div class="order_section cart_lst">
               <div class="tit_order">
                  <strong>주문제품</strong>
               </div>
               <div class="cart_lst_warp">
                  <div class="cart_lst_tbl">
                     <table class="tbl_type">
                        <caption>주문제품 리스트</caption>
                        <colgroup>
                           <col>
                           <col width="90px">
                           <col width="250px">
                           <col width="100px">
                           <col width="100px">
                        </colgroup>
                        <thead>
                           <tr>
                              <th>제품정보</th>
                              <th>판매가격</th>
                              <th>추가토핑</th>
                              <th>수량</th>
                              <th>삭제</th>
                           </tr>
                        </thead>
                        <tbody>
                        <form action="LastOrder.pz" id="frs" method="post" >
                        
                        <c:forEach items="${BUYLIST}" var="map" varStatus="loop" >
                        <tr>
                         
                              <td>
                                 <div class="prd_info_view">
                                    <div class="prd_img">
                                    <c:if test="${map.kind=='1' }" >
                                       <img src="<c:url value='/Pizza/Image/pizzalist/${map.img}' />" alt="브레이즈드 포크 곡물도우" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg'" />
                                    </c:if>
                                    <c:if test="${map.kind=='2' }" >
                                       <img src="<c:url value='/Pizza/Image/pizzalist/${map.img}' />" alt="브레이즈드 포크 곡물도우" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg'" />
                                    </c:if>
                                    <c:if test="${map.kind=='3' }" >
                                       <img src="<c:url value='/Pizza/Image/sidedish/beverage/${map.img}' />" alt="브레이즈드 포크 곡물도우" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg'" />
                                    </c:if>
                                    <c:if test="${map.kind=='4' || map.kind=='5' }" >
                                       <img src="<c:url value='/Pizza/Image/sidedish/pickleNSouce/${map.img}' />" alt="브레이즈드 포크 곡물도우" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/goods/goods_default.jpg'" />
                                    </c:if>
                                       </div>
                                    <div class="prd_info">
                                       <div class="prd_name">
                                          ${map.name}</div>
                                       <div class="prd_kinds">
                                       ${map.dough }
                                       <c:if test="${map.kind!='2'&&map.kind!='3'&&map.kind!='4'&& map.kind!='5'}" >
                                          <c:if test="${map.size=='L' }" var="sizes" >
                                             <span class="ico ico_s_large"></span></div>
                                          </c:if>
                                          <c:if test="${!sizes}"  >
                                             <span class="ico ico_s_medium"></span></div>
                                          </c:if>
                                       </c:if>
                                    </div>
                                 </div>
                              </td>
                              <td><span id="qty${loop.count}" ><fmt:formatNumber type="number">${map.price }</fmt:formatNumber> </span></td>
                              <td>
                                 <div class="lst_type v5">
                                    <ul>
                                    <c:if test="${!empty map.toppingList}">
                                    <c:forEach items="${map.toppingList }" var="tdto" varStatus="tloop" >
                                    <c:if test="${!empty map.mkSauce}">
                                         <li>${map.mkSauce}</li>
                                    </c:if> 
                                 <li>${tdto.t_name } (${tdto.t_size}) <fmt:formatNumber value="${tdto.t_price }" />원</li>
                                    </c:forEach>
                                    </c:if>
                                 </ul>
                                 </div>
                              </td>
                              <td>
                              <div class="sel_box">
                                 
                                 <select name="qty" id="sel${loop.count }" onchange="qtychange('${map.price/map.qty }','qty${loop.count}','sel${loop.count }','${loop.count }')" title="수량">
                                       <c:forEach var="i" begin="1" end="9">
                                       <c:if test="${map.qty==i }" var="qtys" >
                                       <option value="${i }" selected="selected">${i }</option>
                                       </c:if>
                                       <c:if test="${!qtys }" >
                                       <option value="${i}">${i }</option>
                                       </c:if>
                                       
                                       </c:forEach>
                                           </select>                                 
                              </div>
                              </td>
                              <td><a href="#self" onclick="changeGoodsCnt('${loop.count}')" class="btn"><span class="btn_txt">삭제</span></a></td>
                           </tr>
                        <input type="hidden" value="${map.name }" name="name${loop.count }" >   
                        <input type="hidden" value="${map.size }" name="size${loop.count }" > 
                        <input type="hidden" value="${map.price }" id="Fprice${loop.count }" name="price${loop.count }" >
                        <input type="hidden" value="${map.qty }" id="Fqty${loop.count }" name="qty${loop.count }"  >
                        <input type="hidden" value="${map.kind }" name="kind${loop.count }">
                        <input type="hidden" value="${map.size }" name="size${loop.count }">
                        
                        <c:set var="lengths" value="${loop.count }" />
                        </c:forEach>
                        <input type="hidden" value="${lengths }" name="lengths" >
                        </form>
                        </tbody>
                     </table>
                  </div>

                  
                  <div class="verlernen_area" id="recom_area" >
                     <div class="lst_type_dot">
                        <p>혹시,<br>잊지 않으셨나요?</p>
                        <div class="lst_wrap">

                           <ul>
                           <li>
                                 <div class="lst_tr">
                                    <p>아란치니(한입리조또)</p>
                                    <a href="#self" onclick="addBasketGoods('RSD136M1', 1)" class="btn"><span class="btn_txt">담기</span></a>
                                 </div>
                              </li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="basic_providing">
                     <dl>
                        <dt>※ 피클&amp;소스 기본 제공 안내</dt>
                        <dd>
                           <div class="lst_type v2">
                              <ul>
                                 <li>L: 피클 2개 / 핫소스 2개 / 갈릭디핑소스 15g 2개, M: 피클 1개 / 핫소스 1개 / 갈릭디핑소스 15g 1개</li>
                                 <li>씬, 더블크러스트 치즈멜팅 피자는 갈릭디핑소스 미 제공</li>
                                 <li>사이드디시 &gt; 피클&amp;소스 추가 구매 가능</li>
                              </ul>
                           </div>
                        </dd>
                     </dl>
                  </div>
               </div>
            </div>
            <div class="order_section cart_total">
               <div class="tit_order">
                  <strong>총 주문 금액</strong>
               </div>
               <div class="cart_total_wrap">
                  <div class="price_wrap">
                  <span class="txt_sale_guide">※ 할인은 다음 페이지(주문서작성)에서 적용 가능합니다.</span>
                     <p><span id="tprice"><fmt:formatNumber type="number">${TOTALPRICE }</fmt:formatNumber></span>원</p>
                  </div>
                  <div class="btn_wrap">
                  
                     <a href="<c:url value='/menuList.pz?ty=101' />" class="btn btn_mdle btn_basic"><span class="btn_txt">제품 추가 +</span></a>
                     <a href="#" onclick="frs.submit()" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">주문하시겠어요?</span></a>
                        </div>
                        
               </div>
            </div>
         </div>
</c:if>

<c:if test="${!isnull }">

      <div class="order_cart">
         <!-- 배달 -->
         <!-- // 배달 -->
         <!-- 포장 -->
         <!-- // 포장 -->

         <div class="order_section cart_none">
               <span class="ico ico_cart_n2"></span>
               <div class="cart_lst_none">
                  <dl>
                     <dt>장바구니가 비어있습니다.</dt>
                     <dd>도미노피자의 맛있는 메뉴를 마음껏 골라 담으세요!</dd>
                  </dl>
               </div>
               <div class="btn_wrap">
                  <div class="btn_fix_center">
                     <a href="<c:url value='/menuList.pz?ty=101' />" class="btn btn_mdle btn_gray btn_basic"><span class="btn_txt">신제품 보러 가기</span></a>
                     <a href="<c:url value='/menuList.pz?ty=104' />" class="btn btn_mdle btn_gray btn_basic"><span class="btn_txt">다른 제품 둘러보기</span></a>
                  </div>
               </div>
            </div>
         </div>

</c:if>

   </div>
   <!-- //content -->
</div>


<!-- //container -->
<!-- LOGGER 환경변수 설정 -->
<script type="text/javascript">
   _TRK_PI = "OCVDE";   // 웹페이지의 성격 정의 - 장바구니 상세
</script>
<!-- // LOGGER 환경변수 설정 -->
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

      <div id="footer">
         <div class="footer_wrap">
            <div class="company_info">
               <dl class="order_phone">
                  <dt>전화주문</dt>
                  <dd><span class="ico ico_phone"></span>1577-3082</dd>
               </dl>
               <ul class="list_sns">
                  <li><a href="https://www.facebook.com/dominostory/" target="_blank" class="btn_facebook">facebook</a></li>
                  <li><a href="https://twitter.com/dominostory" target="_blank" class="btn_twitter">twitter</a></li>
                  <li><a href="http://blog.naver.com/dominostory" target="_blank" class="btn_blog">blog</a></li>
                  <li><a href="https://www.instagram.com/dominostory/" target="_blank" class="btn_instar">instargram</a></li>
               </ul>
               <div class="footer_menu">
                  <ul class="list_terms">
                     <li><a href="/company/contents/overview">회사소개</a></li>
                     <li><a href="/contents/privacy"><strong>개인정보 처리방침</strong></a></li>
                     <li><a href="/contents/law">이용약관</a></li>
                     <li><a href="/bbs/faqList?view_gubun=W&bbs_cd=online">고객센터</a></li>
                  </ul>
                  <ul class="list_company">
                     <li>135-928 서울특별시 강남구 언주로 315 청오디피케이㈜</li>
                     <li>문의 : <a href="mailto:webmaster@dominos.co.kr">webmaster@dominos.co.kr</a></li>
                     <li>사업자 등록번호: 220-81-03371</li>
                     <li>통신판매업신고: 강남 5064호</li>
                     <li>개인정보 보호책임자 : 이명윤</li>
                     <li>대표이사: 오광현</li>
                  </ul>
                  <address>Copyrightsⓒ2017 by Domino’s Pizza. All rights reserved.</address>
                  <!-- a href="/contents/familySite" class="btn_family">family_brand</a  -->
               </div>
            </div>
            <div class="awards_area">
               <ul class="list_awards">
                  <li>
                     <img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards.png" alt="">
                     <p>식품안전<br>경영시스템 인증</p>
                  </li>
                  <li>
                     <img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards2.png" alt="">
                     <p>지식경제부<br>우수디자인 선정</p>
                  </li>
                  <li>
                     <img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards3.png" alt="">
                     <p>고객이 가장 추천하는 기업<br/>피자전문점 부문 4년 연속 1위</p>
                  </li>
                  <li>
                     <img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards4.png" alt="">
                     <p>2016년 「대한민국인터넷소통대상」<br/>「대한민국소셜미디어대상」<br/>Leading Star (7년 연속 종합 1위)</p>
                  </li>
                  <li>
                     <img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards5.png" alt="">
                     <p>2016 한국산업의 고객만족도<br/>피자전문점 부문 2년 연속 1위</p>
                  </li>
               </ul>
            </div>
         </div>
         <a href="#" class="btn_top">Top</a>
      </div>
      <!-- //footer -->
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
   <noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TR97KL" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
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
      
               <script>
                  function qtychange(price,qtys,sel,count){
                     var totald = document.getElementById('tprice');
                     var sel = document.getElementById(sel);
                     var oneprice = document.getElementById(qtys);
                     var fqty = document.getElementById('Fqty'+count);
                     var fprice = document.getElementById('Fprice'+count);
                     fqty.value = sel.value;
                     fprice.value=price*sel.value;
                     totald.innerHTML =Number(parseInt(totald.innerHTML.replace(",",""))-parseInt(oneprice.innerHTML.replace(",",""))+parseInt(price*sel.value)).toLocaleString('en');
                     oneprice.innerHTML = Number(price*sel.value).toLocaleString('en');
                  }
                  
               </script>
                  
      
</body>
<script>
cookieManager.makePCID("PCID", 10);
</script>
</html>