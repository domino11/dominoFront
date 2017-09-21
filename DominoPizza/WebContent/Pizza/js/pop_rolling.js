var bx_play = true;
var pop_play = true;
var num = 0;
var pop_num = 0;

// 메인 비주얼
function startAction() {
	bx_play = true;
	startId = setInterval("action()",4000);
}
function action() {
	var length = $(".bxslider>ul>li").length;
	if(length == num) {
		num = 0;
	}
	num++;
	$(".bxslider>ul>li").find(">a").removeClass("on");
	//console.log(num-1);
	$(".bxslider>ul>li").eq(num-1).find(">a").addClass("on");
	$(".bxslider>ul>li").eq(num-1).find(">div").show();
	$(".bxslider>ul>li").eq(num-1).find(">div").stop().animate({"opacity":"1"},300);
	$(".bxslider>ul>li").eq(num-1).siblings().find(">div").stop().animate({"opacity":"0"},300,function() {
		$(".bxslider>ul>li").eq(num-1).siblings().find(">div").hide();
	});
}
function stopBxRolling() {
	bx_play = false;
	clearInterval(startId);
}



// 팝업존
function startPopRolling() {
	pop_play = true;
	startId2 = setInterval("action2()",4000);
}
function action2() {
	var length = $(".popzone>li").length;
	if(length == pop_num) {
		pop_num = 0;
	}
	pop_num++;
	$(".popzone>li").find(">a").removeClass("on");
	$(".popzone>li").eq(pop_num-1).find(">a").addClass("on");
	$(".popzone>li").eq(pop_num-1).find(">div").show();
	$(".popzone>li").eq(pop_num-1).find(">div").stop().animate({"opacity":"1"},300);
	$(".popzone>li").eq(pop_num-1).siblings().find(">div").stop().animate({"opacity":"0"},300,function() {
		$(".popzone>li").eq(pop_num-1).siblings().find(">div").hide();
	});
}
function stopPopRolling() {
	pop_play = false;
	clearInterval(startId);
}




$(function() {
	
	// 메인비주얼
	$(".bxslider .start").click(function() {
		bx_play = true;
		$(this).hide();
		$(".bxslider .stop").show().focus();
		clearInterval(startId);
		startAction();
	});
	$(".bxslider .stop").click(function() {
		bx_play = false;
		$(this).hide();
		$(".bxslider .start").show().focus();
		clearInterval(startId);
	});
	
	$(".bxslider>ul>li>a").bind({
		"mouseenter focusin":function() {
			var n = $(this).parent().index();
			clearInterval(startId);
			$(".bxslider>ul>li").find(">a").removeClass("on");
			$(".bxslider>ul>li").eq(n).find(">a").addClass("on");
			$(".bxslider>ul>li").eq(n).find(">div").show()
			$(".bxslider>ul>li").eq(n).find(">div").stop().animate({"opacity":"1"},300);
			$(".bxslider>ul>li").eq(n).siblings().find(">div").stop().animate({"opacity":"0"},300,function() {
				$(".bxslider>ul>li").eq(n).siblings().find(">div").hide();
			});
			num = $(this).parent().index();
		},
		"mouseleave focusout":function() {
			if(bx_play) {
				clearInterval(startId);
				startAction();
			}
		},
		"click":function() {
			return false;
		}
	});

	$(".bxslider>ul>li>div").bind({
		"mouseenter":function() {
			var n = $(this).parent().index();
			clearInterval(startId);
			$(".bxslider>ul>li").eq(n).find(">div").show();
			$(".bxslider>ul>li").eq(n).find(">div").stop().animate({"opacity":"1"},300);
			$(".bxslider>ul>li").eq(n).siblings().find(">div").stop().animate({"opacity":"0"},300);
			$(".bxslider>ul>li").eq(n).siblings().find(">div").hide();
			num = $(this).parent().index();
		},
		"mouseleave":function() {
			if(bx_play) {
				clearInterval(startId);
				startAction();
			}
		}
	});
	
	// 팝업존
	$(".popzone>li:first-child>div").show();
	$(".popzone>li:first-child>a").addClass("on");
	$(".popzone>li:last-child").addClass("last");
	$(".popup_wrap .r .control .start").click(function() {
		pop_play = true;
		$(this).hide();
		$(".popup_wrap .r .control .stop").show().focus();
		clearInterval(startId2);
		startPopRolling();
	});
	$(".popup_wrap .r .control .stop").click(function() {
		pop_play = false;
		$(this).hide();
		$(".popup_wrap .r .control .start").show().focus();
		clearInterval(startId2);
	});
	
	$(".popzone>li>a").bind({
		"mouseenter focusin":function() {
			var n = $(this).parent().index();
			clearInterval(startId2);
			$(".popzone>li").find(">a").removeClass("on");
			$(".popzone>li").eq(n).find(">a").addClass("on");
			$(".popzone>li").eq(n).find(">div").show()
			$(".popzone>li").eq(n).find(">div").stop().animate({"opacity":"1"},300);
			$(".popzone>li").eq(n).siblings().find(">div").stop().animate({"opacity":"0"},300,function() {
				$(".popzone>li").eq(n).siblings().find(">div").hide();
			});
			pop_num = $(this).parent().index();
		},
		"mouseleave focusout":function() {
			if(pop_play) {
				clearInterval(startId2);
				startPopRolling();
			}
		},
		"click":function() {
			return false;
		}
	});

	$(".popzone>li>div>a").bind({
		"mouseenter focusin":function() {
			var n = $(this).parent().parent().index();
			clearInterval(startId2);
			$(".popzone>li").eq(n).find(">div").show();
			$(".popzone>li").eq(n).find(">div").stop().animate({"opacity":"1"},300);
			$(".popzone>li").eq(n).siblings().find(">div").stop().animate({"opacity":"0"},300);
			$(".popzone>li").eq(n).siblings().find(">div").hide();
			pop_num = $(this).parent().parent().index();
		},
		"mouseleave focusout":function() {
			if(pop_play) {
				clearInterval(startId2);
				startPopRolling();
			}
		}
	});
	
		
});