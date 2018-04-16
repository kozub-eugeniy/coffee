//jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
	$('.navbar-nav li a').bind('click', function(event) {
	var $anchor = $(this);
	$('html, body').stop().animate({
	  scrollTop: $($anchor.attr('href')).offset().top
	}, 1500, 'easeInOutExpo');
	event.preventDefault();
	});
	$('.page-scroll a').bind('click', function(event) {
	var $anchor = $(this);
	$('html, body').stop().animate({
	  scrollTop: $($anchor.attr('href')).offset().top
	}, 1500, 'easeInOutExpo');
	event.preventDefault();
	});
});

//parallax
	if ($('#parallax1').length  || $('#parallax2').length)
	{
	$(window).stellar({
	  responsive:true,
	  scrollProperty: 'scroll',
	  parallaxElements: false,
	  horizontalScrolling: false,
	  horizontalOffset: 0,
	  verticalOffset: 0
	});
	}

})(jQuery);

