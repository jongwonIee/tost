jQuery(function ($) {

    /*=============================================================
     Authour URI: www.binarytheme.com
     License: Commons Attribution 3.0
 
     http://creativecommons.org/licenses/by/3.0/
 
     100% To use For Personal And Commercial Use.
     IN EXCHANGE JUST GIVE US CREDITS AND TELL YOUR FRIENDS ABOUT US
    
     ========================================================  */

    /*==========================================
    GENERAL CUSTOM SCRIPTS
    =====================================================*/

    //  HEADER SLIDE /CAROUSEL SECTION FUNCTION 
	$(function(){
		$('#slide-head.carousel').carousel({
			interval: 2000,
			pause: false
		});
	});

	

    // LINKS SCROLLING FUNCTION 
	$('.navbar-nav > li').click(function(event) {
		event.preventDefault();
		var target = $(this).find('>a').prop('hash');
		$('html, body').animate({
			scrollTop: $(target).offset().top
		}, 500);
	});

	
    // PRETTYPHOTO FUNCTION 
// 	$("a.preview").prettyPhoto({
// 		social_tools: false
// 	});

	

    /*==========================================
 SCROLL REVEL SCRIPTS
 =====================================================*/


	window.scrollReveal = new scrollReveal();


    /*==========================================
    WRITE  YOUR  SCRIPTS BELOW
    =====================================================*/

});




/*go top*/
(function() {

   			$('<i id="back-to-top"></i>').appendTo($('body'));

			$(window).scroll(function() {

				if($(this).scrollTop() != 0) {
					$('#back-to-top').fadeIn();	
				} else {
					$('#back-to-top').fadeOut();
				}

			});
			
			$('#back-to-top').click(function() {
				$('body,html').animate({scrollTop:0},600);
			});	

	})();
