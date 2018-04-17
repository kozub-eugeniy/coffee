<?php echo $header; ?>
<nav class="breadcrumbs-wrapper">
    <div class="container">
        <ul class="breadcrumbs">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li class="breadcrumbs-item<?php if($breadcrumb['text'] == 'Главная') echo ' home'; ?>">
                <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            </li>
            <?php } ?>
        </ul>
    </div>
</nav>
<main class="main-content">
    <div class="container">
        <div class="page-title__wrapper">
            <span class="page-title azure"><?php echo $heading_title; ?></span>
            <span class="page-title__bg">
                <span>с</span>
                <span>е</span>
                <span>м</span>
                <span>е</span>
                <span>н</span>
                <span>а</span>
                <span> </span>
                <span>к</span>
                <span>о</span>
                <span>н</span>
                <span>о</span>
                <span>п</span>
                <span>л</span>
                <span>и</span>
            </span>
        </div>
        <div class="product-wrapper <?php if ($price && $special) { echo 'sale'; } ?>">
            <div class="product-bookmark-wrapper">
                <div class="item-compare-wrapper">
                    <input class="item-compare" type="checkbox" name="compare" id="c<?php echo $product['product_id']; ?>">
                    <label class="compare-label" for="c<?php echo $product['product_id']; ?>" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"></label>
                </div>
                <!--<button class="item-buy-btn" onclick="cart.add('<?php echo $product_id; ?>');">Купить</button>-->
                <div class="item-bookmark-wrapper">
                    <input class="item-bookmark" type="checkbox" name="bookmark" id="b<?php echo $product['product_id']; ?>">
                    <label class="bookmark-label" for="b<?php echo $product['product_id']; ?>" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"></label>
                </div>
            </div>
            <div class="product-socials-wrapper">
                <div class="share42init"></div>
            </div>
            <?php if ($price && $special) { ?>
            <span class="product-label sale"></span>
            <?php } ?>
            <div class="product-slider__wrapper">
                <?php if ($thumb || $images) { ?>
                <div class="product-slider">
                    <?php foreach ($images as $image) { ?>
                        <div>
                            <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
                        </div>
                    <?php } ?>
                </div>
                <div class="product-nav">
                    <?php foreach ($images as $image) { ?>
                        <div>
                            <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
                        </div>
                    <?php } ?>
                </div>
                <?php } ?>
            </div>
            <div class="product-info__wrapper">
                <span class="product-info__title"><strong>характеристики</strong> товара</span>
                <div class="product-info__specs-buy">
                    <div class="product-info__specs">
                        <?php if ($attribute_groups) { ?>
                            <?php foreach ($attribute_groups as $attribute_group) { ?>
                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                               <?php
                               $id = $attribute['attribute_id'];
                               $icons = array(22 => 'material', 20 => 'width', 11 => 'thickness', 26 => 'diameter', 30 => 'size', 21 => 'height', 24 => 'volume'); ?>
                                    <div class="product-info__specs-item col-sm-3">
                                        <!--<i><?php echo $attribute['name']; ?></i><i class="product-info__specs-icon material"></i>-->
                                        <i class="product-info__specs-icon <?php echo $icons[$id]; ?>"></i>
                                        <span class="product-info__specs-item-title"><?php echo $attribute['text']; ?></span>
                                    </div>
                        <?php } ?>
                            <?php } ?>
                        <?php } ?>
                    </div>
                    <div class="product-info__buy option2">
                        <?php if ($options) { ?>
                            <?php foreach ($options as $option) { ?>
                                <?php if ($option['type'] == 'select') { ?>
                                    <div class="product-info__count-list">
                                        <div class="fancy-select">
                                            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="product-select-list">
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                    <?php } ?>
                                                </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                        <span class="product-select-list__footnote">в упаковке</span>
                                    </div>
                                <?php } ?>
                            <?php } ?>
                        <?php } ?>
                        <div class="product-info__buy-wrapper">
                            <?php if ($price) { ?>
                            <div class="product-info__price-wrapper">
                                <?php if (!$special) { ?>
                                    <span class="product-info__price-new"><?php echo price; ?></span>
                                <?php } else { ?>
                                    <span class="product-info__price-old"><?php echo $price; ?></span>
                                    <span class="product-info__price-new"><?php echo $special; ?></span>
                                <?php } ?>
                            </div>
                            <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="product-info__buy-btn">Купить</button>
                            <?php } else { ?>
                            <span class="product-info__not-available">нет на складе</span>
                            <?php } ?>
                        </div>
                        <div class="product-info__count-wrapper">
                            <div class="items-counter">
                                <div class="minus">–</div>
                                <input type="text" name="quantity" value="<?php echo $minimum; ?>" id="input-quantity" class="count-field" pattern="^[ 0-9]+$"/>
                                <div class="plus">+</div>
                            </div>
                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                            <span class="product-info__count-footnote">упаковки</span>
                        </div>
                    </div>
                </div>
                <span class="product-info__title"><strong>описание</strong> товара</span>
                <div class="product-info__text">
                    <?php echo $description; ?>
                </div>
                <span class="product-info__read-more">Читать полностью</span>
            </div>
        </div>
        <nav class="products-tabs">
            <ul class="products-tabs__list">
                <li class="products-tabs__item active"><span><strong>покупают</strong> вместе</span></li>
                <li class="products-tabs__item"><span><strong>доставка</strong> товара</span></li>
            </ul>
            <div class="products-tabs__content row active">
                <?php if ($products) { ?>
                    <?php foreach ($products as $product) { ?>
                        <div class="col-sm-3">
                            <div class="item">
                                <span class="item-label"></span>
                                <div class="item-pic__wrapper">
                                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="item-pic"/>
                                </div>
                                <div class="item-title__wrapper">
                                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                </div>
                                <?php if ($product['price']) { ?>
                                    <div class="item-price-wrapper">
                                        <?php if (!$product['special']) { ?>
                                        <div class="item-price"><?php echo $product['price']; ?></div>
                                        <?php } else { ?>
                                        <div class="hidden-price"><?php echo $product['price']; ?></div>
                                        <div class="item-price"><?php echo $product['special']; ?></div>
                                        <?php } ?>
                                    </div>
                                <?php } ?>
                                <div class="item-buy-wrapper">
                                    <div class="item-compare-wrapper">
                                        <input class="item-compare" type="checkbox" name="compare" id="c<?php echo $product['product_id']; ?>">
                                        <label class="compare-label" for="c<?php echo $product['product_id']; ?>" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"></label>
                                    </div>
                                    <button class="item-buy-btn" onclick="cart.add('<?php echo $product['product_id']; ?>');">Купить</button>
                                    <div class="item-bookmark-wrapper">
                                        <input class="item-bookmark" type="checkbox" name="bookmark" id="b<?php echo $product['product_id']; ?>">
                                        <label class="bookmark-label" for="b<?php echo $product['product_id']; ?>" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                <?php } ?>
            </div>
            <div class="products-tabs__content">
                <div class="product-delivery__text">
                    <strong>Оформление заказа</strong>
                    Обращаем Ваше внимание: на покупателей нашего магазина распространяются все права предусмотренные в Законе "О защите прав потребителя".
                    <br><br>
                    Вы можете оформить заказ двумя способами.<br>
                    а) с помощью "Корзины" непосредственно в магазине (способ описан ниже)<br>
                    б) по телефону.<br>
                    Заказ с помощью "Корзины" позволяет Вам полностью контролировать процесс. Введя Ваш e-mail и пароль, который Вы выбрали при регистрации Вы получите доступ к состоянию Вашего заказа. Вы сможете контролировать получение нами оплаты, отправку заказа к Вам, дату получения заказа, историю всех предыдущих заказов.
                    <br><br>
                    <strong>Доставка в пределах Киева</strong> при заказе на сумму свыше 2500 грн бесплатна!<br>
                    Стоимость доставки товаров до 2500 грн составляет 45 грн.
                    <br><br>
                    <strong>По Киеву доставка осуществляется с 10 до 21 часа в рабочие дни и с 10 до 17 часов по субботам</strong>. Наши сотрудники не только оперативно доставят заказ по указанному Вами адресу в удобное для Вас время, но и продемонстрируют работоспособность товара (для устройств, работающих автономно), а также оформят все необходимые документы.<br>
                    Обычно если Вы разместили заказ до 15 часов — мы доставим его в тот же день. В любом случае во время заказа наши менеджеры сразу назовут время доставки.
                    <br><br>
                    Однако если по каким-то причинам Вам удобнее забрать заказ самому, приезжайте в гости. Мы находимся на улице Ярославская, 57. Это всего 5 минут пешком от станции метро Тараса Шевченко или Контрактовой площади. Стоимость доставки по Украине в пункт самовывоза составляет 45 грн. Ориентировочные сроки доставки 1-3 рабочих дня. Если товар находится на удаленном складе, сроки могут увеличиваться.
                </div>
            </div>
        </nav>
        <?php if ($review_status) { ?>
            <div class="products-comments__wrapper">
                <div class="comments-block">
                    <span class="product-info__title"><strong>Отзывы</strong> к товару</span>
                    <ul id="review" class="comments-list"></ul>
                    <div class="comment-form__wrapper">
                        <span class="product-info__title"><strong>Оставить</strong> отзыв</span>
                        <form class="form_check comment-form" id="form-review">
                            <div class="fields-composition">
                                <?php if ($review_guest) { ?>
                                <div class="comment-form__input-wrapper rline">
                                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="rfield empty_field comment-form__input" placeholder="Имя"/>
                                    <div class="comment-form__login-wrapper">или <a class="comment-form__login-link" href="<?php echo $login; ?>">авторизируйтесь</a></div>
                                </div>
                                <div class="comment-form__input-wrapper rline">
                                    <textarea name="text" id="input-review" class="rfield empty_field comment-form__text" placeholder="Отзыв"></textarea>
                                </div>
                                <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btnsubmit comment-form__btn">ОТПРАВИТЬ</button>
                                <!--
                                <div class="form-group required">
                                    <div class="col-sm-12">
                                        <label class="control-label"><?php echo $entry_rating; ?></label>
                                        &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                        <input type="radio" name="rating" value="1"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="2"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="3"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="4"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="5"/>
                                        &nbsp;<?php echo $entry_good; ?></div>
                                </div>
                                <?php echo $captcha; ?>
                                <div class="buttons clearfix">
                                    <div class="pull-right">
                                        <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                                    </div>
                                </div>-->
                                <?php } else { ?>
                                <?php echo $text_login; ?>
                                <?php } ?>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
</main>
<!--
<div class="container">
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <div class="row">
                <?php if ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-8'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <?php if ($thumb || $images) { ?>
                    <ul class="thumbnails">
                        <?php if ($thumb) { ?>
                        <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img
                                        src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                                        alt="<?php echo $heading_title; ?>"/></a></li>
                        <?php } ?>
                        <?php if ($images) { ?>
                        <?php foreach ($images as $image) { ?>
                        <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>"
                                                        title="<?php echo $heading_title; ?>"> <img
                                        src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
                                        alt="<?php echo $heading_title; ?>"/></a></li>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                    <?php } ?>
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-description"
                                              data-toggle="tab"><?php echo $tab_description; ?></a></li>
                        <?php if ($attribute_groups) { ?>
                        <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
                        <?php } ?>
                        <?php if ($review_status) { ?>
                        <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                        <?php } ?>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
                        <?php if ($attribute_groups) { ?>
                        <div class="tab-pane" id="tab-specification">
                            <table class="table table-bordered">
                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                <thead>
                                <tr>
                                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                <tr>
                                    <td><?php echo $attribute['name']; ?></td>
                                    <td><?php echo $attribute['text']; ?></td>
                                </tr>
                                <?php } ?>
                                </tbody>
                                <?php } ?>
                            </table>
                        </div>
                        <?php } ?>
                        <?php if ($review_status) { ?>
                        <div class="tab-pane" id="tab-review">
                            <form class="form-horizontal" id="form-review">
                                <div id="review"></div>
                                <h2><?php echo $text_write; ?></h2>
                                <?php if ($review_guest) { ?>
                                <div class="form-group required">
                                    <div class="col-sm-12">
                                        <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                        <input type="text" name="name" value="<?php echo $customer_name; ?>"
                                               id="input-name" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <div class="col-sm-12">
                                        <label class="control-label"
                                               for="input-review"><?php echo $entry_review; ?></label>
                                        <textarea name="text" rows="5" id="input-review"
                                                  class="form-control"></textarea>
                                        <div class="help-block"><?php echo $text_note; ?></div>
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <div class="col-sm-12">
                                        <label class="control-label"><?php echo $entry_rating; ?></label>
                                        &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                        <input type="radio" name="rating" value="1"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="2"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="3"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="4"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="5"/>
                                        &nbsp;<?php echo $entry_good; ?></div>
                                </div>
                                <?php echo $captcha; ?>
                                <div class="buttons clearfix">
                                    <div class="pull-right">
                                        <button type="button" id="button-review"
                                                data-loading-text="<?php echo $text_loading; ?>"
                                                class="btn btn-primary"><?php echo $button_continue; ?></button>
                                    </div>
                                </div>
                                <?php } else { ?>
                                <?php echo $text_login; ?>
                                <?php } ?>
                            </form>
                        </div>
                        <?php } ?>
                    </div>
                </div>
                <?php if ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-4'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <div class="btn-group">
                        <button type="button" data-toggle="tooltip" class="btn btn-default"
                                title="<?php echo $button_wishlist; ?>"
                                onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i>
                        </button>
                        <button type="button" data-toggle="tooltip" class="btn btn-default"
                                title="<?php echo $button_compare; ?>"
                                onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i>
                        </button>
                    </div>
                    <h1><?php echo $heading_title; ?></h1>
                    <ul class="list-unstyled">
                        <?php if ($manufacturer) { ?>
                        <li><?php echo $text_manufacturer; ?> <a
                                    href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                        <?php } ?>
                        <li><?php echo $text_model; ?> <?php echo $model; ?></li>
                        <?php if ($reward) { ?>
                        <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
                        <?php } ?>
                        <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
                    </ul>
                    <?php if ($price) { ?>
                    <ul class="list-unstyled">
                        <?php if (!$special) { ?>
                        <li>
                            <h2><?php echo $price; ?></h2>
                        </li>
                        <?php } else { ?>
                        <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
                        <li>
                            <h2><?php echo $special; ?></h2>
                        </li>
                        <?php } ?>
                        <?php if ($tax) { ?>
                        <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
                        <?php } ?>
                        <?php if ($points) { ?>
                        <li><?php echo $text_points; ?> <?php echo $points; ?></li>
                        <?php } ?>
                        <?php if ($discounts) { ?>
                        <li>
                            <hr>
                        </li>
                        <?php foreach ($discounts as $discount) { ?>
                        <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                    <?php } ?>
                    <div id="product">
                        <?php if ($options) { ?>
                        <hr>
                        <h3><?php echo $text_option; ?></h3>
                        <?php foreach ($options as $option) { ?>
                        <?php if ($option['type'] == 'select') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <select name="option[<?php echo $option['product_option_id']; ?>]"
                                    id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price']) { ?>
                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                    <?php } ?>
                                </option>
                                <?php } ?>
                            </select>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'radio') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <?php if ($option_value['image']) { ?>
                                        <img src="<?php echo $option_value['image']; ?>"
                                             alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                             class="img-thumbnail"/>
                                        <?php } ?>
                                        <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                        )
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"
                                               name="option[<?php echo $option['product_option_id']; ?>][]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <?php if ($option_value['image']) { ?>
                                        <img src="<?php echo $option_value['image']; ?>"
                                             alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                             class="img-thumbnail"/>
                                        <?php } ?>
                                        <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                        )
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'text') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                   value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'textarea') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5"
                                      placeholder="<?php echo $option['name']; ?>"
                                      id="input-option<?php echo $option['product_option_id']; ?>"
                                      class="form-control"><?php echo $option['value']; ?></textarea>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'file') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>"
                                    data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block">
                                <i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value=""
                                   id="input-option<?php echo $option['product_option_id']; ?>"/>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'date') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group date">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD"
                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                       class="form-control"/>
                                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'datetime') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group datetime">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm"
                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                       class="form-control"/>
                                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'time') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group time">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option['value']; ?>" data-date-format="HH:mm"
                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                       class="form-control"/>
                                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                        </div>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($recurrings) { ?>
                        <hr>
                        <h3><?php echo $text_payment_recurring; ?></h3>
                        <div class="form-group required">
                            <select name="recurring_id" class="form-control">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($recurrings as $recurring) { ?>
                                <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                                <?php } ?>
                            </select>
                            <div class="help-block" id="recurring-description"></div>
                        </div>
                        <?php } ?>
                        <div class="form-group">
                            <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                            <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2"
                                   id="input-quantity" class="form-control"/>
                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                            <br/>
                            <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"
                                    class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
                        </div>
                        <?php if ($minimum > 1) { ?>
                        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
                        </div>
                        <?php } ?>
                    </div>
                    <?php if ($review_status) { ?>
                    <div class="rating">
                        <p>
                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                            <?php if ($rating < $i) { ?>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                            <?php } else { ?>
                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                                        class="fa fa-star-o fa-stack-1x"></i></span>
                            <?php } ?>
                            <?php } ?>
                            <a href=""
                               onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a>
                            / <a href=""
                                 onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
                        </p>
                        <hr>
                        <!-- AddThis Button BEGIN -->
                       <!-- <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a
                                    class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a
                                    class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a
                                    class="addthis_counter addthis_pill_style"></a></div>
                        <script type="text/javascript"
                                src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                        <!-- AddThis Button END -->
                   <!-- </div>
                    <?php } ?>
                </div>
            </div>
            <?php if ($products) { ?>
            <h3><?php echo $text_related; ?></h3>
            <div class="row">
                <?php $i = 0; ?>
                <?php foreach ($products as $product) { ?>
                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-xs-8 col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-xs-6 col-md-4'; ?>
                <?php } else { ?>
                <?php $class = 'col-xs-6 col-sm-3'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <div class="product-thumb transition">
                        <div class="image"><a href="<?php echo $product['href']; ?>"><img
                                        src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"
                                        title="<?php echo $product['name']; ?>" class="img-responsive"/></a></div>
                        <div class="caption">
                            <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                            <p><?php echo $product['description']; ?></p>
                            <?php if ($product['rating']) { ?>
                            <div class="rating">
                                <?php for ($j = 1; $j <= 5; $j++) { ?>
                                <?php if ($product['rating'] < $j) { ?>
                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                <?php } else { ?>
                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                                            class="fa fa-star-o fa-stack-1x"></i></span>
                                <?php } ?>
                                <?php } ?>
                            </div>
                            <?php } ?>
                            <?php if ($product['price']) { ?>
                            <p class="price">
                                <?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?>
                                <?php } else { ?>
                                <span class="price-new"><?php echo $product['special']; ?></span> <span
                                        class="price-old"><?php echo $product['price']; ?></span>
                                <?php } ?>
                                <?php if ($product['tax']) { ?>
                                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                <?php } ?>
                            </p>
                            <?php } ?>
                        </div>
                        <div class="button-group">
                            <button type="button"
                                    onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
                                <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_count; ?></span> <i
                                        class="fa fa-shopping-cart"></i></button>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>"
                                    onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i
                                        class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>"
                                    onclick="compare.add('<?php echo $product['product_id']; ?>');"><i
                                        class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>
                <?php if (($column_left && $column_right) && (($i+1) % 2 == 0)) { ?>
                <div class="clearfix visible-md visible-sm"></div>
                <?php } elseif (($column_left || $column_right) && (($i+1) % 3 == 0)) { ?>
                <div class="clearfix visible-md"></div>
                <?php } elseif (($i+1) % 4 == 0) { ?>
                <div class="clearfix visible-md"></div>
                <?php } ?>
                <?php $i++; ?>
                <?php } ?>
            </div>
            <?php } ?>
            <?php if ($tags) { ?>
            <p><?php echo $text_tags; ?>
                <?php for ($i = 0; $i < count($tags); $i++) { ?>
                <?php if ($i < (count($tags) - 1)) { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                <?php } else { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                <?php } ?>
                <?php } ?>
            </p>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
-->
<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-cart').button('loading');
            },
            complete: function () {
                $('#button-cart').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

                    $('html, body').animate({scrollTop: 0}, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
        grecaptcha.reset();
    });

    $(document).ready(function () {
        $('.thumbnails').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled: true
            }
        });
    });

    $(document).ready(function () {
        var hash = window.location.hash;
        if (hash) {
            var hashpart = hash.split('#');
            var vals = hashpart[1].split('-');
            for (i = 0; i < vals.length; i++) {
                $('#product').find('select option[value="' + vals[i] + '"]').attr('selected', true).trigger('select');
                $('#product').find('input[type="radio"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
                $('#product').find('input[type="checkbox"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
            }
        }
    })
    //--></script>
<?php echo $footer; ?>
