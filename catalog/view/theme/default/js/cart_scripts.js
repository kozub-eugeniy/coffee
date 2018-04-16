/**
 * Created by afer on 13.07.2015.
 */

function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    return pattern.test(emailAddress);
}

// #64B34F
$(document).on('mouseover',".show_delivery",function(){
    $(this).css("color","#64B34F");

});
$(document).on('mouseout',".show_delivery",function(){
    $(this).css("color","#000");

});

function ShowDelivery(th){

    $(".delivery_method").slideToggle('slow');

}


function isTelephone(telephone){
var pattern=/[0-9]+/i;
  return  pattern.test(telephone);

}



function GetCart(){
    $.ajax({
        url: 'index.php?route=checkout/cart/GetCart',
        dataType: 'html',
        type:'get',
        success: function(html) {
            $(".row.forms .span4").html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            //  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });



}









function ShowPolicy(){

    alertify.alert(" Политика бла бла бла ");
    return false;

}



function simpleValidation() {

    var one = document.getElementsByTagName('input');
    for (var i = 0; i < one.length; i++) {
        if (one[i].classList.contains('import')) {
            if (one[i].value.length == 0) {
                one[i].classList.add('error');
                return false;
            } else {
                one[i].classList.remove('error');
            }
        }
    }
}




function addComment(){


    var path=  window.location.search;
    var a= path.split('&');
    var article_id = a[1].split('='); // article_id
    $.ajax({
        url: 'index.php?route=blog/article/addComment',
        type: 'get',
        dataType: 'json',
        data: 'title=' + encodeURIComponent($('input[name=\'title\']').val()) + '&text=' +encodeURIComponent($('textarea[name=\'text\']').val()) + '&article_id='+ article_id[1]  + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
        beforeSend: function() {
            // $('#button-review').button('loading');
        },
        complete: function() {

            $('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
            $('input[name=\'captcha\']').val('');
        },
        success: function(json) {
            if (json['error']) {
                $('#mess_review').empty();

                alertify.alert(json['error']);
                setTimeout(function(){
                    $("#alertify").fadeOut(500).remove();
                    $("#alertify-logs").remove();
                    $("#alertify-cover").remove();
                },6000);
            }

            if (json['success']) {
                $('#mess_review').empty();
                alertify.alert(json['success']);
                setTimeout(function(){
                    $("#alertify").fadeOut(500).remove();
                    $("#alertify-logs").remove();
                    $("#alertify-cover").remove();
                },6000);

                $('input[name=\'title\']').val('');
                $('input[name=\'text\']').val('');
                $('input[name=\'captcha\']').val('');
                $('textarea[name=\'text\']').val('')
            }
        }
    });



}







function CreateZakaz(){

    simpleValidation();

    // пробуем создать заказ
    var firstname = $(" #accordion2 input[name='firstname']").val();
    var second_name = $("input[name='second_name'] ").val();
    var address1 = $("input[name='address1'] ").val();
    var email = $(".all_content  input[name='email'] ").val();
    var telefone = $("input[name='telefone'] ").val();
    if(isNaN(telefone)){
        alertify.alert("Укажите корректный номер телефона");
        return false;
    }



    var country_id =$("select[name='country'] ").val();
    var country_name =$("select.def_select :selected").html();
    var city = $("#cities").val().trim();
    var payment = $("input[name='pay_method']:checked");
    var payment_val = $("input[name='pay_method']:checked").val();
    var payment_code =$("input[name='pay_method']:checked").attr('code');
    var delivery= $("input[name='delivery_method']:radio:checked");

    if(delivery.length ==0){
        alertify.alert("Check the delivery method");
        return false;
    }
    if(payment.length==0){
        alertify.alert("Check the payment method");
        return false;
    }

    if($("input[name='pay_method']:checked").length > 0){
        var payment_price = parseFloat($("input[name='pay_method']:radio:checked").attr('title').substring(1,9));
    } else {
        payment_price=0;
    }


    // цена с доставкой
    var price_with_delivery =  parseFloat($("#sub_total_price").html());
    //способ доставки



    if($("input[name='delivery_method']:radio:checked").attr('title').length > 1){
        var delivery_price = parseFloat($("input[name='delivery_method']:radio:checked").attr('title').substring(1,9));
    } else {
        delivery_price=0;
    }

    var delivery_val=$("input[name='delivery_method']:radio:checked").val();

    // валидапция мыла



    if(!isValidEmailAddress(email)){
        $(".all_content  input[name='email'] ").addClass('error');
        alertify.alert('Введите корректный email');
        return false;
    }




    var guest_data = {
        firstname:firstname,
        lastname:second_name,
        email:email,
        telephone:telefone,
        address_1:address1,
        city:city,
        final_price:price_with_delivery,
        delivery:delivery_val,
        delivery_price:delivery_price,
        payment:payment_val,
        payment_price:payment_price,
        payment_code:payment_code,
        country_id:country_id,
        country_name:country_name


    };

    $.ajax({
        url: 'index.php?route=checkout/zakaz/CreateFullZakaz',
        type: 'post',
        data:guest_data,
        dataType: 'json',
        beforeSend:function(){
            $(".btn.btn_green").addClass('loader').html('');
        },
        success: function(data) {
            console.log(data);
            if(data.success){


                $("#content").slideUp(500);
                 $("#content").empty();
                 $('html, body').animate({ scrollTop: 0 }, 'slow');
                $("#content").html('<h1>Ваш заказ успешно сформирован! Номер заказа #'+data.success+' </h1>'+
              '<p>Ваш заказ успешно создан!</p>'+
                   '<p>Если у Вас возникли вопросы, пожалуйста <a href="/contact-us" class="l_green">свяжитесь с нами</a>.</p>'+
                   '<p>Спасибо за покупки в нашем интернет-магазине!</p>'+
                  '<div class="buttons">' +
        '<div class=""><a href="/"><button class="button continue">Продолжить</button></a></div>'+
      '</div>').slideDown(600);


            }
             if(data.error_storage){
            getMap();
               // alertify.alert(data.error_storage);

            }
             if(data.error){
                alertify.alert(data.error);
            }
            if(data.error ==1){
                alertify.alert('что то пошло  не так');
            }

        },
        error: function(xhr, ajaxOptions, thrownError) {
            console.log(xhr + ' error');
            console.log(thrownError);
        }
    });

    return false;

}





function CreateQuikZakaz(){
    simpleValidation();
    // пробуем создать заказ
   var  firstname = $("input[name='firstname'] ").val();
    var  email = $("input[name='email'] ").val();
    var  telephone = $("input[name='telefone'] ").val();
    // валидапция мыла

//валидация телефона


    if(isNaN(telephone)){
        $("input[name='telefone'] ").addClass('error');
        alertify.alert("Enter correct number");
        return false;

    }

    if(!isValidEmailAddress(email)){
        $("input[name='email'] ").addClass('error');
        alertify.alert('Введите корректный email');
        return false;
    }


    var guest_data = {
        firstname:firstname,
        email:email,
        telephone:telephone
    };

    $.ajax({
        url: 'index.php?route=checkout/zakaz/CreateQuikZakaz',
        type: 'post',
        data:guest_data,
        dataType: 'json',
        beforeSend:function(){
            $(".btn.continue").addClass('loader').html('');
        },
        success: function(data) {

            if(data.success ==1){

                $(".all_content").slideUp(200);


                $(".all_content").html('<h1>Ваш заказ успешно сформирован!</h1>'+
                '<p>Ваш заказ успешно создан!</p>'+
                '<p>Если у Вас возникли вопросы, пожалуйста <a href="/contact-us" class="l_green">свяжитесь с нами</a>.</p>'+
                '<p>Спасибо за покупки в нашем интернет-магазине!</p>'+
                '<div class="buttons">' +
        '<div class=""><a href="/"><button class="button continue">Продолжить</button></a></div>'+
      '</div>').slideDown('slow');


            }
            if(data.error ==1){
                alertify.alert('то то пошло  не так');
            }

        },
        error: function(xhr, ajaxOptions, thrownError) {
            console.log('error');
        }
    });

    return false;

}


function Filter(page,limit,sort,quantity){

// tgk
    tgk=[];
    for(t=0; t<$(".tgk_filter :checkbox:checked  ").length; t++){
        tgk.push( $(".tgk_filter :checkbox:checked  ").eq(t).val());


    }
    if(page){
        var page=parseInt(page);
    } else {
        page='';
    }

   // category
category_id=[];

for(c=0; c<$(".filter_seeds_category :checkbox:checked ").length; c++){
    category_id.push( $(".filter_seeds_category :checkbox:checked  ").eq(c).val());
}

    var min_cost = parseInt($("#minCost").val());
    var max_cost =parseInt($("#maxCost").val());



    //собираем ид типа растений

    seeds_type =[];
    for(r=0; r<$(".seeds_type :checkbox:checked").length; r++){

        seeds_type.push($(".seeds_type :checkbox:checked").eq(r).val());
    }
    //урожай
    hurvest=[];
    for(h=0; h<$(".hurvest :checkbox:checked").length; h++){

        hurvest.push($(".hurvest :checkbox:checked").eq(h).val());
    }
    //  высота растения

    height=[];
    for(l=0; l<$(".seeds_height :checkbox:checked").length; l++){

        height.push($(".seeds_height :checkbox:checked").eq(l).val());
    }

    var isList = $(".products-list").length;



    //limit
    var limit = parseInt(limit);

    //sort

var sort = sort;

    var product_name = $("input[name=\'product_name\']").val();
    var type;
    if(quantity==1){
         type ='json';
    } else {
        type ='html';
    }

data_filter ={

    tgk:tgk,
    category_id:category_id,
    min_cost:min_cost,
    max_cost:max_cost,
    seeds_type:seeds_type,
    hurvest:hurvest,
    height:height,
    product_name:product_name,
    isList:isList,
    limit:limit,
    page:page,
    sort:sort,
    quantity:quantity
};

    $.ajax({
        url: 'index.php?route=product/product/GreenFilter',
        dataType: type,
        type:'get',
        data:data_filter,
        success: function(data) {
                //$(".product-layout").empty();
            if(quantity==1){
                $(".show_filter_count").html(data.count);
            }
            else if(quantity==0 || !quantity ){
                var $topPaging = $('.j-topPagination');

                $(".bottom_pagination").remove();
               $topPaging.empty();

                $(".product-layout").html(data);
                var $bottonPagingClone = $('#list-pagination').clone();
                $topPaging.html($bottonPagingClone);

                window.scrollTo( 0, 200 );
                $('.show_filt_result').remove();
            }


        },
        error: function(xhr, ajaxOptions, thrownError) {
            //  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });









} // end funct







function PaginAjax(th){
  var link=  th.attr('href');
    $.ajax({
        url: link,
        dataType: 'Html',
        success: function(html) {
            $(".categories").empty();
            $(".categories").html(html);

            $(".pagination li").removeClass('active');
            th.parent().addClass('active');
           // th.parentElement.className ="active"; // так почему то не пашет хотя должно
    return false;
        },
        error: function(xhr, ajaxOptions, thrownError) {
            //  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

    return false;
}

function ChangeCountry(th){

    var country_val= th.val();
    $.ajax({
        url: 'index.php?route=checkout/checkout/country&country_id=' + country_val,
        dataType: 'json',
        success: function(json) {
            cities =[];
            cities_id=[];
            $("#city_user").empty();
            if(Number.isInteger(json.zone.length)  ==false || json.zone.length ==0 ||  json.zone.length ==false){
                $("#city_user").hide();
            } else {
                $("#city_user").show();
            }

            for(i=0; i<json.zone.length; i++){
                var str  ='<option value="' +json.zone[i].zone_id +'">' +json.zone[i].name +'</option>';
                $("#city_user").append(str);
                cities.push(json.zone[i].name);
                cities_id.push(json.zone[i].zone_id);



            }


            $(function(){
            var id =   $("#ui-id-5 li").attr('id');



            });

            $(function() {

                $( "#cities" ).autocomplete({
                    source: cities




                });
            });

        },
        error: function(xhr, ajaxOptions, thrownError) {
            //  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });


}


function AddZone(th){

var value=    th.attr('title');
    var name = th.html();
    $("#cities").val(name);
    $("input[name='zone_id']").val(value);
    $("#zone_list").empty();
}



function AddToCart(id,quantity,product_option_id,product_option_value_id){

    option={
        product_option_id: product_option_value_id
    };

    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: {
            product_id: id ,
            quantity: quantity,
            option: option
            },
            dataType: 'json',
            beforeSend: function() {
                // $('#button-cart').button('loading');
                },
            complete: function() {
                // $('#button-cart').button('reset');
                },
            success: function(json) {
                if(json['success']){
                    alertify.alert("Item successfully added to the cart");
                } else {
                    alertify.alert("error");
                }

                }
            });

}





function ChangeCity(like,country_id){

    $.ajax({
        url: 'index.php?route=checkout/checkout/GetZone&country_id=' + country_id+ '&like='+like,
        dataType: 'json',
        success: function(json) {


            $("#zone_list").empty();

            for(z=0; z<json.length; z++){

                var str = '<li onclick="AddZone($(this))" title="'  +json[z].zone_id+'">'+  json[z].name  + '</li>';
                $("#zone_list").append(str);


            }






        },
        error: function(xhr, ajaxOptions, thrownError) {
            //  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });



}








$(document).ready(function() {


    $("#ui-id-5 li").on( 'click', function(){
        var ident=    $(this).attr('id');


    });










    $("#choose_c-menu li.ui-menu-item").click(function () {

        var country_user=  $("#choose_c ").val();

    });

    // проверка на гостя
    $("#user_type").click(function() {
        if($("input[name='account']:checked").val() == "register"){
            location.href = "/index.php?route=account/register";
            return false;
        }
        else if($("input[name='account']:checked").val() == "guest"){
            $(".ui-accordion-content").slideUp('slow');
            $("#ui-id-4").slideDown('slow');
            return false;
        }
        else if($("input[name='account']:checked").val() == "guest_quik"){

            $("input[name='second_name']").hide();
            $("input[name='address1']").hide();
            $("select[name='country']").hide();
            $(".cities, .payment_method").hide();
            $(".delivery_method,.payment_method").hide();
            $(".subTotal").hide();
            $(".span6.main_info").append('<a  class="btn continue" onclick="CreateQuikZakaz()">Continue</a>');
            $(".create_zakaz").hide();


            $(".ui-accordion-content").slideUp('slow');
            $("#ui-id-4").slideDown('slow');
            return false;
        }

    });





});



function ShowWishes(){
    var html ='<div id="form_call_me" class="form-horizontal wish " style="display: block;"> <span class="call_me_close"><i class="fa fa-times"></i></span>   <h1 class="redder"><span class="call_me"><span class="dotted_wrap"><i class="fa fa-envelope-o"></i></span></span>Мы прислушиваемся к пожеланиям клиентов</h1> <div class="form-group required">     <label class="col-sm-3 control-label" for="input-firstname">меня зовут</label>     <div class="col-sm-9">       <input type="text" name="firstname" class=" form-control" placeholder="Имя">     </div>     </div>    <div class="form-group required">   <label class="col-sm-3 control-label" for="input-firstname">E-mail</label>              <div class="col-sm-9">                 <input type="text" name="email" class="form-control" placeholder="E-mail">      </div>           </div>   <div class="form-group required">              <label class="col-sm-3 control-label" for="input-firstname">Пожелание</label>           <div class="col-sm-9">     <textarea rows="5" cols="40" type="text" name="text" class="form-control" placeholder="Пожелание"></textarea></div></div>    <div class="sentCall"><a onclick="SentWish()" class="btn btn-arrow">Отправить</a></div>   </div>';
    $.fancybox.open(html);
}
function SentWish(){


    var firstname,email,text;
      firstname = $(".wish input[name=\'firstname\'] ").val();
      email = $(".wish input[name='email'] ").val();
      text = $(".wish textarea[name='text'] ").val();
    if(firstname.length < 4){
        $(".wish textarea[name='text'] ").parent().addClass('has-error');
        alertify.alert('Введите имя');
        return false;
    }

    if(!isValidEmailAddress(email)){
        $(".wish input[name='email'] ").parent().addClass('has-error');
        alertify.alert('Введите корректный email');
        return false;
    }
    if(text.length < 10){
        $(".wish textarea[name='text'] ").parent().addClass('has-error');
        alertify.alert('Введите ваши пожелания(От 10 символов) ');
        return false;
    }
    $(".wish div ").removeClass('has-error');


    $.ajax({
        url: 'index.php?route=product/product/addWish',
        data: { name:firstname, text:text, email:email },
        type:'post',
        dataType: 'json',
        success: function(json) {

            if(json.success){
                alertify.alert(json.success);
                $(".wish input[name='firstname'] ").val('');
                $(".wish input[name='email'] ").val('');
                $(".wish textarea[name='text'] ").val('');
                $.fancybox.close();

                return false;
            }
            else if(json.error){
                alertify.alert(json.error);
                return false;
            }

        },
        error: function(xhr, ajaxOptions, thrownError) {
        }
    });



}





function ShowFormCall (){
    var html =$('#form_call_me');
    $.fancybox.open(html);
}

function SentCall(firstname,telephone){



if(firstname.length > 20){
    alertify.alert("Длинна имени не должна превышать 20 символов");
    return false;
}

if(!isTelephone(telephone) || telephone.length > 20){

    alertify.alert("Телефон должен содержать только цифры. Длинна не должна превышать 20 символов");
    return false;
}


 $.ajax({
        url: 'index.php?route=product/product/addCall',
        data: { telephone:telephone,name:firstname },
        type:'post',
        dataType: 'json',
        success: function(json) {
            if(json.success==1){
                alertify.alert('Мы вам перезвоним');
                $(".tabs_wrap input[name='telephone'] ").val('');
                $(".tabs_wrap input[name='firstname'] ").val('');
                $.fancybox.close();

                return false;
            }
            else if(json.error){
                alertify.alert(json.error);
                return false;
            }

        },
        error: function(xhr, ajaxOptions, thrownError) {
        }
    });



}


function SentMail(){

    object ={};
    object.email =  $("#tabs3 input[name='email']").val();
    object.text  =   $("#tabs3 textarea[name='textarea']").val();
    object.mail = 1;
    if(!isValidEmailAddress(object.email)){
        alertify.alert("Введите корректный Email - адрес");
        return false;
    }
    if(object.text.length <10){
        alertify.alert("Длинна текста должна быть не менее 10 символов ");
        return false;
    }


     $.ajax({
        url: 'index.php?route=product/product/addCall',
        data: object,
        type:'post',
        dataType: 'json',
        success: function(json) {
            if(json.error){
                alertify.alert(json.error);
                return false;
            }
           else if(json.success==1){
                alertify.alert('Спасибо за письмо. Мы очень скоро с вами свяжимся');
               $("#tabs3 input[name='email']").val('');
                $("#tabs3 textarea[name='textarea']").val('');
                return false;
            }


        },
        error: function(xhr, ajaxOptions, thrownError) {
        }
    });

}

function addNewletterUser(email){

    if(isValidEmailAddress(email) && email.length < 30){
 $.ajax({
        url: 'index.php?route=account/newsletter/addNewsletterUser',
        data: { email:email},
        type:'post',
        dataType: 'json',
        success: function(json) {
            if(json.success){
                alertify.alert(json.success);
               $(".newsletter input[name='email']").val('');
                return false;
            }
            else if(json.error){
                alertify.alert(json.error);
                return false;
            }

        },
        error: function(xhr, ajaxOptions, thrownError) {
        }
    });


    } else {
         alertify.alert(" E-mail адрес должен быть корректным и не более 30 символов ");
         return false;
    }



}



function SetStorage(id_storage){


console.log(id_storage);
        obj ={
            storage_id:id_storage
        };
    $.ajax({
        url: 'index.php?route=product/storage/setStorage',
        dataType: 'json',
        data:obj,
        type:'post',
        success: function(json) {

            if(json.success){
                $.fancybox.close("#choose_region");
                location.href=location.href;

            }



        },
        error: function(xhr, ajaxOptions, thrownError) {
            //  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });





}








function CheckAvalability(product_id){

      obj ={
            product_id:product_id
        };
    $.ajax({
        url: 'index.php?route=product/storage/getMapProductInStorage',
        dataType: 'html',
        data:obj,
        type:'post',
        success: function(html) {
            console.log(html);

            if(html){
                $.fancybox.open(html);
            }






        },
        error: function(xhr, ajaxOptions, thrownError) {
            //  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });


}

function getMap(not_first){


         $.ajax({
        url: 'index.php?route=product/storage/getMapStorages',
        dataType: 'html',
        type:'post',
        success: function(html) {
            $.fancybox.open(' ');
            if(not_first){
                   $(".fancybox-wrap").addClass('fancy_map_holder');
                           }

        $(".fancybox-inner").html(html);



        },
        error: function(xhr, ajaxOptions, thrownError) {
            //  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

}

product = {
    'get_similar':function(product_id){
        $.ajax({
            url: 'index.php?route=product/product/getSameProduct',
            dataType: 'html',
            data:{ product_id: parseInt(product_id) },
            type:'post',
            success: function(html) {
                $.fancybox.open(html);


            },
            error: function(xhr, ajaxOptions, thrownError) {

            }
        });



    },
    'show_notify':function(){
        $(".seoboostnotif_div").css('display','inline');

        $.fancybox.open($(".seoboostnotif_div"),{
            'width': '20%'
        });
        $(".fancybox-opened").css('width','20%!important');
    }

}



var validate ={
    'onpaste_clear' : function(e,length){
        var obj = {};
        setTimeout(function clear(){
            obj.value = e.target.value.split("");
            obj.value.splice(length-1, e.target.value.length+1 - length);
            e.target.value = "";
            for(var i = 0;i<obj.value.length;i++)
                e.target.value+=obj.value[i];
        },1);
    },
    'validate_quantity':function(selector){

        // validate telephone
        selector.onkeypress = function(e) {
            e = e || event;
            if (e.ctrlKey || e.altKey || e.metaKey) return;

            var chr = validate.get_char(e);
            var length = selector.value.length;
            if (chr == null) return;

            if (chr < '0' || chr > '9' || length >=3) {
                return false;
            }
        }


    },
    'validate_number':function(selector,length){
        selector.onpaste = function(e){return validate.onpaste_clear(e,length);}
        selector.onkeypress = function(e) {
            e = e || event;
            if (e.ctrlKey || e.altKey || e.metaKey) return;

            var chr = validate.get_char(e);
            if (chr == null) return;
            if(length){
                if (chr < '0' || chr > '9' || selector.value.length >=length) {
                    return false;
                }
            }
            else{
                if (chr < '0' || chr > '9' ) {
                    return false;
                }
            }

        }

    },
    'get_char':function(event){
        if (event.which == null) {
            if (event.keyCode < 32) return null;
            return String.fromCharCode(event.keyCode) // IE
        }

        if (event.which != 0 && event.charCode != 0) {
            if (event.which < 32) return null;
            return String.fromCharCode(event.which) // остальные
        }
        return null; // специальная клавиша
    },
    'validate_name' : function(input,length) {

        input.onpaste = function(e){validate.onpaste_clear(e,length)}
        input.onkeypress = function(e){
            e = e || event;
            if (e.ctrlKey || e.altKey || e.metaKey) return;
            var rep = /[^0-9a-zA-Zа-яА-Я\s]/g;
            var value = input.value;
            var isValid = false;
            if (event.which != 0 && event.charCode != 0) {
                var char = '';
                char = String.fromCharCode(event.which);
                if (rep.test(String.fromCharCode(event.which))) { isValid=false; return isValid; };
                if(value[value.length-1]==" " && char==" "){ isValid=false; return isValid; }
                if(length){if(value.length >= length) { isValid = false; return isValid }}
                return String.fromCharCode(event.which);
            }
        }
    },
    'validate_input_cost':function(selector){

        selector.onkeypress = function(e) {
            e = e || event;
            if (e.ctrlKey || e.altKey || e.metaKey) return;

            var chr = validate.get_char(e);
            var length = selector.value.length;
            if (chr == null) return;

            if (chr < '0' || chr > '9' || length >=7) {
                return false;
            }
        }

    },
    'validate_input_length':function(selector,max){
        selector.onpaste = function(e){validate.onpaste_clear(e,max)}
        selector.onkeypress = function(e) {
            var length_selector = selector.value.length;
            if (length_selector >= max) {
                return false;
            }
        }

    },
    'add_error': function(selector){
        selector.classList.add('validate-error');
    },
    'remove_error':function(selector){
        selector.classList.remove('validate-error');
    },
    'clean_all_error_site_review':function(){
        this.remove_error(document.querySelector('.g-recaptcha'));
        this.remove_error(document.querySelector('.all_content #textarea'));
        this.remove_error(document.getElementById('email'));
        this.remove_error(document.getElementById('name'));
    }
};
