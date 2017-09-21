/******** Nav 2017 ********/

//Nav

var current;
function menuMouseOver(obj, id){
	//잘못된 출력으로 인한 주석처리 -이병운
//    current = $(obj);
//    $("#nav_title").attr("class", "ico_"+id).text(current.text());
//    navShow();
}

function menuMouseLeave(){
	//잘못된 출력으로 인한 주석처리 -이병운
//	current = $("a.active");
//	id = $("#nav > li > a").index($("a.active")) + 1;
//	$("#nav_title").attr("class", "ico_"+id).text(current.text());
//    navShow();
}

function navHidden(){
    $(".nav_depth, .nav_bg").hide();
}

function navShow(){
	if($(document).width() > 985){
	    navHeight();
	    $(".nav_depth").hide();
	    current.parent().find(".nav_depth").show();
	    $(".nav_bg").show();
	}
}

function navHeight(){
	if(current.parent().find(".nav_depth").height() > 60){
        $(".nav_depth").css({"top" : "76px"});
    }else if(current.parent().find(".nav_depth").height() > 30){
    	$(".nav_depth").css({"top" : "93px"});
    }else{
        $(".nav_depth").css({"top" : "105px"});
    }
}

$(function(){
	var responsive = $(document).width();
	var currentScrollTop = $(window).scrollTop();
	current = $("a.active");
	
	navHeight();
	
	$(window).on("scroll", function(){
    	currentScrollTop = $(window).scrollTop();
    	scrollController();
    }).on("resize", function(){
		responsive = $(document).width();
		scrollController();
	});
	scrollController();
	
	if($("#wrap").length){
		navHidden();
	    $("#header_wrap").mouseleave(navHidden);
	    $(".nav li:nth-last-child(4)").find("li").last().focusout(navHidden);
	}
	
	if($(".submain").length){
		navHidden();
		$("#sub_wrap .nav_bg").css("","");
	    $("#header_wrap").mouseleave(navHidden);
	    $(".nav li:nth-last-child(4)").find("li").last().focusout(navHidden);
	}
    
	//Mainmenu position
	function scrollController(){
	    if(responsive > 985){
	    	if($("#sub_wrap").length && !$(".submain").length){
		    	$("#location_wrap").show();
	    		$("#sub_wrap .nav_bg").css("","");
	    	}
	    	
	    	if($(".submain").length){
	    		$(".nav_bg, #location_wrap").hide();
	    	}
	    	
		    if(currentScrollTop < 72){
		        $("#header_wrap").removeClass("fixed");
		        
		        if($("#sub_wrap").length && !$(".submain").length){
			        current.parent().find(".nav_depth").show();
	                $(".nav_depth, #header_wrap").off();
	                $(".nav_bg, #location_wrap").show();
	                $("#header_wrap").mouseleave(menuMouseLeave);
	                $(".nav li:nth-last-child(4)").find("li").last().focusout(menuMouseLeave);
		        }
		    }else if(currentScrollTop > 72 && $(document).height() > 1280){
		    	$("#header_wrap").addClass("fixed");
		    	
		    	if($("#sub_wrap").length && !$(".submain").length){
			    	navHidden();
	                $("#header_wrap").mouseleave(navHidden);
	                //$("#location_wrap").hide();
	                $("#sub_wrap .nav_bg").css("","");
		    	}
		    }
	    }else{
	    	$("#header_wrap").removeClass("fixed");
	    	$(".nav_bg, #location_wrap").hide();
	    }
	}
});

//Mobile nav
$(function(){	
	var responsive = $(document).width();
	$(window).resize(function(){
		responsive = $(document).width();
		_mobileNav();
	});
	
	_mobileNav();
	
	function _mobileNav(){
		if(responsive > 768){
			$("#mobile_nav").hide();
		}
		if($("html").attr("class") === "ie8"){
			$("#mobile_nav").hide();
		}
	}
});

//Mobile toggle
$(function(){
	$(".mobile_gnb_toggle").click(function(){
		$("#mobile_nav").slideToggle();
	});
});

/* Top menu */
$(function(){
	var moreBtn = $(".more > li").find("button");
	var moreCnt = moreBtn.parent().find(".cont");
	
	moreBtn.click(function(){
		if($(this).parent().find(".cont").is(":hidden") === false){
			moreCnt.stop(true,true).slideUp(200);
		}else{
			if(moreCnt.is(":visible") === true){
				moreCnt.hide().find(".grab").css({opacity:0});
				$(this).parent().find(".cont").show().find(".grab").stop(true,true).animate({opacity:1},200);
			}else{
				$(this).parent().find(".cont").stop(true,true).slideDown(200).find(".grab").animate({opacity:1},200);
			}
		}
	});
	
	$(".more .mbg_3 ul:last li:last").focusout(function(){
		moreCnt.stop(true,true).slideUp(200);
	});
	
	$(document).click(function(e){ 
		if (!$(".header_link").has(e.target).length){
			moreCnt.stop(true,true).slideUp(200);
		}
	}); 
});

//Top
$(function(){
	$("#cntTop").hide();
	
    $(window).scroll(function(){
    	if ($(this).scrollTop() > 100) {
            $("#cntTop").fadeIn();
        }else{
            $("#cntTop").fadeOut();
        }
    	
    	var responsive = $(document).width();
    	$(window).resize(function(){
    		responsive = $(document).width();
    		_resizewidth();
    	});
    	_resizewidth();
    	
    	var currentscroll = $(this).scrollTop();
    	function _resizewidth(){
    		$("#container #cntTop").css({"bottom" : "30px"});
    		
    		if(responsive > 768){
    			if(currentscroll > $("#container").height() - 408){
    				$("#container #cntTop").css({"bottom" : "160px"});
    			}else{
    				$("#container #cntTop").css({"bottom" : "30px"});
    			}
    		}
    	}
    });
 
    $("#cntTop").click(function(){
        $("body, html").animate({scrollTop: 0}, 500);
        return false;
    });
});

//Dropdown menu
$(function(){
	$(".dropdown > a").click(function(){
		$(this).parent().find(".dropdown-menu").css({"min-width":($(this).outerWidth(true)+1)+"px"})
	});
});

//3depth
$(function(){
    var responsive = $(document).width();
    $(window).resize(function(){
        responsive = $(document).width();
        _depthWidth();
    });

    _depthWidth();

    function _depthWidth(){
        var area = $(".depth_3");
        var count = area.find("li").length;
        area.find("li:eq(0) > a").css({"margin-left" : 0});

        if(responsive > 1000){
            area.find("li").css({"width" : (100 / count) + "%"});
        }else{
            area.find("li").css({"width" : ""});
        }
        //ie8
        if($("html").attr("class") === "ie8"){
            area.find("li").css({"width" : (100 / count) + "%"});
        }
    }
});



//mobile nav 
$(function() {

	//기능정리
	//메뉴펼침
	//mobile-link class를 가진 객체를 클릭 했을 경우 작동
	$(".mobile-nav-link").click(function(event){
		//mobile-link클릭시 nav-menu에게 nav-active-menu-container class를 추가 시켜 해당 클래스가 가진 기능을 실행
		$(".nav-menu").addClass("nav-active-menu-container");
		//mobile-link클릭시 content에게 inactive-body class를 추가 시켜 해당 클래스가 가진 기능을 실행
		$(".mobile_nav_bg").addClass("inactive-body");
		//click 이벤트에 event라는 함수명을 줘서 해당 이벤트가 진행될때 a객체의 링크 기능을 작동하지 않도록 정의
		event.preventDefault();
	});
	
	//영역 외 클릭시 닫기
	$(document).click(function(event){
	//태그인 html 보다 document기준으로 잡으시고 
		if(!$(".mobile-nav-link").is(event.target) && !$(".nav-menu").is(event.target) && $(".nav-menu").has(event.target).length == 0){
			//브라우저 화면을 클릭시 .mobile-link, .nav-menu 가 이벤트의 타켓이 아니고, 클릭한 곳에 .nav-menu가 존재 할 경우 아래의 상태를 실행
			$(".nav-menu").removeClass("nav-active-menu-container");
			//외부 영역 클릭시 nav-menu에게 nav-active-menu-container class를 삭제(삭제후 신기하게 transform style이 알아서 역행하네요 ㅋㅋ)
			$(".mobile_nav_bg").removeClass("inactive-body");
			//외부 영역  클릭시 content에게 inactive-body class를 삭제
		}
	});

});
