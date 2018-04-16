<?php if($home == $og_url){ ?>
    <footer class="main-footer">
        <div class="container-sm">
            <div class="partners-bg">
                <span class="main-footer__partners-title__mob">наши партнеры</span>
                <div class="main-footer__partners-wrapper__mob">
                    <a class="main-footer__partners-item" href="">
                        <img src="catalog/view/theme/default/img/partner2.png" alt="">
                    </a>
                    <a class="main-footer__partners-item" href="">
                        <img src="catalog/view/theme/default/img/partner1.png" alt="">
                    </a>
                </div>
            </div>
            <div class="main-footer__wrapper">
                <div class="footer-action">
                    <strong>Поздравляем!</strong>
                    <br><br>
                    Ты упорный, добрался до низа <br>
                    страницы и заслужил скидку <br>
                    20% на упаковку семян <br>
                    от Green House
                    <br><br>
                    <a href="">Auto Diesel Power + подарок!</a>
                    <br>
                    Приходи к нам на Чигирина 3 <br>
                    и забирай свои плюшки ;)
                </div>
                <div class="footer-action-pic__wrapper">
                    <img class="footer-action-pic" src="catalog/view/theme/default/img/footer-action-pic.jpg" alt="">
                </div>
                <span class="main-footer__partners-title">наши партнеры</span>
                <div class="main-footer__partners-wrapper">
                    <a class="main-footer__partners-item" href="">
                        <img src="catalog/view/theme/default/img/partner2.png" alt="">
                    </a>
                    <a class="main-footer__partners-item" href="">
                        <img src="catalog/view/theme/default/img/partner1.png" alt="">
                    </a>
                </div>
            </div>
        </div>
    </footer>
<?php } else { ?>
<footer class="static-footer">
    <div class="container-sm">
        <div class="static-footer__title">coffeeshop</div>
        <div class="static-footer__partners-title">партнеры</div>
        <div class="static-footer__partners-wrapper">
            <a class="static-footer__partners-item" href="">
                <img src="catalog/view/theme/default/img/partner2-big.png" alt="">
            </a>
            <a class="static-footer__partners-item" href="">
                <img src="catalog/view/theme/default/img/partner1-big.png" alt="">
            </a>
        </div>
    </div>
</footer>
<footer class="mobile-footer">
    <div class="container-sm">
        <div class="mobile-footer__inner">
            <a class="mobile-footer__partner" href="">
                <img src="catalog/view/theme/default/img/partner2-big.png" alt="">
            </a>
            <div class="mobile-footer__title">coffeeshop</div>
            <a class="mobile-footer__partner" href="">
                <img src="catalog/view/theme/default/img/partner1-big.png" alt="">
            </a>
        </div>
    </div>
</footer>
<?php } ?>
<div class="alert-message"></div>
<div class="mfp-hide">
    <div id='callback-popup' class="callback-popup">
        <div class="callback-popup__body">
            <div class="callback-popup__header">
                <span class="callback-popup__title">Обратный звонок</span>
                <span class="callback-popup__subtitle">Оставьте свой номер телефона и <strong>мы очень скоро Вам перезвоним</strong></span>
            </div>
            <div class="hidden-popup__title">
                <span class="callback-popup__title">Обратный звонок</span>
                <span class="callback-popup__subtitle">Оставьте свой номер телефона и <strong>мы очень скоро Вам перезвоним</strong></span>
            </div>
            <form action="" class="form_check callback-popup__form">
                <div class="fields-composition">
                    <div class="callback-popup__input-wrapper rline">
                        <input type="text" name="name" class="rfield empty_field callback-popup__input"
                               placeholder="Меня зовут">
                    </div>
                    <div class="callback-popup__input-wrapper rline">
                        <input type="phone" name="phone" class="rfield empty_field phonefield callback-popup__input"
                               placeholder="Мой номер телефона">
                    </div>
                    <div class="callback-popup__form-footer">
                        <button title="Close (Esc)" type="button" class="mfp-close callback-popup__footer-close">
                            Продолжить
                            покупки
                        </button>
                        <button class="btnsubmit callback-popup__btn">ОТПРАВИТЬ</button>
                    </div>
                </div>
            </form>
        </div>
        <button title="Close (Esc)" type="button" class="mfp-close callback-popup__main-close"></button>
    </div>
    <div id='cart-popup' class="cart-popup"></div>
    <div id='hiddenPopup'></div>
    <div id='success-popup' class="success-popup">
        <span class="success-popup__title">ВАШ ЗАКАЗ № 11 ПРИНЯТ!</span>
        <div class="success-popup__feedback">Если у вас возникли вопросы, пожалуйста <a href=""> свяжитесь с нами</a>
        </div>
        <div class="success-popup__details">Наш менеджер свяжется с Вами для обсуждения деталей заказа.</div>
        <div class="success-popup__thanx">СПАСИБО ЗА ПОКУПКИ В НАШЕМ ИНТЕРНЕТ МАГАЗИНЕ!</div>
        <button title="Close (Esc)" type="button" class="mfp-close success-popup__close">Вернуться к товарам</button>
    </div>
</div>

<!--
<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p>
  </div>
</footer>
-->
<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->
<script src="catalog/view/theme/default/js/jquery.appear.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/js/clipboard.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/js/fancySelect.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/js/maskedinput.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/js/jquery.nicescroll.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/js/jQuery.succinct.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/js/slick.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/js/selectize.js" type="text/javascript"></script>
<script src="catalog/view/theme/default/js/main.js" type="text/javascript"></script>
<?php if($home == $og_url){ ?>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfBB28buwftVCOxMkFxewMtSP7KkwjZxo&callback=initMap"></script>
<?php } ?>
</body>

</html>