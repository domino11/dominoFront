function setSearchCookie(cookieName, cookieValue)
{
	var ex = getSearchCookie(cookieName);
	//cookieValue = trimKeyword(cookieValue);
	var isExist = ex.indexOf(cookieValue + "|;|");
	if (isExist != -1) { // 중복되는 키워드 제거
		ex = ex.replace(cookieValue + "|;|", "");
	}
	var cookieLength = 5; // 쿠키에 5개까지 저장
	// var re = /[~!@\#$%^&*\()\=+|\\/:;?"<>']/gi;
	// cookieValue = cookieValue.replace(re, "");
	ex = cookieValue + "|;|" + ex;
	var strArray = ex.split("|;|");
	var output = "";

	for (var i = 0; i < strArray.length && i < cookieLength; i++) {
		if (strArray[i] != "") {
			output = output + strArray[i] + "|;|";
		}
	}
	// document.cookie = cookieName + "=" + escape( output ) + ";";
	var cookie = document.cookie;
	var ExpDate = new Date();
	ExpDate.setTime(ExpDate.getTime() + 1000 * 60 * 60 * 24); // 쿠키 만료일 (하루)

	startIndex = cookie.indexOf(cookieName);
	endIndex = cookie.indexOf(";", startIndex);
	var cookieReplace = cookie.substring(0, startIndex)	+ cookie.substring(endIndex + 1, cookie.length);
	cookieReplace = cookieReplace.replace(" ", "");
	document.cookie = cookieName + "="	+ escape(output).replace("undefined", "") + "; path=/;expires="	+ ExpDate.toGMTString() + ";";
	//document.cookie = cookie.substring(0,startIndex)+cookieName + "=" + escape( output ) + ";"+cookie.substring(endIndex+1,cookie.length);;
	
	
	
}

function trimKeyword(str){
	//return str.replace(/(^\s*)|(\s*$)/gi, "");
	var  re = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\(\=]/gi;
	return str.replace(re, "");
}

function delSearchCookie(cookieName, cookieVal, count) {
	var ex = getSearchCookie(cookieName);
	ex = ex.replace(cookieVal + "|;|", "");
	var ExpDate = new Date();
	ExpDate.setTime(ExpDate.getTime() + 1000 * 60 * 60 * 24); // 쿠키 만료일 (하루)
	document.cookie = cookieName + "=" + escape(ex) + "; path=/;expires=" + ExpDate.toGMTString() + ";";
	$("#cookie"+count).remove();
}

function getSearchCookie(cookieName) {
	var cookie = document.cookie;

	if (cookie.length > 0) {
		// 해당 쿠키명이 존재하는지 검색한 후 존재하면 위치를 리턴.
		startIndex = cookie.indexOf(cookieName);
		if (startIndex != -1) {
			startIndex += cookieName.length;

			endIndex = cookie.indexOf(";", startIndex);

			if (endIndex == -1)
				endIndex = cookie.length;

			return unescape(cookie.substring(startIndex + 1, endIndex));
		} else {
			return "";
		}
	} else {
		return "";
	}
}

// 검색 탭 클릭 이벤트
function onClickTab(id, searchKeyword){
	addActiveClass('li', id);
	$("#type").val(id);
	$("#searchTxt").val(searchKeyword);
	$("#searchForm").submit();
}

// 키워드 클릭시 검색 이벤트
function onClickSearch(keyword) {
	setSearchCookie('myKeyword', keyword)
	$("#searchTxt").val(keyword);
	$("#searchForm").submit();
}

/**
 * 전체 검색
 */
function allSearch(gubun,input) {

	var keyword='';
	
	if(input == 'header'){
		keyword = trimKeyword($("#search_txt").val());
	}else if(input == 'top'){
		keyword = trimKeyword($("#search_txt2").val());
	}else{
		keyword = trimKeyword($("#search_txt3").val());
	}

	
	if (keyword == "") {
		if(($("#dSearchTerm").val() != "" && $("#dSearchTerm").val() != null) && gubun == 'all'){
			detailSearch();
			return;
		}
		$("#search_txt").attr('placeholder', '검색어를 입력해주세요');
		if("all" != gubun){
			alert("검색어를 입력해주세요");
			return;
		}
		
	}else {
		$("#searchTerm").val(keyword);
		setSearchCookie('myKeyword', keyword);
	}
	
	setSearchCookie('myKeyword', keyword);
	
	$("#category").val("");
	$("#page").val("1");
	$("#area").val("");
	$("#startDate").val('');
	$("#endDate").val('');
	$("#dSearchTerm").val("");
	$("#dSearchSelect").val("");
	$("#pSrchtypetmp").val("");
	$("#pDate").val('');
	
	if(gubun == 'main'){
		$("#searchTerm_main").val(keyword);
		$("#searchTerm").val("");
		$("#searchForm_main").attr("action","/search/search");
		$("#searchForm_main").submit();
	}else{
		$("#searchTerm_main").val("");
		$("#searchForm").attr("action","search");
		$("#searchForm").submit();
	}
	
}


/**
 * 인기검색어, 내가찾은검색어 클릭
 */
function selectSearch(keyword) {
	//alert("asd");
	
	if (keyword == "") {
		$("#search_txt").attr('placeholder', '검색어를 입력해주세요');
		return;
	} else {
		$("#searchTerm").val(keyword);
		setSearchCookie('myKeyword', keyword);
	}
	
	setSearchCookie('myKeyword', keyword);
	
	$("#category").val("");
	$("#page").val("1");
	$("#area").val("");
	$("#startDate").val('');
	$("#endDate").val('');
	$("#dSearchTerm").val("");
	$("#dSearchSelect").val("");
	$("#pSrchtypetmp").val("");
	$("#pDate").val('');

	$("#searchForm").attr("action","search");
	$("#searchForm").submit();
}

/**
 * 메인 - 인기검색어, 내가찾은검색어 클릭
 */
function mainSelectSearch(keyword) {
	//alert("asd");
	
	if (keyword == "") {
		$("#search_txt").attr('placeholder', '검색어를 입력해주세요');
		return;
	} else {
		$("#searchTerm_main").val(keyword);
		setSearchCookie('myKeyword', keyword);
	}
	
	setSearchCookie('myKeyword', keyword);
	$("#searchTerm").val("");
	$("#searchForm_main").attr("action","/search/search");
	$("#searchForm_main").submit();
}

//더보기
function moreSearch(cat) {
	$("#category").val(cat);
	$("#page").val("1");
	//$("#area").val("");
	$//("#pDate").val("");
	$("#searchForm").attr("action","/search/more");
	$("#searchForm").submit();
}


//페이지선택
function pageNavigate(page){
	$("#page").val(page);
	$("#searchForm").attr("action","/search/more");
	$("#searchForm").submit();
}


function addActiveClass(tag, id){
	$(tag).removeClass("active");
	$("#" + id).addClass("active");
}

// 정렬 필드 조건 선택(정확도 or 최신순)
function selectOrder(order) {
	$("#page").val('1');
	$("#order").val(order);
	
	if($("#category").val() != ""){
		$("#searchForm").attr("action","/search/more");
	}else{
		$("#searchForm").attr("action","/search/search");
	}
	
	$("#searchForm").submit();
}

//검색범위 조건 선택(정확도 or 최신순)
function selectArea(area) {
	$("#page").val('1');
	$("#area").val(area);
	if($("#category").val() != ""){
		$("#searchForm").attr("action","/search/more");
	}else{
		$("#searchForm").attr("action","/search/search");
	}
	
	$("#searchForm").submit();
}

//검색기간 선택
function selectDate(flag) {
	setDate(flag);
	$("#page").val('1');
	if($("#category").val() != ""){
		$("#searchForm").attr("action","/search/more");
	}else{
		$("#searchForm").attr("action","/search/search");
	}
	$("#searchForm").submit();
}

//상세검색
function detailSearch(){
	var dkeyword="";
	var dselect="";
	var cnt = 0;
	$("input[name=detailSearch_txt]").each(function(){
		if($(this).val()!=""){
			if(cnt == 0){
				dkeyword = trimKeyword($(this).val());
				cnt = 1;
			}else{
				dkeyword = dkeyword +'!@#'+$(this).val();
				if(cnt==1){
					dselect = $("#detailSearch_select1").val();
					cnt = 2;
				}else{
					dselect = dselect+"!@#"+$("#detailSearch_select2").val();
				}
			}
		}
	});
	if (dkeyword == "") {
		$("#detailSearch_txt1").attr('placeholder', '검색어를 입력해주세요.');
		alert("검색어를 입력해주세요");
		return;
	}
	
	if($("#dpsdate").val()!="" && $("#dpedate").val()!=""){
		var sdate = $("#dpsdate").val().replace(/-/gi,"");
		var edate = $("#dpedate").val().replace(/-/gi,"");
		if(sdate > edate){
			alert("검색기간을 다시 선택해 주세요.");
			return;
		}
		if(sdate == edate){
			$("#startDate").val('');
			$("#endDate").val('');
		}else{
			$("#startDate").val($("#dpsdate").val());
			$("#endDate").val($("#dpedate").val());
		}
	}
	
	var tmp="";
	$("#pSrchtypetmp_radio:checked").each(function(){
		tmp=tmp + $(this).val()+"!@#";
	});
	
	var sel="";
	$("#selCheckbox:checked").each(function(){
		sel=sel + $(this).val()+"!@#";
	});

	$("#dSearchTerm").val(dkeyword);
	$("#dSearchSelect").val(dselect);
	$("#pSrchtypetmp").val(tmp);
	if($("input:radio[name=orderRadioOptions]:checked").val()!=""){
		$("#order").val($("input:radio[name=orderRadioOptions]:checked").val());
	}
	$("#area").val(sel);
	$("#category").val("");
	$("#page").val("1");
	$("#searchTerm").val("");
	$("#searchTerm_main").val("");
	$("#pDate").val("");
	
	$("#planetSizemk").val("0");
	$("#planetSize2mk").val("0");
	$("#astroSizemk").val("0");
	$("#astroSize2mk").val("0");
	$("#recordSizemk").val("0");
	$("#knowSizemk").val("0");
	$("#infoSizemk").val("0");
	$("#thesisSizemk").val("0");
	
	
	$("#searchForm").attr("action","/search/search");
	$("#searchForm").submit();
	
}


function detailDate(flag){
	var today = new Date();
	var sDate = new Date();
	var sYear = sDate.getFullYear();
	var sMonth = sDate.getMonth() + 1;
	var sDay = sDate.getDate();
	

	if (flag == 'week') {
		sDate.setDate(today.getDate()-7);
	} else if (flag == 'month') {
		sDate.setDate(today.getDate()-30);
	} else if (flag == 'year') {
		sDate.setDate(today.getDate()-365);
	} 
	sYear = sDate.getFullYear();
	sMonth = sDate.getMonth()+1;
	sDay = sDate.getDate();
	
	
	var dateS = sYear + "-" + (sMonth<10?'0'+sMonth:sMonth)+ "-" + (sDay<10?'0'+sDay:sDay);
	var dateE = today.getFullYear() + "-" + ((today.getMonth() + 1)<10?'0'+(today.getMonth() + 1):today.getMonth() + 1) + "-" + (today.getDate()<10?'0'+today.getDate():today.getDate());
	$("#dpsdate").val(dateS);
	$("#dpedate").val(dateE);
}



function detailSearchDelete(){
	$("input[name=detailSearch_txt]").each(function(){
		$(this).val("");
	});
	$("#detailSearch_select1").find("option:first").attr("selected","selected");
	$("#detailSearch_select2").find("option:first").attr("selected","selected");
	$("#pSrchtypetmp_radio:checked").each(function(){
		$(this).attr("checked",false);
	});
	$("#selCheckbox:checked").attr("checked",false);
	$("#pSrchtypetmp_radio:checked").each(function(){
		$(this).attr("checked",false);
	});
	$("input:radio[name=orderRadioOptions]:checked").attr("checked",false);
	$("#dpsdate").val("");
	$("#dpedate").val("");
	$("input:radio[name=dateRadioOptions]:checked").attr("checked",false);
	
}

function detailSearchClose(){
	$("#searchOptionClose").trigger("click");
}





function activeOrder(id) {
	var tag = "#order a";
	var param = id + "Order";
	addActiveClass(tag, param)
	$("#orderField").val(id);
}

// 검색 필드 조건 선택(전체, 제목, 내용, 저자)
function selectSearchField(id) {
	var keyword = $("#searchTxt").val();
	activeSearchField(id);
	if (keyword != '') {
		$("#searchForm").submit();
	}
}

function activeSearchField(id) {
	var tag = "#searchArea a";
	var param = id + "Field";
	addActiveClass(tag, param)
	$("#searchField").val(id)
}

// 그룹 필터 키워드 세팅
function searchGroupFilter(keyword) {
	$("#groupFilterKeyword").val(keyword);
	$("#searchForm").submit();
}

//필터링 조건 선택
function selectFilter(id) {
	var keyword = $("#searchTxt").val();
	activeFilter(id);
	setDate(id)
	if (keyword != '') {
		$("#searchForm").submit();
	}
}

//필터링 조건 선택
function activeFilter(id) {
	var tag = "#dateFilter a";
	var param = id + "Filter";
	addActiveClass(tag, param)
	$("#filterKeyword").val(id);
	setDate(id)
}

// 필터링에 사용 할 기간 계산
function setDate(flag) {
	var today = new Date();
	var sDate = new Date();
	var sYear = sDate.getFullYear();
	var sMonth = sDate.getMonth() + 1;
	var sDay = sDate.getDate();
	

	if (flag == 'week') {
		sDate.setDate(today.getDate()-7);
		$("#pDate").val('week');
	} else if (flag == 'month') {
		sDate.setDate(today.getDate()-30);
		$("#pDate").val('month');
	} else if (flag == 'year') {
		sDate.setDate(today.getDate()-365);
		$("#pDate").val('year');
	} 
	sYear = sDate.getFullYear();
	sMonth = sDate.getMonth()+1;
	sDay = sDate.getDate();
	
	
	var dateS = sYear + "-" + (sMonth<10?'0'+sMonth:sMonth)+ "-" + (sDay<10?'0'+sDay:sDay);
	var dateE = today.getFullYear() + "-" + ((today.getMonth() + 1)<10?'0'+(today.getMonth() + 1):today.getMonth() + 1) + "-" + (today.getDate()<10?'0'+today.getDate():today.getDate());
	if (flag != 'all') {
		$("#startDate").val(dateS);
		$("#endDate").val(dateE);
	} else {
		$("#startDate").val('');
		$("#endDate").val('');
		$("#pDate").val('');
	}
}