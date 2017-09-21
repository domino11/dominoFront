/******** Korea Main Jquery 2017 *********/
/* visual */
$(function(){
	var visualArea = $("#visualarea .area");
	var visualCont = visualArea.find(".txt");
	
	var current = 0;
	var active;
	var returnNodes;
	var last;
	
	visualCont.css({"opacity":0}).hide().eq(0).css({"opacity":1}).show();
	
	visualCont.each(function(i){
		$(this).attr("id","area_" + i);
		visualArea.find(".control").append("<a href=#area_"+ i +">" + (i+1) + "</a>");
		$("#visual").append("<div id=area_"+ i +"></div>");
		
		last = i;
	});
	
	$("#visual > div").css({"opacity":0}).eq(0).css({"opacity":1});

	visualArea.find(".control a[href='#area_0']").addClass("active");
	
	function _rotate(){
		clearInterval(returnNodes);
		returnNodes = setInterval(function(){
			if(current === last){
				current = 0;
			}else{
				current = current + 1;
			}
			
			visualArea.find(".control a").removeClass("active");
			visualArea.find(".control a[href='#area_"+ current +"']").addClass("active");
			
			$("#visual").find("div").stop(true,true).animate({"opacity":0, "z-index":0}, 800);
			$("#visual").find("#area_" + current).stop(true,true).animate({"opacity":1, "z-index":1}, 800);
			
			visualCont.stop(true,true).animate({"opacity":0}, 1000).hide();
			visualArea.find("#area_" + current).show().stop(true,true).animate({"opacity":1}, 1000);
		},10000);
	}
	
	if(last != 0){
		_rotate();
	}
	
	visualArea.find(".control a").click(function(event){
		if(active != $(this).attr("href")){
			clearInterval(returnNodes);
			active = $(this).attr("href");
			
			visualArea.find(".control a").removeClass("active");
			$(this).addClass("active");
			
			$("#visual").find("div").stop(true,true).animate({"opacity":0, "z-index":0}, 800);
			$("#visual").find(active).stop(true,true).animate({"opacity":1, "z-index":1}, 800);
			
			visualCont.stop(true,true).animate({"opacity":0}, 1000).hide();
			visualArea.find(active).show().stop(true,true).animate({"opacity":1}, 1000);
		}
		event.preventDefault();
	});
	
	visualArea.find("#control a").click(function(){
		if($(this).attr("class").indexOf("icon-play") > -1) {
			_rotate();
			$(this).attr("class", "icon-pause");
			$(this).find("span").text("자동재생 중지");
		} else if($(this).attr("class").indexOf("icon-pause") > -1){
			clearInterval(returnNodes);
			$(this).attr("class", "icon-play");
			$(this).find("span").text("자동재생 시작");
		}
	});
});

$(document).on("click", "#control a", function(){
	
});



/* days info */
$(function(){
	var wrap = $(".service");
	var day = $(".days");
	var dayObj = day.find(".days_info");
	var nssao = $(".nssao");
	var nssaoObj = nssao.find(".nssao_info");
	
	var responsive = $(document).width();
	var grab = $(".popup_wrap").width();
	
	var active;

	$(window).resize(function(){
		responsive = $(document).width();
		grab = $(".popup_wrap").width();
		
		_objControl();
	});
	
	function _objControl(){
		if(responsive > 980){ 
			wrap.css({"width":"243px"});
			dayObj.css({"width":"auto"}).hide();
			nssaoObj.css({"width":"auto"}).hide();
			
			wrap.find(".sv_tab").unbind("click");
			wrap.find(".sv_tab").bind("click",function(event){
				active = $(this).attr("id");
				$("." + active).slideToggle(function(){
					if($("." + active).is(":visible")){
						$("#" + active).find("span").addClass("active").text("-");
					}else{
						$("#" + active).find("span").removeClass("active").text("+");
					}
				});
				event.preventDefault();
			});
		}else if($("html").attr("id") != "ie8"){
			if(responsive < 628){ 
				wrap.css({"width":"100%"});
				dayObj.css({"width":"100%"});
				nssaoObj.css({"width":"100%"});
			}else{
				wrap.css({"width":(grab-282)+"px"});
				dayObj.css({"width":(grab-282)+"px"}); 
				nssaoObj.css({"width":(grab-282)+"px"});
			}
			dayObj.hide(); 
			nssaoObj.show();
			
			wrap.find(".sv_tab").unbind("click");
			wrap.find(".sv_tab").bind("click",function(event){
				active = $(this).attr("id");
				
				dayObj.hide();
				nssaoObj.hide();
				$("." + active).show();
				
				if($("." + active).is(":visible")){
					$("#" + active).find("span").addClass("active").text("-");
				}else{
					$("#" + active).find("span").removeClass("active").text("+");
				}
				event.preventDefault();
			});
		}
	}
	
	_objControl();
});



/* 논문, 콜로퀴움 */
function paperBoard(wrap){
	var wrap = $(wrap);
	var objGroup = wrap.find("ul")
	var obj = wrap.find(".obj");
	var control = wrap.find(".control");
	
	var objNum = objGroup.find("li").length;
	var objStartNum = 1;
	
	control.find(".num strong").text(objStartNum);
	control.find(".num span").text(objNum);

	objGroup.find("li").hide().eq(0).show();
	
	control.find("a").click(function(event){
		if($(this).attr("class") === "prev"){
			if(objStartNum === 1){
				objStartNum = objNum;
			}else{
				objStartNum = objStartNum-1;
			}
		}
		if($(this).attr("class") === "next"){
			if(objStartNum === objNum){
				objStartNum = 1;
			}else{
				objStartNum = objStartNum+1;
			}
		}
		control.find(".num strong").text(objStartNum);
		objGroup.find("li").hide().eq(objStartNum-1).show().find("a").focus();
		
		event.preventDefault();
	});
}


