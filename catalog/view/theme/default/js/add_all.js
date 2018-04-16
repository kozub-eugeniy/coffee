$(document).ready(function() {
  //currency
  $('.currency-menu .currency-menu__item').on('click', function(e) {
    //console.log($(this).attr('data-attr'));

    $('.currency-menu input[name=\'code\']').attr('value', $(this).attr('data-attr'));
    $('#currency').submit();
  });
  // cart
  $('.cart-btn').on('click',function(){
    cart.show();
  });


});
// end ready


var cart = {
  'add': function(product_id, quantity) {
    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
      type: 'post',
      dataType: 'json',
      success: function(json) {
        if(json.success){
          message.show(json.success);
        }
        if(json.quantity){
          $('.cart-counter').html(json.quantity);
        }
        console.log(json);
      }
    });
  },
  'remove': function(key){
    $.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			success: function(json) {
        if(json.quantity){
          $('.cart-counter').html(json.quantity);
        }
        cart.show();
			}
		});
  },
  'update': function(key, quantity){
    console.log('update');
    $.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			success: function(json) {
        cart.show();
			}
		});
  },
  'show': function(){
    $.ajax({
			url: 'index.php?route=checkout/cart/info',
			type: 'post',
			dataType: 'json',
			success: function(json) {
        console.log(json);
        if(json.html){
          popup.show(json.html);
        }
        if(json.quantity){
          $('.cart-counter').html(json.quantity);
        }
			}
    });
  }
};

var message = {
  show: function(text){
    $('.alert-message').html(text).show();
    setTimeout(function(){
      $('.alert-message').fadeOut('slow');
    },3000);
  }
};

var popup = {
  show: function(html){
    $('#cart-popup').html(html);
    //$('#hiddenPopup').append(html);
    $.magnificPopup.open({items: {src: '#cart-popup'},type: 'inline'});
  }
};
