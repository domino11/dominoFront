var vrPlay = true;
var aniIdx = 0;
var subsidiaryH = 0;

var isIE = /*@cc_on!@*/false || !!document.documentMode;

function scaleVR(idx){
	if(!vrPlay)
		return;

	$("#vr div.on").ANI(function() {
		var old = $("#vr div.on");
		old.removeClass("fadeIn");
		if(idx > 0)
			aniIdx = idx;
		else
			aniIdx++;
		if(aniIdx > 2)
			aniIdx = 0;

		$(".control-btns a").removeClass("on");
		$(".control-btns a").eq(aniIdx).addClass("on");


		$("#vr div").eq(aniIdx).addClass("fadeIn on").TRANSITION(function() {
			$("#vr div").eq(aniIdx).addClass("on");
			old.removeClass("on");
			scaleVR(-1);
		});
	});
}

$(function() {
    subsidiaryH = 147;
    refreshGnbH();

	$(window).resize(function(){
		refreshGnbH();
	});

	setTimeout(function(){
		$("#wrap.main").parent().addClass("load");
	}, 300);

	$("#vr div.first").addClass("on");
	scaleVR(-1);

	$(".control-btns a.btn-stop").click(function(){
		vrPlay = false;
		$(this).hide();
		$(".control-btns a.btn-play").show();
		$("#vr div").removeClass("running");
		$("#vr div").addClass("paused");
		return false;
	});
	$(".control-btns a.btn-play").click(function(){
		vrPlay = true;
		$(this).hide();
		$(".control-btns a.btn-stop").show();
		$("#vr div").removeClass("paused");
		$("#vr div").addClass("running");
		scaleVR(-1);
		return false;
	});

	$(".control-btns a.page").click(function(){
		var idx = parseInt($(this).attr("data-idx"));
		$(".kv-copy li").off("transitionend webkitTransitionEnd transitionend otransitionend MSTransitionEnd");
		$("#vr div").off("transitionend webkitTransitionEnd transitionend otransitionend MSTransitionEnd");
		$("#vr div").off("animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd");


		var old = $("#vr div.on");
		old.removeClass("fadeIn");
		aniIdx = idx;
		
		$(".control-btns a").removeClass("on");
		$(".control-btns a").eq(aniIdx).addClass("on");

		$(".kv-copy li.on").addClass("fadeOut").TRANSITION(function() {
			$(".kv-copy li.fadeOut").removeClass("on fadeOut");
		});
		$(".kv-copy li").eq(aniIdx).addClass("on");

		$("#vr div").eq(aniIdx).addClass("fadeIn on").TRANSITION(function() {
			$("#vr div").eq(aniIdx).addClass("on");
			old.removeClass("on");
		});

		scaleVR(-1);
		return false;
	});
});

function refreshGnbH() {
    var h = $(window).height();
    var headerH = $("#header").height();

    var contH = h - (headerH + subsidiaryH);
    if (contH < 459) {
        contH = 459;
    }

    $(".tbl-mid").css("height", contH / 3);
    $("#wrap.main .gnb-copy .left").height(contH);
}
