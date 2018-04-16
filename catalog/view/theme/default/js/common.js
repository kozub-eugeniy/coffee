var showAlternativeAlert = function(message, timeToClose) {
	var wrap = $('<div>').attr('class', 'alertifyAlternative j-alertAlternative').css('opacity', '0');
	var text = $('<p>').attr('class', 'alertAlternative__text');
	$('body').append(wrap.append(text.html(message)).fadeIn(200));
	$('.j-alertAlternative').animate({
		opacity: 1
	}, 200);

	if(timeToClose != undefined) {
		
		setTimeout(function(){
		$('.j-alertAlternative').first().fadeOut(200, function(){
				$(this).remove();
			});
		}, timeToClose)
	}
}

function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}
function callQuickView(qurl) { 
     $('#mgkquickview').show();
     $('#magikloading').show();
    $.get(qurl, function(data) {
      $.fancybox(data);
      $('#magikloading').hide();
      $('#mgkquickview').hide();
    });
}
$(document).ready(function() {
	// Adding the clear Fix
	cols1 = $('#column-right, #column-left').length;
	
	if (cols1 == 2) {
		$('#content .product-layout:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
	} else if (cols1 == 1) {
		$('#content .product-layout:nth-child(3n+3)').after('<div class="clearfix visible-lg"></div>');
	} else {
		$('#content .product-layout:nth-child(4n+4)').after('<div class="clearfix"></div>');
	}
	
	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();
		
		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});
		
	// Currency
	$('#currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('#currency input[name=\'code\']').attr('value', $(this).attr('name'));

		$('#currency').submit();
	});

	// Language
	$('#language a').on('click', function(e) {
		e.preventDefault();

		$('#language input[name=\'code\']').attr('value', $(this).attr('href'));

		$('#language').submit();
	});

	/* Search */
	$('input[name=\'search\']').parent().find('button').on('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('input[name=\'search\']').parent().find('button').trigger('click');
		}
	});

	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// Product List
	$('#list-view').click(function() {
		$('.view-mode #list-view').attr('class','btn btn-default active');
		$('#content .product-layout > .clearfix').remove();

		//$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');
		$('#content .product-layout').attr('class', 'product-layout products-list');
		$('#content .product-layout .item').attr('class', 'item');
		$('#content .product-layout .item .item-inner').hide();
		$('#content .product-layout .item .product-image').show();
		$('#content .product-layout .item .product-shop').show();

		
		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		$('.view-mode #grid-view').attr('class','btn btn-default active');
		$('#content .product-layout > .clearfix').remove();
		$('#content .product-layout .item .p_list').hide();
		$('#content .product-layout .item .product-shop').hide();
		$('#content .product-layout .item .item-inner').show();
		// What a shame bootstrap does not take into account dynamically loaded columns
		cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			//$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
			$('#content .product-layout').attr('class', 'product-layout products-grid');
			$('#content .product-layout .item').attr('class', 'item col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-layout').attr('class', 'product-layout products-grid');
			$('#content .product-layout .item').attr('class', 'item col-lg-4 col-md-4 col-sm-6 col-xs-12');
		} else {
//			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
            $('#content .product-layout').attr('class', 'product-layout products-grid');
			$('#content .product-layout .item').attr('class', 'item col-lg-3 col-md-3 col-sm-6 col-xs-12');
		}

		 localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	} else {
		$('#grid-view').trigger('click');
	}

	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});
});

// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},			
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['success']) {
					showAlternativeAlert(json['success'], 4000);
					// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
						 var myarr = [];
    					 var myarr = json['total'].split(" ");
						$('#cart .header > a .before-cart-total').html('<span id="cart-total">' + myarr[1] + '</span>');
					}, 100);
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},			
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					 var myarr = [];
    				 var myarr = json['total'].split(" ");
    
					$('#cart .header > a .before-cart-total').html('<span id="cart-total">' + /*myarr['0']*/ + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},			
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					 var myarr = [];
    				 var myarr = json['total'].split(" ");
    	           
					$('#cart .header > a .before-cart-total').html('<span id="cart-total">' + myarr[1] + '</span>');
				}, 100);
					
				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {

					 var myarr = [];
    				 var myarr = json['total'].split(" ");

					 $('#cart .header > a .before-cart-total').html('<span id="cart-total">' + /*myarr['0']*/ + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					showAlternativeAlert("Ваш товар добавлен в список желаний!", 4000);
				}

				if (json['info']) {
					showAlternativeAlert(json['info'], 4000);
				}

				var myarr1 = [];
				var myarr1 = json['total'].split(" ");
				var wishlist_cnt = myarr1[1].replace(/["'()]/g,"");

				$('#wishlist-total').html(wishlist_cnt);
			}
		});
	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				var errorMessage = 'Вы не можете добавить в список сравнения более 4 товаров!';
				$('.alert').remove();
				var myarr2 = [];
				var myarr2 = json['total'].split(" ");
				compare_cnt = myarr2['2'].replace(/["'()]/g,"");
				$('#compare-total').html(compare_cnt);

				if(Number(compare_cnt) >= 4) {
					$('body').append($('.j-compareSorry').html());
					$('.j-compareSorryPopup').animate({
						opacity: 1
					}, 200);
					$('.j-compareSorryClose').on('click', function () {
						$('.j-compareSorryPopup').fadeOut(200, function(){
							$(this).remove();
						})
					})
				} else {
					if (json['success']) {
						showAlternativeAlert(json['success'], 4000);
					}
				}
			}
		});
	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});

// Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();
	
			$.extend(this, option);
	
			$(this).attr('autocomplete', 'off');
			
			// Focus
			$(this).on('focus', function() {
				this.request();
			});
			
			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);				
			});
			
			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}				
			});
			
			// Click
			this.click = function(event) {
				event.preventDefault();
	
				value = $(event.target).parent().attr('data-value');
	
				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}
			
			// Show
			this.show = function() {
				var pos = $(this).position();
	
				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});
	
				$(this).siblings('ul.dropdown-menu').show();
			}
			
			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}		
			
			// Request
			this.request = function() {
				clearTimeout(this.timer);
		
				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}
			
			// Response
			this.response = function(json) {
				html = '';
	
				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}
	
					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}
	
					// Get all the ones with a categories
					var category = new Array();
	
					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}
	
							category[json[i]['category']]['item'].push(json[i]);
						}
					}
	
					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';
	
						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}
	
				if (html) {
					this.show();
				} else {
					this.hide();
				}
	
				$(this).siblings('ul.dropdown-menu').html(html);
			}
			
			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));	
			
		});
	}
})(window.jQuery);

$(function(){
	$('#nav > li').hover(function(){
		$(this).find('a').addClass('round');
		$(this).find('a').addClass('smallsize');
	}, function(){
		$(this).find('a').removeClass('round smallsize');
	})

	$('#nav').hover(function(){
		$('#categories_text').fadeIn(300);
	}, function(){
		$('#categories_text').fadeOut(300);
	})

	var text = '';

	$('#nav li').mouseenter(function(){
		text = $(this).find('.category_name').html();
		$('#categories_text').html(text);
	})

	$('#mobile-menu').append('<i class="closethis fa fa-times"></i>');
	$('.mm-toggle').click(function(){
		$('#mobile-menu').fadeIn(400);	
	})
	$('.closethis').click(function(){
		$('#mobile-menu').fadeOut(400);
	})
	
})


$(function() {
     jQuery("#filt_slider").slider({
    min: 0,
    max: 2000,
    values: [0,2000],
    range: true,
    stop: function(event, ui) {
        jQuery("input#minCost").val(jQuery("#filt_slider").slider("values",0));
        jQuery("input#maxCost").val(jQuery("#filt_slider").slider("values",1));
    },
    slide: function(event, ui){
        jQuery("input#minCost").val(jQuery("#filt_slider").slider("values",0));
        jQuery("input#maxCost").val(jQuery("#filt_slider").slider("values",1));
    }
});
    jQuery("input#minCost").change(function(){
    var value1=jQuery("input#minCost").val();
    var value2=jQuery("input#maxCost").val();

    if(parseInt(value1) > parseInt(value2)){
        value1 = value2;
        jQuery("input#minCost").val(value1);
    }
    jQuery("#filt_slider").slider("values",0,value1);    
});

    
jQuery("input#maxCost").change(function(){
    var value1=jQuery("input#minCost").val();
    var value2=jQuery("input#maxCost").val();
    
    if (value2 > 2000) { value2 = 2000; jQuery("input#maxCost").val(2000)}

    if(parseInt(value1) > parseInt(value2)){
        value2 = value1;
        jQuery("input#maxCost").val(value2);
    }
    jQuery("#filt_slider").slider("values",1,value2);
});


    $('.hidd_next').click(function(){
        if($('.hidd_next').hasClass('active')){
            $(this).removeClass('active');
            $('.hidd_next + div').slideUp("slow");
            $('.hidd_next > img').css('transform', 'rotate(360deg)');
            $('.hidd_next > span').html('Больше опций');
            localStorage.setItem('options', 'closed');
        } else {
            $(this).addClass('active');
        $('.hidd_next + div').slideDown("slow");
        $('.hidd_next > img').css('transform', 'rotate(180deg)');
         $('.hidd_next > span').html('Меньше опций');
         localStorage.setItem('options', 'opened');
    }
  })    
 
var localOpt = localStorage.getItem('options');
if(localOpt == 'opened' || localOpt == null){
	 $('.hidd_next + div').slideDown("slow");
        $('.hidd_next > img').css('transform', 'rotate(180deg)');
         $('.hidd_next > span').html('Меньше опций');
     } else{
     	 $(this).removeClass('active');
            $('.hidd_next + div').slideUp("slow");
            $('.hidd_next > img').css('transform', 'rotate(360deg)');
            $('.hidd_next > span').html('Больше опций');
     }
   
     $('.j-category .manufactureList .block-title').click(function(){
        if($('.j-category .manufactureList .block-title').hasClass('active')){
            $(this).removeClass('active');
            $('.j-category .manufactureList .box-category').slideUp("slow");
            localStorage.setItem('manufactureList', 'closed');
        } else {
            $(this).addClass('active');
        $('.j-category .manufactureList .box-category').slideDown("slow");
         localStorage.setItem('manufactureList', 'opened');
    }
  }) 

var localManuf = localStorage.getItem('manufactureList');
if(localManuf == 'opened' || localManuf == null){
	 	$('.j-category .manufactureList .box-category').slideUp("slow");
     } else{
     	$(this).removeClass('active');
        $('.j-category .manufactureList .box-category').slideUp("slow");
     }

    $('.item').hover(function(){
    	// if($(this).find('.hello').hasClass('active')){
    	// 	$(this).fadeOut();
    	// } 
    	$('.hello').toggleClass('active');
    }, function(){
    	$('.hello').toggleClass('active');
    })
})

$(function(){

$('.fancybox').attr('rel' ,'fancy');
$("a[rel=fancy]").fancybox({
		showNavArrows: true,
       'transitionIn' : 'none',       
       'transitionOut' : 'none',
      'titlePosition' : 'over'
   });

})

!function(a){function f(a,b){if(!(a.originalEvent.touches.length>1)){a.preventDefault();var c=a.originalEvent.changedTouches[0],d=document.createEvent("MouseEvents");d.initMouseEvent(b,!0,!0,window,1,c.screenX,c.screenY,c.clientX,c.clientY,!1,!1,!1,!1,0,null),a.target.dispatchEvent(d)}}if(a.support.touch="ontouchend"in document,a.support.touch){var e,b=a.ui.mouse.prototype,c=b._mouseInit,d=b._mouseDestroy;b._touchStart=function(a){var b=this;!e&&b._mouseCapture(a.originalEvent.changedTouches[0])&&(e=!0,b._touchMoved=!1,f(a,"mouseover"),f(a,"mousemove"),f(a,"mousedown"))},b._touchMove=function(a){e&&(this._touchMoved=!0,f(a,"mousemove"))},b._touchEnd=function(a){e&&(f(a,"mouseup"),f(a,"mouseout"),this._touchMoved||f(a,"click"),e=!1)},b._mouseInit=function(){var b=this;b.element.bind({touchstart:a.proxy(b,"_touchStart"),touchmove:a.proxy(b,"_touchMove"),touchend:a.proxy(b,"_touchEnd")}),c.call(b)},b._mouseDestroy=function(){var b=this;b.element.unbind({touchstart:a.proxy(b,"_touchStart"),touchmove:a.proxy(b,"_touchMove"),touchend:a.proxy(b,"_touchEnd")}),d.call(b)}}}(jQuery);

// callbackhunter

/*!
	Autosize 3.0.14
	license: MIT
	http://www.jacklmoore.com/autosize
*/
!function(e,t){if("function"==typeof define&&define.amd)define(["exports","module"],t);else if("undefined"!=typeof exports&&"undefined"!=typeof module)t(exports,module);else{var n={exports:{}};t(n.exports,n),e.autosize=n.exports}}(this,function(e,t){"use strict";function n(e){function t(){var t=window.getComputedStyle(e,null);c=t.overflowY,"vertical"===t.resize?e.style.resize="none":"both"===t.resize&&(e.style.resize="horizontal"),f="content-box"===t.boxSizing?-(parseFloat(t.paddingTop)+parseFloat(t.paddingBottom)):parseFloat(t.borderTopWidth)+parseFloat(t.borderBottomWidth),isNaN(f)&&(f=0),i()}function n(t){var n=e.style.width;e.style.width="0px",e.offsetWidth,e.style.width=n,c=t,u&&(e.style.overflowY=t),o()}function o(){var t=window.pageYOffset,n=document.body.scrollTop,o=e.style.height;e.style.height="auto";var i=e.scrollHeight+f;return 0===e.scrollHeight?void(e.style.height=o):(e.style.height=i+"px",v=e.clientWidth,document.documentElement.scrollTop=t,void(document.body.scrollTop=n))}function i(){var t=e.style.height;o();var i=window.getComputedStyle(e,null);if(i.height!==e.style.height?"visible"!==c&&n("visible"):"hidden"!==c&&n("hidden"),t!==e.style.height){var r=document.createEvent("Event");r.initEvent("autosize:resized",!0,!1),e.dispatchEvent(r)}}var d=void 0===arguments[1]?{}:arguments[1],s=d.setOverflowX,l=void 0===s?!0:s,a=d.setOverflowY,u=void 0===a?!0:a;if(e&&e.nodeName&&"TEXTAREA"===e.nodeName&&!r.has(e)){var f=null,c=null,v=e.clientWidth,p=function(){e.clientWidth!==v&&i()},h=function(t){window.removeEventListener("resize",p,!1),e.removeEventListener("input",i,!1),e.removeEventListener("keyup",i,!1),e.removeEventListener("autosize:destroy",h,!1),e.removeEventListener("autosize:update",i,!1),r["delete"](e),Object.keys(t).forEach(function(n){e.style[n]=t[n]})}.bind(e,{height:e.style.height,resize:e.style.resize,overflowY:e.style.overflowY,overflowX:e.style.overflowX,wordWrap:e.style.wordWrap});e.addEventListener("autosize:destroy",h,!1),"onpropertychange"in e&&"oninput"in e&&e.addEventListener("keyup",i,!1),window.addEventListener("resize",p,!1),e.addEventListener("input",i,!1),e.addEventListener("autosize:update",i,!1),r.add(e),l&&(e.style.overflowX="hidden",e.style.wordWrap="break-word"),t()}}function o(e){if(e&&e.nodeName&&"TEXTAREA"===e.nodeName){var t=document.createEvent("Event");t.initEvent("autosize:destroy",!0,!1),e.dispatchEvent(t)}}function i(e){if(e&&e.nodeName&&"TEXTAREA"===e.nodeName){var t=document.createEvent("Event");t.initEvent("autosize:update",!0,!1),e.dispatchEvent(t)}}var r="function"==typeof Set?new Set:function(){var e=[];return{has:function(t){return Boolean(e.indexOf(t)>-1)},add:function(t){e.push(t)},"delete":function(t){e.splice(e.indexOf(t),1)}}}(),d=null;"undefined"==typeof window||"function"!=typeof window.getComputedStyle?(d=function(e){return e},d.destroy=function(e){return e},d.update=function(e){return e}):(d=function(e,t){return e&&Array.prototype.forEach.call(e.length?e:[e],function(e){return n(e,t)}),e},d.destroy=function(e){return e&&Array.prototype.forEach.call(e.length?e:[e],o),e},d.update=function(e){return e&&Array.prototype.forEach.call(e.length?e:[e],i),e}),t.exports=d});

$(function(){
	autosize($('#tabs_list textarea'));
})


// end autosize


var animInterv = undefined;

var changeItem = function(){
	var iArr = ['<i class="fa fa-phone"></i>', '<i class="fa fa-info"></i>', '<i class="fa fa-envelope"></i>', '<i class="fa fa-comments"></i>', '<span>Кнопка связи</span>'],
		iLen = iArr.length,
		i = 0, j = 0,
		callButt = $('.pozvonim-button-phone');

animInterv = setInterval(function(){
	$('.moove').html(iArr[i]);

	if (i == iLen - 2){
		i = 0;
		j = 0;
	} else if (i < iLen - 1){
		j = i;
		i = iLen - 1;
	} else {
		i = j;
		i++;
	}

	if($('#pozvonim-button .pozvonim-button-phone').hasClass('turnTo')){
		$('#pozvonim-button .pozvonim-button-phone').removeClass('turnTo');
	} else{
		$('#pozvonim-button .pozvonim-button-phone').addClass('turnTo');
	}
}, 5000);

};

// jichat and links
var pbutt = $('#pozvonim-button'), pmob = $('#pozvonim_mobile'), tabslist = $('#tabs_list');

$(function(){

	changeItem();

	pbutt = $('#pozvonim-button');
	pmob = $('#pozvonim_mobile');
	tabslist = $('#tabs_list');

 

	pbutt.find('.pozvonim-button-phone').on('click', function(event){
		if($(event.target).closest('pozvonim-button-phone')){
			if (!pbutt.hasClass('showItems')) {
				callme.notAnimCall();
			} else {
				callme.animCall();
			}
			event.stopPropagation();
			event.stopImmediatePropagation();
		}
		
	})
})



var callme = {
	animCall: function(t){
		pbutt.find('.moove').addClass('anim');
		pbutt.find('.pozvonim-button-border-inner').show('slow');
		pbutt.find('.pozvonim-button-border-outer').show('slow');
		pbutt.removeClass('showItems');
		changeItem();
		this.removeCallItems();
	},
	notAnimCall: function(t){
		pbutt.find('.moove').removeClass('anim');
		pbutt.find('.pozvonim-button-border-inner').hide('slow');
		pbutt.find('.pozvonim-button-border-outer').hide('slow');
		pbutt.find('#call_items').show();
		clearInterval(animInterv);
		$('.moove').html('<span>Кнопка связи</span>');
		pbutt.addClass('showItems');
		this.showCallItems();
	},
	showCallItems: function(){
		$('.call_items').addClass('animate');
		$('.call_item1').animate({
			bottom: "0px"
		}, 200);

		$('.call_item2').animate({
			bottom: "0px"
		}, 350);

		$('.call_item3').animate({
			bottom: "0px"
		}, 500);

		$('.call_item4').animate({
			bottom: "0px"
		}, 650);
	},
	removeCallItems: function(){
		$('.call_items').removeClass('animate');
		$('.call_item1').animate({
			bottom: "-240px"
		}, 200);

		$('.call_item2').animate({
			bottom: "-180px"
		}, 200);

		$('.call_item3').animate({
			bottom: "-130px"
		}, 200);

		$('.call_item4').animate({
			bottom: "-60px"
		}, 200);
		setTimeout(function(){
			pbutt.find('#call_items').hide();
		}, 500)
		
	},

	showMenu: function(){
		pmob.find('.call_items_mobile').slideDown(200);
	},

	hideMenu: function(){
		pmob.find('.call_items_mobile').slideUp(200);
	},

	showTabs: function(){
		tabslist.animate({
				right: "0px"
			}, 700);
	},

	hideTabs: function(){
		tabslist.animate({
				right: "-1000px"
			}, 700);
	},

	changeTabs: function(t){
		$('[aria-controls="' + $(t).data('tabs') +'"]').click();
	}
}


$(document).click(function(event){
    if($(event.target).hasClass('jivoch')){
    	jivo_api.open();
       $('#jivo-iframe-container').addClass('showshow');
      
       callme.hideMenu(); callme.hideTabs();
     } else{
       $('#jivo-iframe-container').removeClass('showshow');       
     }

if($(event.target).closest('#call_items').length || $(event.target).closest('#pozvonim_mobile').length) return;
clearInterval(animInterv);
callme.animCall();
event.stopPropagation();

if($(event.target).closest(tabslist).length || $(event.target).closest('#alertify').length || $(event.target).closest('.btn-no-goods')) return;
callme.hideTabs();
event.stopPropagation();

})

$(document).ready(function(){
	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) || $(window).width() < 767) {
		$('#pozvonim-button').hide();
		$('#pozvonim_mobile').show();
	} else{
		$('#pozvonim-button').show();
		$('#pozvonim_mobile').hide();
	}

	$('.close_window').click(callme.hideMenu);

	var callItems = $('#call_items').children(),
		callMobileItems = $('.call_items_mobile').find('span');


	callItems.click(function(event){
		if($(this).hasClass('jivoch') == false) {
			callme.showTabs(); callme.changeTabs(event.target);
		}
	})

	callMobileItems.click(function(event){
		if($(this).hasClass('jivoch') == false) {
			callme.showTabs(); callme.changeTabs(event.target);
		}
	})
})

$(window).resize(function(){
	if($(window).width() < 768){
		$('#pozvonim-button').hide();
		$('#pozvonim_mobile').show();
	} else {
		$('#pozvonim-button').show();
		$('#pozvonim_mobile').hide();		
	}
})

// zadolbalo
$(function(){

	$('.item-inner').on('click', '.btn-no-goods', function(event){
	callme.showTabs();
	$('[aria-controls="tabs3"]').click();
	event.stopPropagation();
})

	$('button.continue').addClass('continue2');

	$('.product-view').tooltip();
	$('.add-to-links').tooltip();

var showfilter='<div class="show_filt_result">'+
'<p>Выбрано: <span class="show_filter_count"></span></p>'+
'<input type="button" class="filter_but" value="показать">';
	$('.filter dd li').click(function(event){
		$('.show_filt_result').remove();
		$(this).append(showfilter);
$('.show_filt_result').attr('onclick', "Filter('',$('#input-limit input:radio:checked').data('sort'),$('#input-sort input:checked').data('sort'),0)");
		if($('.filter input[type="checkbox"]:checked').length == 0){
			$('.show_filt_result').remove();
		}
	})


var $setRating = $('.j-ratingItem');
// setRating.find('input').removeClass('active');

function setRatingOnGood(itemClass, $this) {
	$setRating.find('input').removeClass(itemClass);
	$this.find('input').addClass(itemClass);
	$this.prevAll('.j-ratingItem').find('input').addClass(itemClass);
}

$setRating.click(function(event){
	event.stopPropagation();
	setRatingOnGood('active', $(this));
})

$('.j-ratingItem').hover(function(event) {
	event.stopPropagation();
	setRatingOnGood('hover', $(this));
}, function() {
	$setRating.find('input').removeClass('hover');
})


});