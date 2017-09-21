
dummyStyle = document.createElement('div').style;
vendor = (function () {
	var vendors = 't,webkitT,MozT,msT,OT'.split(','),
		t,
		i = 0,
		l = vendors.length;

	for ( ; i < l; i++ ) {
		t = vendors[i] + 'ransform';
		if ( t in dummyStyle ) {
			return vendors[i].substr(0, vendors[i].length - 1);
		}
	}

	return false;
})();

TRNEND_EV = (function () {
	if ( vendor === false ) return false;

	var transitionEnd = {
			''			: 'transitionend',
			'webkit'	: 'webkitTransitionEnd',
			'Moz'		: 'transitionend',
			'O'			: 'otransitionend',
			'ms'		: 'MSTransitionEnd'
		};

	return transitionEnd[vendor];
})();
ANI_EV = (function () {
	if ( vendor === false ) return false;

	var animationEnd = {
			''			: 'animationend',
			'webkit'	: 'webkitAnimationEnd',
			'Moz'		: 'AnimationEnd',
			'O'			: 'oAnimationEnd',
			'ms'		: 'MSAnimationEnd'
		};

	return animationEnd[vendor];
})();

(function ($) {
	$.fn.TRANSITION = function( callback ) {
		var ver = getIEVersion();
		if(ver > -1 && ver < 10){
			callback( $(this) );
			return;
		}
		if(TRNEND_EV != undefined){
			$(this).one(TRNEND_EV, function() {
				callback( $(this) );
			})
		}
		else{
			callback( $(this) );
		}
	}
})(jQuery);

(function ($) {
	$.fn.ANI = function( callback ) {
		if(ANI_EV != undefined){
			$(this).one(ANI_EV, function() {
				callback( this );
			})
		}
		else{
			callback( this );
		}
	}
})(jQuery);


function getIEVersion() {    
	 var rv = -1; // Return value assumes failure.    
	 if (navigator.appName == 'Microsoft Internet Explorer') {        
		  var ua = navigator.userAgent;        
		  var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");        
		  if (re.exec(ua) != null)            
			  rv = parseFloat(RegExp.$1);    
		 }    
	 return rv; 
}