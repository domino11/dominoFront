<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 하프앤하프 토핑추가하기 팝업 -->

<!-- 마이 키친 토핑 선택팝업(s) -->
<div class="bg"></div>
<div class="pop_wrap">
	<div class="pop_header">
		<h2>토핑 선택</h2>
	</div>
	<div class="pop_content">
		<p class="txt_topping">- 피자한판당 5개까지 토핑추가 가능</p>
		<a href="javascript:showLayer('toppingAllergic');" class="btn_allergy_info"><span class="ico ico_ex_mark"></span>토핑 알레르기 유발성분</a>
		<div class="tab tab_type2">
			<ul class="btn_tab">
				<li class="active"><a href="#" id="T0100">메인</a></li>
				<li><a href="#" id="T0300">치즈</a></li>
				<li><a href="#" id="T0400">애프터</a></li>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">
					<div class="lst_topping_wrap">
						<ul> <!-- class="bg_lst_gray" -->
						</ul>
					</div>
				</div>

			</div>
		</div>
		<div class="btn_wrap topping_tatal">
			<div class="btn_fix_lft">
				<a href="javascript:toppingReset();" class="btn"><span class="btn_txt">초기화</span></a>
			</div>
			<div class="btn_fix_rgt">
				<p><strong>토핑금액 : </strong><span id="toppingTotalAmount">총 0원</span></p>
			</div>
		</div>
		<a href="javascript:setToppingCheck();" class="btn btn_mdle btn_red btn_block"><span class="btn_txt">토핑 추가하기 <span id="toppingTotalCnt"></span></span></a>

	</div>
	<a href="javascript:closeLayer();" class="btn_ico btn_close">닫기</a>
</div>
<!-- //마이 키친 토핑 선택팝업(e) -->

<div class="pop_layer pop_type pop_toppingAllergic" id="allergy_info"></div>
<script>
$(".T0100").show();

$(".tab .btn_tab li a").click(function(e) {
	e.preventDefault();
	$(".toppingli").hide();
	$(".btn_tab li").removeClass("active");
	$(this).parent().addClass("active");
	$("."+$(this).attr("id")).show();
});

if($("#toppingList").val() != "") { // 토핑 초기 셋팅
	var toppingArr = $("#toppingList").val().split(",");
	$.each(toppingArr, function(i, v) {
		var toppingMap = v.split(":");
		$("#"+toppingMap[0]).addClass("active");
		$("."+toppingMap[0]).val(toppingMap[1]);
	});

	setToppingTotalCnt();
}

$(".toppingselect").change(function() {
	if($(this).val() > 0) {
		$("#"+$(this).data("code")).addClass("active");
	} else {
		$("#"+$(this).data("code")).removeClass("active");
	}

	setToppingTotalCnt($(this));
});

var toppingReset = function() {
	$(".toppingselect").each(function() {
		$("#"+$(this).data("code")).removeClass("active");
		$(this).val("0");
	});
	setToppingTotalCnt();
};

var toppingTotalAmount = 0;
var setToppingTotalCnt = function(obj) {
	var toppingTotalCnt = 0;
	toppingTotalAmount = 0
	$(".toppingselect").each(function() {
		if($(this).val() != "0") {
			toppingTotalCnt += parseInt($(this).val());
			toppingTotalAmount += parseInt($(this).val()) * parseInt($(this).data("price"));
		}
	});

	if(toppingTotalCnt > 5) {
		alert("추가 토핑은 한 판당 최대 5개까지 선택 가능합니다.");
		obj.val("0");
		$("#"+obj.data("code")).removeClass("active");
		setToppingTotalCnt();
		return;
	}
	if(toppingTotalCnt == 0) {
		$("#toppingTotalCnt").text("");
		$("#toppingTotalAmount").html("총 0원");
	} else {
		$("#toppingTotalCnt").text("("+toppingTotalCnt+")");
		$("#toppingTotalAmount").text("총 "+toppingTotalAmount.cvtNumber()+"원");
	}

};

var setToppingCheck = function() {
	var toppingList = "";

	$(".toppingselect").each(function() {
		if($(this).val() != "0") {
			if(toppingList != "") {
				toppingList += ",";
			}
			toppingList += $(this).data("code") + ":" + $(this).val();
		}
	});

	$.ajax({
		type: "POST",
		url: "/goods/pauseCheck",
		data: { 'topping': toppingList },
		success:function(data) {
			if(data.resultData.result == "success") {
				setTopping();
			} else {
				alert(data.resultData.result);
				return;
			}
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
};

var setTopping = function() {
	var toppingList = "";
	var totalAmt = 0;
	var toppingNmList = "";
	var toppingTotalCnt = 0;
	$(".toppingselect").each(function() {
		if($(this).val() != "0") {
			if(toppingList != "") {
				toppingList += ",";
				toppingNmList += ",";
			}
			toppingTotalCnt += parseInt($(this).val());
			toppingList += $(this).data("code") + ":" + $(this).val();
			toppingNmList += $(this).data("nm") + " (" + $(this).val() + ")";
			totalAmt += parseInt($(this).data("price")) * parseInt($(this).val());
		}
	});

	if(toppingTotalCnt > 5) {
		alert("추가 토핑은 한 판당 최대 5개까지 선택 가능합니다.");
		return;
	}


	$("#toppingList").val(toppingList);
	$("#toppingTotalAmt").val(totalAmt);
	$("#toppingNmList").val(toppingNmList);

	if(toppingList != "") {
		var totalAmtStr = totalAmt.cvtNumber();
		var toppingSumHtml = toppingTotalCnt+"개 선택 : <strong>"+totalAmtStr+"원<span class='pizzaQty'>";

		if($("#qty").val() != "" && $("#qty").val() != "1") toppingSumHtml += " X 피자("+$("#qty").val()+")";
		$(".toppingSum").html(toppingSumHtml+"</span></strong>");
		//$(".balloon_wrap").show();

	} else {
		//$(".balloon_wrap").hide();
		$(".toppingSum").html("내맘대로 토핑을 추가해보세요.");
	}

	closeLayer();
	//총액 반영
	setTotalAmt();
};

var showLayer = function(layerNm) {
	$.ajax({
		type: "GET",
		url: "/contents/"+layerNm,
		success:function(data) {
			$(".pop_"+layerNm).html(data);
			$(".pop_"+layerNm).addClass("open");
			var top = $(window).scrollTop();
			$(".pop_"+layerNm).find('.pop_wrap').css('top',top+30+'px');
		},
		error: function (error){
			alert("다시시도해주세요.");
		}
	});
};
</script>