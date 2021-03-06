<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- wrap  -->


		<!-- header -->
		<div id="header" style="background-color: white" >
				<div class="logo_area">
					<div class="util_left">
						<a href="javascript:;" class="btn_ico btn_menu">GNB</a>
						<ul class="util_menu">
						<c:if test="${empty ID }">
							<li style=""><a href="<c:url value='/User/Login.pz' />">쿠폰 <span id="gnbCoupon"></span></a></li>
							<li><a href="<c:url value='/User/Login.pz' />">주문조회 <span id="gnbOrderCnt"></span></a></li>
						</c:if>
						<c:if test="${!empty ID }">
							<li style=""><a href="<c:url value='/User/Mypage_coupon.pz' />">쿠폰 <span id="gnbCoupon"></span></a></li>
							<li><a href="<c:url value='/User/Mypage_OrderHistory.pz' />">주문조회 <span id="gnbOrderCnt"></span></a></li>
						</c:if>
						</ul>
					</div>
					<h1 class="logo"><a href="<c:url value='/Pizza/MainPage.pz' />"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/logo.png" alt="Domino"></a></h1>
					<div class="util_right">
						<ul class="util_menu">
						<c:if test="${empty ID }" var="login" >
						<li><a href="<c:url value='/User/Login.pz'/>">로그인</a></li>
							<li><a href="<c:url value='/User/Join.pz'/>">회원가입</a></li>
						</c:if>
						<c:if test="${!login}" >
						<li><a href="<c:url value='/User/Logout.pz'/>">로그아웃</a></li>
							<li><a href="<c:url value='/User/MyPage_Mania.pz'/>">나의정보</a></li>
						</c:if>
							</ul>
							
						<a href="<c:url value='/GoBasket.pz'/> " class="btn_ico btn_cart"><span class="cart_count">${BUYNUM }</span>장바구니</a>
						
					</div>
				</div>
			<div class="menu_area">
				<ul class="gnb_menu">
					<li>
						<a href="<c:url value='/menuList.pz' />?ty=100" class="menu01">피자</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="<c:url value='/menuList.pz' />?ty=100">NEW</a></li>
								<li><a href="<c:url value='/menuList.pz' />?ty=101">곡물도우</a></li>
								<li><a href="<c:url value='/menuList.pz' />?ty=102">프리미엄</a></li>
								<li><a href="<c:url value='/menuList.pz' />?ty=103">클래식</a></li>
							</ul>
						</div>
					</li>
					<li>
					
						<a href="<c:url value='/menuList.pz' />?ty=104" class="menu02">사이드디시</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="<c:url value='/menuList.pz' />?ty=104">사이드디시</a></li>
								<li><a href="<c:url value='/Pizza/Menu/sidedish_beverage.pz'/>">음료</a></li>
								<li><a href="<c:url value='/Pizza/Menu/sidedish_pickleNSouce.pz'/>">피클&소스</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="<c:url value='/branch.pz?si=서울&gugun=금천구'/>" class="menu03">매장찾기</a>
						<!--div class="depth2">
							<ul class="list_depth2">
								<li><a href="/event/list?gubun=E0100">오늘의 핫딜</a></li>
								<li><a href="/event/list?gubun=E0200">오늘의 이벤트</a></li>
								<li><a href="/event/mania">매니아 혜택</a></li>
								<li><a href="/event/discount">할인&제휴</a></li>
							</ul>
						</div-->
					</li>
					
					<li>
						<a href="<c:url value='/Pizza/BuyPizza/hnh.pz'/>" class="menu04">내맘대로 피자</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="<c:url value='/Pizza/BuyPizza/hnh.pz'/>">하프&하프</a></li>
								<li><a href="<c:url value='/Pizza/BuyPizza/mykitchen.pz'/>">마이 키친</a></li>
								<li><a href="<c:url value='/Pizza/BuyPizza/topping.pz'/>">추가 토핑 안내</a></li>
							</ul>
						</div>
					</li>


					<li>
						<a href="<c:url value='/EventMain.pz'/>?e=E101" class="menu05">이벤트&혜택</a>
						<div class="depth2">
							<ul class="list_depth2">
								<!-- li><a href="/event/list?gubun=E0100">오늘의 핫딜</a></li-->
								<li><a href="<c:url value='/EventMain.pz'/>?e=E101">오늘의 이벤트</a></li>
								<li><a href="<c:url value='/mania.pz'/>">매니아 혜택</a></li>
<!-- 								<li><a href="/event/pizzaSchoolView">피자교실</a></li> -->
							</ul>
						</div>
					</li>
					

					<li>
						<a href="<c:url value='/BestList.pz' />?kind=1" class="menu07">베스트 메뉴</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="<c:url value='/BestList.pz' />?kind=1">베스트 셀러</a></li>
								<li><a href="<c:url value='/BestList.pz' />?kind=2">베스트 메뉴</a></li>
								<c:if test="${!empty ID }">
								<li><a href="<c:url value='/BestList.pz' />?kind=3">좋아한 메뉴</a></li>
								</c:if>
<!-- 								<li><a href="/event/pizzaSchoolView">피자교실</a></li> -->
							</ul>
						</div>
					</li>					
					
<%-- 					<li>
						<a href="<c:url value='/BestList.pz' />" class="menu07">베스트 메뉴</a>
						<div class="depth2">
							<!-- <ul class="list_depth2">
								<li><a href="/contents/present">전체</a></li>
								<li><a href="/voucher/list?gubun=M">모바일상품권</a></li>
							</ul> -->
						</div>
					</li> --%>
				</ul>
			</div>
			
			<div class="whole_menu_area">
				<div class="whole_menu_wrap">
					<ul class="whole_menu">
						<li>
							<a href="<c:url value='/menuList.pz' />?ty=101">피자</a>
							<ul class="list_depth2">
							
								<li><a href="<c:url value='/menuList.pz' />?ty=101">곡물도우</a></li>
								<li><a href="<c:url value='/menuList.pz' />?ty=102">프리미엄</a></li>
								<li><a href="<c:url value='/menuList.pz' />?ty=103">클래식</a></li>
							</ul>
						</li>
						<li>
							<a href="<c:url value='/menuList.pz' />?ty=104">사이드디시</a>
							<ul class="list_depth2">
								<li><a href="<c:url value='/menuList.pz' />?ty=104">사이드디시</a></li>
								<li><a href="<c:url value='/Pizza/Menu/sidedish_beverage.pz'/>">음료</a></li>
								<li><a href="<c:url value='/Pizza/Menu/sidedish_beverage.pz'/>">피클&소스</a></li>
							</ul>
						</li>

						<li>
							<a href="<c:url value='/Pizza/BuyPizza/hnh.pz'/>">내맘대로 피자</a>
							<ul class="list_depth2">
								<li><a href="<c:url value='/Pizza/BuyPizza/hnh.pz'/>">하프&하프</a></li>
								<li><a href="<c:url value='/Pizza/BuyPizza/mykitchen.pz'/>">마이 키친</a></li>
								<li><a href="<c:url value='/Pizza/BuyPizza/topping.pz'/>">추가 토핑 안내</a></li>
							</ul>
						</li>
						<li>
							<a href="<c:url value='/EventMain.pz'/>?e=E101" class="menu05">이벤트&혜택</a>
							<ul class="list_depth2">
								<!-- li><a href="#">오늘의 핫딜</a></li-->
								<li><a href="<c:url value='/EventMain.pz'/>?e=E101">오늘의 이벤트</a></li>
								<li><a href="<c:url value='/mania.pz'/>">매니아 혜택</a></li>
							</ul>
						</li>
						<li>
							<a href="<c:url value='/BestList.pz' />?kind=1">베스트 메뉴</a>
							<ul class="list_depth2">
								<li><a href="<c:url value='/BestList.pz' />?kind=2">베스트 셀러</a></li>
								<li><a href="<c:url value='/BestList.pz' />?kind=2">베스트 메뉴</a></li>
								<c:if test="${!empty ID }">
								<li><a href="<c:url value='/BestList.pz' />?kind=2">좋아한 메뉴</a></li>
								</c:if>
							</ul>


						</li>
						<li>
							<a href="<c:url value='/branch.pz' />">매장찾기</a>
							<ul class="list_depth2">
								<li><a href="<c:url value='/branch.pz' />">매장찾기</a></li>
							</ul>
						</li>
			

						<!-- <li>
							<a href="/bbs/faqList?view_gubun=W&bbs_cd=online">고객센터</a>
							<ul class="list_depth2">
								<li>
									<a href="/bbs/faqList?view_gubun=W&bbs_cd=online">FAQ</a>
								</li>
							</ul>
						</li>-->
						<li> 
							<a href="<c:url value='/NewsList.pz'/>">공지사항</a>
							<ul class="list_depth2">
								<li><a href="<c:url value='/NewsList.pz?type=1'/>">도미노 뉴스</a></li>
								<li><a href="<c:url value='/NewsList.pz?type=2'/>">Press</a></li>
							</ul>
						</li>
					</ul>
					<a href="/event/view?seq=84&gubun=E0200" class="btn_ico btn_close2">닫기</a>
				</div>
			</div>
		</div>
		<!-- //header -->