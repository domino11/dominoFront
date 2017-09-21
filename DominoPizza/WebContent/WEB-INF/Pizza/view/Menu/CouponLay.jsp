<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="euc-kr">
<title>도미노피자</title>
<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css">
<link rel="stylesheet" type="text/css" href="/resources/css/font.css">
<meta name="viewport" id="viewport" content="width=1119px, user-scalable=yes">
<script type="text/javascript" src="/resources/js/jquery1.11.1.js"></script>
<script type="text/javascript" src="/resources/js/d2CommonUtil.js"></script>
<script type="text/javascript" src="/resources/js/d2FormUtilByJquery.js"></script>
</head>
<body>

<script type="text/javascript">
var firstApproach = true;
$(document).ready(function() {
	$.ajaxSetup({cache:false});
	
	$(document).ajaxStart(function() {
		$("#layerLoading").show();
	}).ajaxStop(function() {
		$("#layerLoading").hide();
	});
	
// 	alert("$outCd : " + "");
	
	var pName   = parent.$("#goodsList tr td span:eq(0)").html();
	var pLength = parent.$("#goodsList tr").length-2;

	if(pLength > 0){
		$("#pzName").text(pName+" "+"외"+" "+pLength+"건");
	}else{
		$("#pzName").text(pName);
	}

	$("input[name='prmt']").click(function(e) {
		$.ajax({
			url : "/prmt/prmtDetail?pid="+$(this).val(),
			type : 'POST',
			dataType : 'html',
			success : function(data) {
				$("#detailArea").html(data);
			}
		});
	});

	
			var dc_ref_p_idx = "140";
		

	$("#cp"+dc_ref_p_idx).prop("checked", true);
	$.ajax({
		url : "/prmt/prmtDetail?pid="+$("#cp"+dc_ref_p_idx).val()+"&p_idx=1317",
		type : 'POST',
		dataType : 'html',
		success : function(data) {
			$("#detailArea").html(data);
			firstApproach = false;
		}
	});


	$("dl").each(function() {
		if($(this).find("li").length == 0) {
			$(this).parent("li").remove();
		}
	});
	
});


var selectPrmt = function(failReloadYN){

	if(validationPrmt()){
		var prmtData = getPrmtData();

		if(prmtData == null){
			return;
		}

		prmtData.action_code = 'selectDC';

		$.ajax({
			url : '#',
			type : 'POST',
			async: false,
			dataType : 'json',
			data : prmtData,
			success : function(data) {
				if(true){
					parent.getOrderInfoDetail("N");
					parent.closePrmtLayer();
				} else {
					alert(data.msg);
					if(failReloadYN == 'Y') location.reload();
				}
				firstApproach = false;
			}
		});
	}
}



//라디오박스 체크



</script>

<!-- 도미노가 준비한 모든 할인 혜택 팝업(s)) -->
<div class="pop_content benefits_frame"><!-- 프레임html영역클래스구별 : benefits_frame -->
	<!-- 로딩 이미지 -->
	<div class="loading" id="layerLoading" style="display:none;">
		<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/loading.gif" alt="loading">
		<div class="dim"></div>
	</div>
	<!-- // 로딩 이미지 -->
	<div class="benefits_info">
		<div class="lst_benefits">
			<ul>
			<li>
							<dl>

							<c:if test="${empty Slist }">
							<dt style="color: red;" >사용가능한 쿠폰이 없습니다.</dt>
							</c:if>
							<c:if test="${!empty Slist }">
								<dt>나만을 위한 쿠폰, 프로모션</dt>
							</c:if>
								<dd>
									<ul>
										<c:if test="${!empty Slist }" var="cp" >

										<c:forEach items="${Slist }" var="dto" varStatus="loop" >
										<li>
											<span class="custom_form">
												<input type="radio" onchange="lck('${dto.mc_no}')" name="prmt" class="rad" id="${dto.mc_no }" value="${dto.c_saile }">
													<label for="${dto.mc_no}" class="ip_rdo">
														<em></em>
														<span id="${dto.mc_no }_a" >${dto.c_name }</span>
													</label>
											</span>
											</li>
										</c:forEach>
										</c:if>

											<script>
											var fnprice="";
											function AddComma(data_value) {
												return Number(data_value).toLocaleString('en');
												}
											
											function lck(no){
												var te = document.getElementById(""+no).value;
												var minprice = document.getElementById("area_dc_price");
												var minnumber=Number(parseInt(${TOTALPRICE})*(te/100)).toLocaleString('en');
												minprice.innerHTML = "-"+minnumber+"원"; 
												var fprice = document.getElementById("area_before_account_price2");
												var fnprice = parseInt(${TOTALPRICE}*(1-te/100));
												var cnamedom = document.getElementById("area_p_name");
												var fsno = document.getElementById("fsno");
												fsno.value=no;
												cnamedom.innerHTML = document.getElementById(no+"_a").innerHTML;
												fnprice = Number(fnprice).toLocaleString('en');
												fprice.innerHTML = fnprice;
												
											}
											
											
											
											
											
											</script>
										</ul>
								</dd>
							</dl>
						</li>
						<!-- 
					<li>
						<dl>
							<dt>인터넷 주문, 세트, 프로모션</dt>
							<dd>
								<ul>
									<li>
										cnamedom.innerHTML = document.getElementById(no+"_a").innerHTML;
												fnprice = Number(fnprice).toLocaleString('en');
												fprice.innerHTML = fnprice;
												<c:set value='fnprice' var='fnprice' scope="session" />
												<c:set value='minprice.innerHTML' var='minnumber' scope="session" />
												alert(${minnumber});
												alert(${fnprice});
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp115" value="115">
												<label for="cp115" class="ip_rdo">
													<em></em><span>희망나눔세트 20% 할인</span>
												</label>
											</span>
										</li>
									</ul>
							</dd>
						</dl>
					</li>

					<li>
						<dl>
							<dt>매장별 특별할인</dt>
							<dd>
								<ul>
									</ul>
							</dd>
						</dl>
					</li>

					<li>
						<dl>
							<dt>상품권 및 쿠폰할인</dt>
							<dd>
								<ul>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp130" value="130">
												<label for="cp130" class="ip_rdo">
													<em></em><span>쿠폰코드입력<br>(DM, E-mail, 이벤트쿠폰, 전단)</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp438" value="438">
												<label for="cp438" class="ip_rdo">
													<em></em><span>도미노콘</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp150" value="150">
												<label for="cp150" class="ip_rdo">
													<em></em><span>도미노피자 상품권/무료교환권</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp383" value="383">
												<label for="cp383" class="ip_rdo">
													<em></em><span>M12모바일 기프트권(LG U+ 갤럭시6 쿠폰)</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp474" value="474">
												<label for="cp474" class="ip_rdo">
													<em></em><span>카카오톡 금액 할인권(우와한반값)</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp165" value="165">
												<label for="cp165" class="ip_rdo">
													<em></em><span>도미노피자 하나카드 쿠폰</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp434" value="434">
												<label for="cp434" class="ip_rdo">
													<em></em><span>T라이프 할인 쿠폰</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp459" value="459">
												<label for="cp459" class="ip_rdo">
													<em></em><span>현대카드 조커</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp471" value="471">
												<label for="cp471" class="ip_rdo">
													<em></em><span>LGU+ 쿠폰</span>
												</label>
											</span>
										</li>
									</ul>
							</dd>
						</dl>
					</li>

					<li>
						<dl>
							<dt>할인 및 제휴</dt>
							<dd>
								<ul>
									<li>
												<span class="custom_form">
													<input type="radio" name="prmt" id="cp456" value="456">
													<label for="cp456" class="ip_rdo">
														<em></em><span>KT 더블할인 멤버십 차감(VIP 40% 및 일반 30%)</span>
													</label>
												</span>
											</li>
									<li>
												<span class="custom_form">
													<input type="radio" name="prmt" id="cp265" value="265">
													<label for="cp265" class="ip_rdo">
														<em></em><span>현대카드 M/S/W 포인트 30%차감</span>
													</label>
												</span>
											</li>
										<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp442" value="442">
												<label for="cp442" class="ip_rdo">
													<em></em><span>웰페어클럽 복지카드 10% 청구할인</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp397" value="397">
												<label for="cp397" class="ip_rdo">
													<em></em><span>비씨카드 오포인트 30%차감, 1% 적립</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp349" value="349">
												<label for="cp349" class="ip_rdo">
													<em></em><span>SKT 티플/커플 멤버십 차감(일반 20%/VIP 30%)</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp210" value="210">
												<label for="cp210" class="ip_rdo">
													<em></em><span>SKT멤버십 차감(일반 20% 및 VIP30% 차감)</span>
												</label>
											</span>
										</li>
									하나sk카드 조건 추가해야됨 
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp222" value="222">
												<label for="cp222" class="ip_rdo">
													<em></em><span>하나카드 Touch 1/하나 SK패밀리카드(일반 35%/VIP 50%차감)</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp369" value="369">
												<label for="cp369" class="ip_rdo">
													<em></em><span>KT 멤버십 차감(일반 15% 및 VIP 20% 차감)</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp428" value="428">
												<label for="cp428" class="ip_rdo">
													<em></em><span>LG U+ 멤버십 차감(일반 15% 및 VIP 20% 차감)</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp461" value="461">
												<label for="cp461" class="ip_rdo">
													<em></em><span>삼성카드 보너스 포인트 100% 사용</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp338" value="338">
												<label for="cp338" class="ip_rdo">
													<em></em><span>OK캐시백 현금 2%/카드 1% 적립, 50% 차감</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp332" value="332">
												<label for="cp332" class="ip_rdo">
													<em></em><span>현대자동차 블루멤버스 15%적립, 30%차감</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp334" value="334">
												<label for="cp334" class="ip_rdo">
													<em></em><span>기아자동차 레드멤버스 15%적립, 30%차감</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp350" value="350">
												<label for="cp350" class="ip_rdo">
													<em></em><span>신한하이포인트 30%차감</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp346" value="346">
												<label for="cp346" class="ip_rdo">
													<em></em><span>NH농협카드 총금액 30% 할인</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp358" value="358">
												<label for="cp358" class="ip_rdo">
													<em></em><span>KB국민카드 사랑나눔 세트 25% 할인</span>
												</label>
											</span>
										</li>
									<li>
											<span class="custom_form">
												<input type="radio" name="prmt" id="cp443" value="443">
												<label for="cp443" class="ip_rdo">
													<em></em><span>현대ZERO/M카드 발급 할인 쿠폰</span>
												</label>
											</span>
										</li> -->
										
										
									</ul>
							</dd>
						</dl>
					</li>

					</ul>
		</div>

		<div class="lst_benefits_view" id="detailArea">

		</div>

	</div>

	<div class="benefits_end">
		<div class="benefits_price">
			<dl class="order_price">
				<dt>주문금액</dt>
				<dd><span id="area_total_price" data-price="${TOTALPRICE }">
						<fmt:formatNumber type="number" >
						 ${TOTALPRICE }
						</fmt:formatNumber>
						 원
					</span>
					<em id="pzName" style="display:none;"></em></dd>
			</dl>
			<dl class="sale_price">
				<dt>할인금액</dt>
				<dd><span id="area_dc_price" data-price="7180">
						-0 원
					</span>
					<em id="area_p_name"> </em>
					</dd>
			</dl>
			<dl class="expected_price">
				<dt>결제 예정금액</dt>
				<dd><span id="area_before_account_price" data-price="${TOTALPRICE }" >
						<del><fmt:formatNumber>${TOTALPRICE }</fmt:formatNumber>원</del>
						<span id="area_before_account_price2"><fmt:formatNumber>${TOTALPRICE }</fmt:formatNumber></span>원
						<input type="hidden" value="" id="fsno" >
					</span>
				</dd>
			</dl>
		</div>
		<a href="javascript:layclose();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">확인</span></a>
	</div>
</div>

<script>
	function layclose(){
		parent.closePrmtLayer(document.getElementById("area_before_account_price2").innerHTML,document.getElementById("area_dc_price").innerHTML
		,document.getElementById("area_p_name").innerHTML,document.getElementById("fsno").value	
		);
	}

</script>

</body>
</html>