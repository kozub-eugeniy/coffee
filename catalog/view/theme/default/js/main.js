(function( $ ){

	jQuery.fn.exists = function() {
	   return jQuery(this).length;
	}

  $(function() {

      if( $('.phonefield').exists()){
        $('.phonefield').mask('+38 (999) 999-99-99');
      }

      // if( $('.form_check').exists()){
			//
      //   $('.form_check').each(function(){
			//
      //     var form = $(this),
      //         btn = form.find('.btnsubmit');
			//
      //     form.find('.fields-composition').append('<span class="rfield_error">Заполните корректно все поля</span>').append('<span class="rfield_success">Сообщение успешно отправлено</span>');
      //     btn.addClass('disabled');
			//
      //     // Функция проверки полей формы
      //     function checkInput(){
			//
      //       form.find('.rfield').each(function(){
			//
      //         if($(this).hasClass('phonefield')){
      //           var pmc = $(this);
      //           if ( (pmc.val().indexOf("_") != -1) || pmc.val() == '' ) {
      //             pmc.addClass('empty_field');
      //           } else {
      //             pmc.removeClass('empty_field');
      //           }
      //         } else if($(this).hasClass('mailfield')) {
      //           var mailfield = $(this);
      //           var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
      //           if(pattern.test(mailfield.val())){
      //             mailfield.removeClass('empty_field');
      //           } else {
      //             mailfield.addClass('empty_field');
      //           }
      //         } else if($(this).is(':checkbox')) {
      //           var checkBox = $(this);
      //           if(checkBox.is(':checked')){
      //             checkBox.removeClass('empty_field')
      //           } else {
      //             checkBox.addClass('empty_field')
      //           }
      //         } else if($(this).val() != '') {
      //           $(this).removeClass('empty_field');
      //         } else {
      //           $(this).addClass('empty_field');
      //         }
			//
      //       });
      //     }
			//
      //     // Функция подсветки незаполненных полей
      //     function lightEmpty(){
      //       form.find('.empty_field').addClass('rf_error');
      //       form.find('.empty_field').parents('.fields-composition').find('.rfield_error').css({'visibility':'visible'});
      //       setTimeout(function(){
      //         form.find('.empty_field').removeClass('rf_error');
      //         form.find('.empty_field').parents('.fields-composition').find('.rfield_error').css({'visibility':'hidden'});
      //       },2000);
      //     }
			//
      //     //  Полсекундная проверка
      //     setInterval(function(){
      //       checkInput();
      //       var sizeEmpty = form.find('.empty_field').length;
      //       if(sizeEmpty > 0){
      //         if(btn.hasClass('disabled')){
      //           return false;
      //         } else {
      //           btn.addClass('disabled')
      //         }
      //       } else {
      //         btn.removeClass('disabled')
      //       }
      //     },500);
			//
      //     //  Клик по кнопке
      //     btn.click(function(e){
      //     	event.preventDefault();
      //       if($(this).hasClass('disabled')){
      //         lightEmpty();
      //         return false
      //       } else {
	    //         form.find('.fields-composition').find('.rfield_success').css({'visibility':'visible'});
			//
	    //         setTimeout(function () {
	    //         	form.submit();
			// 	}, 3000);
      //       }
      //     });
			//
      //   });
			//
      // }

  });

})( jQuery );

// карта

var map;
var pos = {lat: 49.9901805, lng: 36.2408907};
function initMap() {
	setTimeout(function() {

	map = new google.maps.Map(document.getElementById('map'), {
	    center: pos,
	    zoom: 16,
	    scrollwheel: false,
	    mapTypeControl: false,
	    rotateControl: false,
	    zoomControl: false,
	    scaleControl: false
	});

	var marker = new google.maps.Marker({
		position: pos,
		map: map,
		icon: {
		    url: "/catalog/view/theme/default/img/logo-map.png",
		    scaledSize: new google.maps.Size(288, 123)
		}
	});

	var contentString = '<div class="map-dialog__inner">'+
	  '<span class="map-dialog__address">61001, г. Харьков, ул. Юлия Чигирина, 3</span>'+
	  '<span class="map-dialog__subtitle">Мы работаем:</span>'+
	  '<span class="map-dialog__schedule">пн-пт: <strong>с 10 до 18</strong>&nbsp;&nbsp;&nbsp;&nbsp;сб-вс: <strong>с 10 до 15</strong></span>'+
	  '<span class="map-dialog__footnote">круглосуточно онлайн!</span>'+
	  '</div>';


	var infowindow = new google.maps.InfoWindow({
		content: contentString,
		position: {lat: 49.9885505, lng: 36.2482907}
	});

	marker.addListener('click', function() {
		infowindow.open(map);
		$('.gm-style-iw').parent('div').addClass('map-dialog');
	});

	infowindow.open(map);

	}, 500);

	setTimeout(function() {
		$('.gm-style-iw').parent('div').addClass('map-dialog');
	}, 1500);
}

if ($(window).width() < 992) {
	function initMap() {
		setTimeout(function() {

		map = new google.maps.Map(document.getElementById('map'), {
		    center: pos,
		    zoom: 16,
		    scrollwheel: false,
		    mapTypeControl: false,
		    rotateControl: false,
		    zoomControl: false,
		    scaleControl: false
		});

		var marker = new google.maps.Marker({
			position: pos,
			map: map,
			icon: {
			    url: "/catalog/view/theme/default/img/logo-map.png",
			    scaledSize: new google.maps.Size(288, 123)
			}
		});

		var contentString = '<div class="map-dialog__inner">'+
		  '<span class="map-dialog__address">61001, г. Харьков, ул. Юлия Чигирина, 3</span>'+
		  '<span class="map-dialog__subtitle">Мы работаем:</span>'+
		  '<span class="map-dialog__schedule">пн-пт: <strong>с 10 до 18</strong>&nbsp;&nbsp;&nbsp;&nbsp;сб-вс: <strong>с 10 до 15</strong></span>'+
		  '<span class="map-dialog__footnote">круглосуточно онлайн!</span>'+
		  '</div>';


		var infowindow = new google.maps.InfoWindow({
			content: contentString,
			position: {lat: 49.9875505, lng: 36.2445907}
		});

		marker.addListener('click', function() {
			infowindow.open(map);
			$('.gm-style-iw').parent('div').addClass('map-dialog');
		});

		infowindow.open(map);

		}, 500);

		setTimeout(function() {
			$('.gm-style-iw').parent('div').addClass('map-dialog');
		}, 1500);
	}
}

if ($(window).width() < 768) {
	function initMap() {
		setTimeout(function() {

		map = new google.maps.Map(document.getElementById('map'), {
		    center: pos = {lat: 49.9887805, lng: 36.2408907},
		    zoom: 16,
		    scrollwheel: false,
		    mapTypeControl: false,
		    rotateControl: false,
		    zoomControl: false,
		    scaleControl: false
		});

		var marker = new google.maps.Marker({
			position: pos,
			map: map,
			icon: {
			    url: "/catalog/view/theme/default/img/logo-map.png",
			    scaledSize: new google.maps.Size(288, 123)
			}
		});

		var contentString = '<div class="map-dialog__inner">'+
		  '<span class="map-dialog__address">61001, г. Харьков, ул. Юлия Чигирина, 3</span>'+
		  '<span class="map-dialog__subtitle">Мы работаем:</span>'+
		  '<span class="map-dialog__schedule">пн-пт: <strong>с 10 до 18</strong>&nbsp;&nbsp;&nbsp;&nbsp;сб-вс: <strong>с 10 до 15</strong></span>'+
		  '<span class="map-dialog__footnote">круглосуточно онлайн!</span>'+
		  '</div>';


		var infowindow = new google.maps.InfoWindow({
			content: contentString,
			position: {lat: 49.9910505, lng: 36.2405907}
		});

		marker.addListener('click', function() {
			infowindow.open(map);
			$('.gm-style-iw').parent('div').addClass('map-dialog');
		});

		infowindow.open(map);

		}, 500);

		setTimeout(function() {
			$('.gm-style-iw').parent('div').addClass('map-dialog');
		}, 1500);
	}
}

// отображение товаров список/сетка

(function($) {
    $(function() {
        $('ul.filter-view').on('click', 'li:not(.active)', function() {
            $(this)
                .addClass('active').siblings().removeClass('active')
                .closest('div.category-wrapper').find('div.category-view').removeClass('active').eq($(this).index()).addClass('active');
        });
    });
})(jQuery);

// табы оформление заказа

(function($) {
    $(function() {
        $('ul.checkout-list').on('click', 'li:not(.active):not(.checkout-auth-item)', function() {
            $(this)
                .addClass('active').siblings().removeClass('active')
                .closest('nav.checkout-tabs').find('div.checkout-input-wrapper__pass').removeClass('active').eq($(this).index()).addClass('active');
        });
    });
})(jQuery);

// табы личный кабинет

(function($) {
    $(function() {
        $('ul.user-room__list').on('click', 'li:not(.active)', function() {
            $(this)
                .addClass('active').siblings().removeClass('active')
                .closest('nav.user-room__tabs').find('div.user-room__content').removeClass('active').eq($(this).index()).addClass('active');
        });
    });
})(jQuery);

// табы логин/регистрация

(function($) {
    $(function() {
        $('ul.log-reg__list').on('click', 'li:not(.active)', function() {
            $(this)
                .addClass('active').siblings().removeClass('active')
                .closest('nav.log-reg__tabs').find('div.log-reg__content').removeClass('active').eq($(this).index()).addClass('active');
        });
    });
})(jQuery);

// табы на карточке товара

(function($) {
    $(function() {
        $('ul.products-tabs__list').on('click', 'li:not(.active)', function() {
            $(this)
                .addClass('active').siblings().removeClass('active')
                .closest('nav.products-tabs').find('div.products-tabs__content').removeClass('active').eq($(this).index()).addClass('active');
        });
    });
})(jQuery);

// табы меню разделы
if ($(window).width() < 992) {
	(function($) {
	    $(function() {
	        $('ul.categories-list').on('click', 'li:not(.active)', function() {
	            $(this)
	                .addClass('active').siblings().removeClass('active')
	                .closest('nav.menu-categories').find('div.menu-categories__content').removeClass('active').eq($(this).index()).addClass('active');
	        });
	    });
	})(jQuery);
}
else if ($(window).width() > 992){
	$('.menu-categories__content').removeClass('active');
}

$(window).on('resize', function(){
	if ($(window).width() < 992) {
		(function($) {
		    $(function() {
		        $('ul.categories-list').on('click', 'li:not(.active)', function() {
		            $(this)
		                .addClass('active').siblings().removeClass('active')
		                .closest('nav.menu-categories').find('div.menu-categories__content').removeClass('active').eq($(this).index()).addClass('active');
		        });
		    });
		})(jQuery);
	}
	else if ($(window).width() > 992){
		$('.menu-categories__content').removeClass('active');
	}
});

// facebook скролл

$(function() {

  $(".fb-widget").niceScroll({
    cursorwidth: "5px"
  });

});

// анимация

var wh = $(window).height();
var ih = $('.category-item').height();

$(function() {
	$('.item-specs').appear();

	$('.item-specs').on('appear', function(e, $affected) {
		$(this).addClass('active').attr('data-appear-top-offset', '-200').closest('.item').addClass('active');
	});

	$('.item-specs').on('disappear', function(e, $affected) {
		$(this).removeClass('active').removeAttr('data-appear-top-offset').closest('.item').removeClass('active');
	});

	if($(window).scrollTop() == 0) {
		$('.item-specs').removeClass('active').removeAttr('data-appear-top-offset');
	}
});

$(document).ready(function(){

	// обрезание тектса

	$('.blog-item__txt-preview').succinct({
		size: 400
	});

	// инициализация попапа

	$('.inline-popup').magnificPopup({
		type: 'inline'
	});

	// главный слайдер

	$(".main-slider").not('.slick-initialized').slick({
		speed: 500,
		fade: true,
		cssEase: 'linear',
		slidesToShow: 1,
		slidesToScroll: 1,
		dots: true,
		prevArrow: '<i class="arrow-left"></i>',
		nextArrow: '<i class="arrow-right"></i>'
	});

	// слайдер сравнение

	$(".compare-slider").not('.slick-initialized').slick({
		speed: 500,
		slidesToShow: 4,
		slidesToScroll: 1,
		infinite: false,
		dots: false,
		prevArrow: '<i class="arrow-left"></i>',
		nextArrow: '<i class="arrow-right"></i>',
	    responsive: [
	      {
	        breakpoint: 1280,
	        settings: {
	          slidesToShow: 3
	        }
	      },
	      {
	        breakpoint: 991,
	        settings: {
	          slidesToShow: 2
	        }
	      },
	      {
	        breakpoint: 761,
	        settings: {
	          slidesToShow: 1
	        }
	      }
	    ]
	});

	$('.compare-item-remove').on('click', function() {
		console.log($(this).closest('.slick-slide').index(this));
	  	$('.compare-slider').slick('slickRemove', $(this).closest('.slick-slide').index(this) + 1);
		if($(".compare-item").length > 0){
		    $('.compare-params').show();
		}
		else{
		    $('.compare-params').hide();
		}
	});


	// слайдер хиты продаж

	$(".hits-slider").not('.slick-initialized').slick({
		speed: 500,
		slidesToShow: 4,
		slidesToScroll: 1,
		infinite: false,
		dots: false,
		prevArrow: '<i class="arrow-left"></i>',
		nextArrow: '<i class="arrow-right"></i>',
	    responsive: [
	      {
	        breakpoint: 1280,
	        settings: {
	          slidesToShow: 3
	        }
	      },
	      {
	        breakpoint: 991,
	        settings: {
	          slidesToShow: 2
	        }
	      },
	      {
	        breakpoint: 761,
	        settings: {
	          slidesToShow: 1
	        }
	      }
	    ]
	});

	// слайдер карточка товара

	$(".product-slider").not('.slick-initialized').slick({
		speed: 500,
		fade: true,
		cssEase: 'linear',
		slidesToShow: 1,
		slidesToScroll: 1,
		asNavFor: '.product-nav'
	});

	$(".product-nav").not('.slick-initialized').slick({
		speed: 500,
		slidesToShow: 2,
		slidesToScroll: 1,
		vertical: true,
		verticalSwiping: true,
		focusOnSelect: true,
		asNavFor: '.product-slider',
		prevArrow: '<i class="arrow-left"></i>',
		nextArrow: '<i class="arrow-right"></i>',
	    responsive: [
	      {
	        breakpoint: 1280,
	        settings: {
	          vertical: false,
			  verticalSwiping: false
	        }
	      },
	      {
	        breakpoint: 991,
	        settings: {
	          vertical: true,
			  verticalSwiping: true
	        }
	      },
	      {
	        breakpoint: 699,
	        settings: {
	          vertical: false,
			  verticalSwiping: false
	        }
	      }
	    ]
	});

	// счетчик сравнение
	var c_count = parseInt($('.compare-counter').text());
	$('.compare-label').click(function() {
		if (c_count >= 0) {
	    	if($(this).hasClass('active')){
				c_count = c_count - 1;
				$('.compare-counter').text(c_count);
				$(this).removeClass('active');
				$('.compare-counter').removeClass('active');
				$('.compare-btn').removeClass('active');
	    	}
	    	else{
	    		$(this).addClass('active');
				c_count = c_count + 1;
				$('.compare-counter').text(c_count);
				$('.compare-counter').addClass('active');
				$('.compare-btn').addClass('active');
	    	}
		}
		else {
			$('.compare-counter').removeClass('active');
			$('.compare-btn').removeClass('active');
		}
	});

	// счетчик закладки
	var b_count = parseInt($('.bookmark-counter').text());
	$('.bookmark-label').click(function() {
		if (b_count >= 0) {
	    	if($(this).hasClass('active')){
				b_count = b_count - 1;
				$('.bookmark-counter').text(b_count);
				$(this).removeClass('active');
				$('.bookmark-counter').removeClass('active');
				$('.bookmark-btn').removeClass('active');
	    	}
	    	else{
	    		$(this).addClass('active');
				b_count = b_count + 1;
				$('.bookmark-counter').text(b_count);
				$('.bookmark-counter').addClass('active');
				$('.bookmark-btn').addClass('active');
	    	}
		}
		else {
			$('.bookmark-counter').removeClass('active');
			$('.bookmark-btn').removeClass('active');
		}
	});

	// // кнопка купить
	//
	// var cart_count = parseInt($('.cart-counter').text());
	// $('.item-buy-btn').click(function() {
	// 	if (cart_count >= 0) {
	//     	if($(this).hasClass('disabled')){
	// 			$('.alert-message').text('Товар уже в корзине').show();
	// 			setTimeout(function(){
	//               $('.alert-message').fadeOut('slow');
	//             },3000);
	// 			return false;
	//     	}
	//     	else{
	//     		$(this).addClass('disabled');
	// 			cart_count = cart_count + 1;
	// 			$('.cart-counter').text(cart_count);
	// 			$('.cart-counter').addClass('active');
	// 			$('.bookmark-btn').addClass('active');
	// 			$('.alert-message').text('Товар добавлен в корзину').show();
	// 			setTimeout(function(){
	//               $('.alert-message').fadeOut('slow');
	//             },3000);
	//     	}
	// 	}
	// });

	// сайдбар

	$('.filter-sidebar__title').click(function() {
		$('.filter-sidebar__wrapper').toggleClass('active');
    	return false;
	});

	$('.filter-sidebar__hide').click(function() {
		$('.filter-sidebar__wrapper').removeClass('active');
    	return false;
	});

	$(document).click(function() {
		if($('.filter-sidebar__wrapper').hasClass('active')){
	    	$('.filter-sidebar__wrapper').removeClass('active');
	 	}
	});

	$(document).on('click', '.filter-sidebar__wrapper', function(e) {
		e.stopPropagation();
	});

	// меню валюта

	$('.currency-btn').click(function() {
		$(this).toggleClass('active');
    	$('.currency-menu').slideToggle();
    	return false;
	});

	$('.currency-menu').on('click', 'li:not(.active)', function() {
		$(this).addClass('active').siblings().removeClass('active');
		if($(this).hasClass('active') && $(this).hasClass('cur_g')){
			$('.currency-icon').addClass('uah');
			$('.currency-icon').removeClass('dollar');
			$('.currency-icon').removeClass('euro');
		}
		else if($(this).hasClass('active') && $(this).hasClass('cur_d')){
			$('.currency-icon').addClass('dollar');
			$('.currency-icon').removeClass('euro');
			$('.currency-icon').removeClass('uah');
		}
		else if($(this).hasClass('active') && $(this).hasClass('cur_e')){
			$('.currency-icon').addClass('euro');
			$('.currency-icon').removeClass('dollar');
			$('.currency-icon').removeClass('uah');
		}
	});

	$(document).click(function() {
		if($('.currency-menu').is(':visible') && $('.currency-btn').hasClass('active')){
	    	$('.currency-menu').slideUp();
	    	$('.currency-btn').removeClass('active');
	 	}
	});

	$(document).on('click', '.currency-menu__title', function() {
		return false;
	});

	// меню телефон

	$('.phone-block').click(function() {
		$(this).toggleClass('active');
    	$('.phone-menu').slideToggle();
    	return false;
	});

	$(document).click(function() {
		if($('.phone-menu').is(':visible') && $('.phone-block').hasClass('active')){
	    	$('.phone-menu').slideUp();
	    	$('.phone-block').removeClass('active');
	 	}
	});

	var clipboard = new Clipboard('.phone-copy');

	// верхнее меню

	$('.top-menu__list').on('click', 'li:not(.active):not(.link):not(.top-submenu__item)', function() {
		$(this).addClass('active').siblings().removeClass('active');
		if($(this).hasClass('active')){
			$(this).find('ul.top-submenu__list').addClass('active');
			$(this).siblings().find('ul.top-submenu__list').removeClass('active');
			return false;
		}
		else{
			$(this).find('ul.top-submenu__list').removeClass('active');
			return false;
		}
	});

	$(document).on('click', function() {
		if($('.top-submenu__list').hasClass('active') && $('.top-menu__item').hasClass('active')){
	    	$('.top-submenu__list').removeClass('active');
	    	$('.top-menu__item').removeClass('active');
	 	}
	});

	$(document).on('click', '.top-submenu__title', function() {
		return false;
	});

	// меню все категории

	$('.categories-dropdown').click(function() {
		$(this).toggleClass('active');
    	$('.categories-dropdown__list').toggleClass('active');
    	return false;
	});

	$(document).on('click', function() {
		if($('.categories-dropdown__list').hasClass('active') && $('.categories-dropdown').hasClass('active')){
	    	$('.categories-dropdown__list').removeClass('active');
	    	$('.categories-dropdown').removeClass('active');
	 	}
	});

	$(document).on('click', '.categories-dropdown__title', function() {
		return false;
	});

	// показать скрыть пароль

	$('.show-pass-btn').click(function() {
        if ($(this).parent().find('.passfield').attr('type') == 'text'){
            if ($(this).parent().find('.passfield').attr('placeholder') == 'Пароль'){
            	$(this).addClass('hide-pass');
            	$(this).parent().find('.passfield').attr('type','password').attr('placeholder','••••••').addClass('active');
            }
            else if ($(this).parent().find('.passfield').attr('placeholder') == 'Повторите пароль'){
            	$(this).addClass('hide-pass');
            	$(this).parent().find('.passfield').attr('type','password').addClass('active');
            }
        }
        else if ($(this).parent().find('.passfield').attr('type') == 'password'){
        	if ($(this).parent().find('.passfield').attr('placeholder') == '••••••'){
	        	$(this).removeClass('hide-pass');
	            $(this).parent().find('.passfield').attr('type','text').attr('placeholder','Пароль').removeClass('active');
            }
            else{
	        	$(this).removeClass('hide-pass');
	            $(this).parent().find('.passfield').attr('type','text').removeClass('active');
            }
        }
    });


  	// изменение личных данных

	$('.edit-data').click(function() {
		if ($('.user-room-input').is(':disabled')) {
			$('.user-room-input').removeAttr('disabled');
			$('.user-room-btn').html('<i></i>Сохранить изменения').addClass('active');
			$('.user-room-edit').html('<i></i>Сохранить').addClass('active');
			$('.user-room-form').removeClass('disabled');
		}
		else {
			$('.user-room-input').attr('disabled', 'disabled');
			$('.user-room-btn').html('<i></i>Изменить пароль').removeClass('active');
			$('.user-room-edit').html('<i></i>Изменить').removeClass('active');
			$('.user-room-form').addClass('disabled');
		}
	});


  	// изменение адреса

    //$('.user-room__address-form-input').autosizeInput({ "space": 0 });
	$('.edit-address').click(function() {
		if ($('.user-room__address-form-input').is(':disabled') && $('.fancy-select').hasClass('disabled')) {
			$('.user-room__address-form-input').removeAttr('disabled').css('width', '100%');
			$('.user-room__address-form-btn').html('<i></i>Сохранить изменения').addClass('active');
			$('.user-room-edit__address').html('<i></i>Сохранить').addClass('active');
			$('.fancy-select').removeClass('disabled');
			$('.country-list').trigger('enable');
		$('.user-room__address-form').removeClass('disabled');
		}
		else {
			$('.user-room__address-form-input').attr('disabled', 'disabled');
			$('.user-room__address-form-btn').removeClass('active');
			$('.user-room-edit__address').html('<i></i>Изменить').removeClass('active');
			$('.fancy-select').addClass('disabled');
			$('.country-list').trigger('disable');
			$('.user-room__address-form').addClass('disabled');
		}
	});


    $('.address-choose').click(function() {
    	if ($(this).is(':checked')) {
    		$(this).closest('.fields-composition').addClass('main').siblings().removeClass('main');
    	}
    });

    // удалить из закладок

	if ($('.bookmark-item').length != 0) {
		$('.bookmarks-list').show();
	}
	else {
		$('.bookmarks-list').hide();
		$('.empty-bookmarks').css('display', 'flex');
	}

    $('.bookmark-item-remove').click(function() {
		$(this).closest('li').slideUp('slow').promise().done(function() {
			$(this).remove();
			if ($('.bookmark-item').length != 0) {
				$('.bookmarks-list').show();
			}
			else {
				$('.bookmarks-list').hide();
				$('.empty-bookmarks').css('display', 'flex');
			}
		});
    });

    // удаление из корзины (попап)

	if ($('.cart-popup__item').length != 0) {
		$('.cart-popup__body').show();
		$('.cart-popup__footer').show();
		$('.fast-order').show();
		$('.cart-popup__main-close').removeClass('empty');
	}
	else {
		$('.bookmarks-list').hide();
		$('.cart-popup__main-close').addClass('empty');
		$('.empty-cart-popup').css('display', 'flex');
	}

    $('.cart-item-remove').click(function() {
		$(this).closest('li').slideUp('slow').promise().done(function() {
			$(this).remove();
			if ($('.cart-popup__item').length != 0) {
				$('.cart-popup__body').show();
				$('.cart-popup__footer').show();
				$('.fast-order').show();
				$('.cart-popup__main-close').removeClass('empty');
			}
			else {
				$('.cart-popup__body').hide();
				$('.cart-popup__footer').hide();
				$('.fast-order').hide();
				$('.cart-popup__main-close').addClass('empty');
				$('.empty-cart-popup').css('display', 'flex');
			}
		});
    });

	// оформеление заказа переключатель авторизация/регистрация

	$('.checkout-auth-item').click(function() {
		$(this).hide();
		$('.checkout-reg').hide();
		$('.checkout-auth').show();
		$('.checkout-list-item').removeClass('active');
		$('.checkout-list').addClass('disabled');
		$('.checkout-input-wrapper__pass').addClass('active');
	});

	$('.checkout-auth__back').click(function() {
		$('.checkout-auth-item').show();
		$('.checkout-reg').show();
		$('.checkout-auth').hide();
		$('.checkout-list-item.reg').addClass('active');
		$('.checkout-list').removeClass('disabled');
		$('.checkout-input-wrapper__pass').addClass('active');
	});

	// показать детали заказа

	$('.orders-item__details-btn').click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active').text('Показать детали');
			$(this).closest('.orders-item__footer').find('.orders-hidden-info').slideUp('300');
		}
		else{
			$(this).addClass('active').text('Скрыть детали');
			$(this).closest('.orders-item__footer').find('.orders-hidden-info').slideDown('300');
		}
	});

	// показать больше заказов

	$('.fast-order__btn-show').click(function() {
		$(this).toggleClass('active');
		$('.fast-order__form').slideToggle('300');
	});

	// показать больше заказов

	$('.more-orders__btn').click(function() {
		$('.orders-list__more').slideDown('300');
	});


	// показать весь текст главная

	$('.section-about__btn-more').click(function() {
		$('.hidden-text-about').slideDown('300').promise().done(function() {
			$('.section-about__btn-more').fadeOut('50');
			setTimeout(function() {
				$(".fb-widget").getNiceScroll().resize();
			}, 100);
		});
	});

	// показать весь текст разделы

	$('.read-more').click(function() {
		$('.text-decription').addClass('active');
		$('.read-more').fadeOut('50');
	});

	// показать весь текст карточка товара

	$('.product-info__read-more').click(function() {
		$('.product-info__text').addClass('active');
		$('.product-info__read-more').fadeOut('50');
	});

	// показать еще новости

	$('.show-more-news__btn').click(function() {
		$('.show-more-news__btn').fadeOut('50');
		$('.hidden-news').slideDown('300').promise().done(function() {
			setTimeout(function() {
				$(".fb-widget").getNiceScroll().resize();
			}, 100);
		});
	});

	// показать еще новости

	var id_height = $('.item-description').height();

	$('.show-compare__description').click(function() {
		$(this).closest('.c-item').find('.item-description__wrapper').slideDown('300').promise().done(function() {
			$(this).closest('.c-item').find('.show-compare__description').fadeOut('50');
			$(this).css({'overflov': 'visible', 'height': id_height}).addClass('active');
		});
	});

	// показать больше товаров

	$('.more-items__btn').click(function() {
		$('.more-items').slideDown('300');
	});

	// показать еще отзывы

	$('.show-more-comments').click(function() {
		$('.hidden-comments').slideDown('300').promise().done(function() {
			$('.show-more-comments').fadeOut('50');
		});
	});

	// выпадающий список на карточке товара
    $('.product-select-list').fancySelect();

	// выпадающий список в разделе
    $('.filter-select-list').fancySelect();

	// выпадающий список в разделе
    $('.country-list1').fancySelect();

	// выпадающий список в разделе
    $('.country-list2').fancySelect();

    // выпадающий список перед поиском
    $('.search-dropdown').selectize({
	    options: [
	        {class: 'seed', value: "Автоцветущие феминизированные семена", name: "Автоцветущие феминизированные семена" },
	        {class: 'seed', value: "Фотопериодичные феминизированные семена", name: "Фотопериодичные феминизированные семена" },
	        {class: 'grow', value: "Гроубоксы", name: "Гроубоксы" },
	        {class: 'grow', value: "Удобрения", name: "Удобрения" },
	        {class: 'grow', value: "Освещение", name: "Освещение" },
	        {class: 'hemp', value: "Одежда", name: "Одежда" },
	        {class: 'hemp', value: "Постельное белье", name: "Постельное белье" },
	        {class: 'head', value: "Бонги, трубки, все для курения", name: "Бонги, трубки, все для курения" },
	        {class: 'head', value: "Гриндеры", name: "Гриндеры" },
	        {class: 'head', value: "Прочее", name: "Прочее" }
	    ],
	    optgroups: [
	        {value: 'seed', label: 'Семена конопли'},
	        {value: 'grow', label: 'Все для выращивания'},
	        {value: 'hemp', label: 'Изделия из канабиса'},
	        {value: 'head', label: 'Принадлежности'}
	    ],
	    optgroupField: 'class',
	    labelField: 'name',
	    searchField: ['name'],
		render: {
			option: function(data, escape) {
				return '<div class="option">' + '<span class="option-before"></span>' + '<span>' + escape(data.name) + '</span>' + '</div>';
			},
		}
	});

	setTimeout(function() {
		$('.selectize-dropdown.single.search-dropdown').append('<span class="close-dropdown"></span>');
	}, 100);

    $(document).on('click', '.close-dropdown', function(e) {
    	e.preventDefault();
    	$('.selectize-dropdown').hide();
		$('.selectize-input').removeClass('focus input-active dropdown-active');
		$('div.selectize-input > input').blur();
    });

	// счетчик кол-во на карточке товара
	$('.minus').click(function () {
        var $input = $(this).parent().find('input');
        var count = parseInt($input.val()) - 1;
        count = count < 1 ? 1 : count;
        $input.val(count);
        $input.change();
        return false;
    });
    $('.plus').click(function () {
        var $input = $(this).parent().find('input');
        $input.val(parseInt($input.val()) + 1);
        $input.change();
        return false;
    });

    /* слайдер цен */

	jQuery(".price-range").slider({
	    min: 0,
	    max: 2500,
	    values: [250,1500],
	    range: true,
	    slide: function(event, ui) {
	        for (var i = 0; i < ui.values.length; ++i) {
	            $("input.sliderValue[data-index=" + i + "]").val(ui.values[i]);
	        }
	    }
	});

	$('.price-range .ui-slider-handle:first').addClass('first');

	$("input.sliderValue").change(function() {
	    var $this = $(this);
	    $(".price-range").slider("values", $this.data("index"), $this.val());
	});

	// скролл к якорю

	var w = $(window).width();

	$('a[href^="#"]').bind('click.smoothscroll',function (e) {
        e.preventDefault();
        if (w < 992) {
        	menu.slideUp();
        }

        var target = this.hash,
        $target = $(target);

        $('html, body').stop().animate({
            'scrollTop': $target.offset().top
        }, 1400, 'swing', function () {
            window.location.hash = target;
        });
    });

	/* меню на мобильных устройствах*/
	var touch = $('.burger-btn');
	var menu = $('.mobile-menu');
	var toggles = document.querySelectorAll('.burger-btn');
	var body = $('body');

	for (var i = toggles.length - 1; i >= 0; i--) {
		var toggle = toggles[i];
		toggleHandler(toggle);
	}

	function toggleHandler(toggle) {
		toggle.addEventListener( 'click', function(e) {
			e.preventDefault();
			(this.classList.contains('active') === true) ? this.classList.remove('active') : this.classList.add('active');
			body.toggleClass('fixed-body');
		});
	}

	$(touch).on('click', function(e) {
		e.preventDefault();
		menu.slideToggle();
	});

	$('.mobile-menu__category-item__title').click(function() {
		$(this).toggleClass('active').next('.mobile-submenu').slideToggle().toggleClass('active').parent().toggleClass('active');
	});
});
