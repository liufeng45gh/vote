$(window).ready(function() {

	// PORTFOLIO SLIDES //
	$('#slides').slidesjs({
        height: 400,
        play: {
              active: true,
              auto: true,
              interval: 4000,
              swap: true
            }
	});
});


//// HOMEPAGE SLIDER //
//var api;
//
//$(document).ready(function() {
//	api =  $('.fullwidthbanner').revolution(
//		{
//			delay:9000,
//			startheight:450,
//			startwidth:1120,
//
//			hideThumbs:200,
//
//			thumbWidth:100,							// Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
//			thumbHeight:50,
//			thumbAmount:5,
//
//			navigationType:"bullet",					//bullet, thumb, none, both		(No Thumbs In FullWidth Version !)
//			navigationArrows:"verticalcentered",		//nexttobullets, verticalcentered, none
//			navigationStyle:"round",				//round,square,navbar
//
//			touchenabled:"on",						// Enable Swipe Function : on/off
//			onHoverStop:"on",						// Stop Banner Timet at Hover on Slide on/off
//
//			navOffsetHorizontal:0,
//			navOffsetVertical:0,
//
//			stopAtSlide:-1,
//			stopAfterLoops:-1,
//
//			shadow:0,								//0 = no Shadow, 1,2,3 = 3 Different Art of Shadows  (No Shadow in Fullwidth Version !)
//			fullWidth:"on"							// Turns On or Off the Fullwidth Image Centering in FullWidth Modus
//		});
//
//});