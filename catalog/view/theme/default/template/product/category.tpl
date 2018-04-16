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
    </div>
    <div class="category-main__wrapper">
        <span class="filter-sidebar__title sticky">Фильтр товаров</span>
        <div class="container">
            <div class="col-sm-3 filter-sidebar__wrapper">
                <span class="filter-sidebar__title">Фильтр товаров</span>
                <aside class="filter-sidebar">
                    <span class="filter-sidebar__hide">Свернуть фильтр</span>
                    <div class="filter-sidebar__section range">
                        <span class="filter-sidebar__section-title">Цена</span>
                        <div class="price-inputs">
                            <div class="price-inputs__inner">
                                <input type="text" class="sliderValue val1" data-index="0" value="25" />
                                <input type="text" class="sliderValue val2" data-index="1" value="1500" />
                            </div>
                            <span> грн </span>
                        </div>
                        <div class="price-range"></div>
                    </div>
                    <div class="filter-sidebar__section">
                        <span class="filter-sidebar__section-title">Уровень ТГК</span>
                        <ul class="filter-sidebar__checkbox-list">
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk1">
                                <label for="chk1">Очень высокий</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk2">
                                <label for="chk2">Высокий</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk3">
                                <label for="chk3">Низкий</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk4">
                                <label for="chk4">Средний</label>
                            </li>
                        </ul>
                    </div>
                    <div class="filter-sidebar__section">
                        <div class="filter-apply__wrapper">
                            <div class="filter-apply">
                                <div class="filter-apply__text">Вы выбрали <span class="filter-apply__counter">25</span> товаров</div>
                                <span class="filter-apply__show">Показать</span>
                            </div>
                        </div>
                    </div>
                    <div class="filter-sidebar__section">
                        <span class="filter-sidebar__section-title">Тип растения</span>
                        <ul class="filter-sidebar__checkbox-list">
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk5">
                                <label for="chk5">Сатива</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk6">
                                <label for="chk6">Индика</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk7">
                                <label for="chk7">Преимущественно Сатива</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk8">
                                <label for="chk8">Преимущественно Индика</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk9">
                                <label for="chk9">Рудералис</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk10">
                                <label for="chk10">Рудералис/Сатива</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk11">
                                <label for="chk11">Рудералис/Индика</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk12">
                                <label for="chk12">Сатива/Индика</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk13">
                                <label for="chk13">Сатива/Индика/Рудералис</label>
                            </li>
                        </ul>
                    </div>
                    <span class="filter-separator"></span>
                    <div class="filter-sidebar__section">
                        <span class="filter-sidebar__section-title">Урожайность</span>
                        <ul class="filter-sidebar__checkbox-list">
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk14">
                                <label for="chk14">Низкая</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk15">
                                <label for="chk15">Средняя</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk16">
                                <label for="chk16">Высокая</label>
                            </li>
                        </ul>
                    </div>
                    <span class="filter-separator"></span>
                    <div class="filter-sidebar__section">
                        <span class="filter-sidebar__section-title">Высота Растения</span>
                        <ul class="filter-sidebar__checkbox-list">
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk17">
                                <label for="chk17">Низкая</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk18">
                                <label for="chk18">Средняя</label>
                            </li>
                            <li class="filter">
                                <input class="filter-checkbox" type="checkbox" name="" id="chk19">
                                <label for="chk19">Высокая</label>
                            </li>
                        </ul>
                    </div>
                    <button class="filter-apply__btn">Применить</button>
                </aside>
            </div>
            <div class="col-sm-9 category-wrapper">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="top-filter__wrapper">
                            <div class="fancy-select filter-select">
                                <span class="filter-select__title">Показаны товары</span>
                                <select class="filter-select-list" id="input-sort" onchange="location = this.value;">
                                    <?php foreach ($sorts as $sorts) { ?>
                                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                    <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                                    <?php } else { ?>
                                    <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select>
                            </div>
                            <?php if ($products) { ?>
                            <div class="filter-view">
                                <button type="button" id="list-view" class="filter-view__item list" data-toggle="tooltip"
                                        title="<?php echo $button_list; ?>"></button>
                                <button type="button" id="grid-view" class="filter-view__item grid active" data-toggle="tooltip"
                                        title="<?php echo $button_grid; ?>"></button>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <div id="products-category" class="row">
                    <?php foreach ($products as $product) { ?>
                    <div class="product-list col-sm-4 category-item">
                        <div class="item">
                            <?php if ($product['price'] && $product['special']) { ?>
                                <span class="item-label sale"></span>
                            <?php } ?>
                            <div class="item-pic__wrapper">
                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="item-pic"/>
                            </div>
                            <div class="item-title__wrapper">
                                <a class="item-title" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
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
                </div>
                <div class="row">
                    <div class="text-decription bottom">
                        <?php  echo $description; ?>
                    </div>
                    <span class="read-more">Читать полностью</span>
                </div>
            </div>
        </div>
    </div>
</main>
<!--
<div class="row">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <h1><?php echo $heading_title; ?></h1>
        <?php if ($thumb || $description) { ?>
        <div class="row">
            <?php if ($thumb) { ?>
            <div class="col-sm-2">
                <img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>"
                     title="<?php echo $heading_title; ?>" class="img-thumbnail"/>
            </div>
            <?php } ?>
            <?php if ($description) { ?>
            <div class="col-sm-10"><?php echo $description; ?></div>
            <?php } ?>
        </div>
        <hr>
        <?php } ?>
        <?php if ($categories) { ?>
        <h3><?php echo $text_refine; ?></h3>
        <?php if (count($categories) <= 5) { ?>
        <div class="row">
            <div class="col-sm-3">
                <ul>
                    <?php foreach ($categories as $category) { ?>
                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <?php } else { ?>
        <div class="row">
            <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
            <div class="col-sm-3">
                <ul>
                    <?php foreach ($categories as $category) { ?>
                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <?php } ?>
        </div>
        <?php } ?>
        <?php } ?>
        <?php if ($products) { ?>
        <div class="row">
            <div class="col-md-2 col-sm-6 hidden-xs">
                <div class="btn-group btn-group-sm">
                    <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip"
                            title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                    <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip"
                            title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="form-group">
                    <a href="<?php echo $compare; ?>" id="compare-total"
                       class="btn btn-link"><?php echo $text_compare; ?></a>
                </div>
            </div>
            <div class="col-md-4 col-xs-6">
                <div class="form-group input-group input-group-sm">
                    <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
                    <select id="input-sort" class="form-control" onchange="location = this.value;">
                        <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['href']; ?>"
                                selected="selected"><?php echo $sorts['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <div class="col-md-3 col-xs-6">
                <div class="form-group input-group input-group-sm">
                    <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
                    <select id="input-limit" class="form-control" onchange="location = this.value;">
                        <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['href']; ?>"
                                selected="selected"><?php echo $limits['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <?php foreach ($products as $product) { ?>
            <div class="product-layout product-list col-xs-12">
                <div class="product-thumb">
                    <div class="image">
                        <a href="<?php echo $product['href']; ?>">
                            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"
                                 title="<?php echo $product['name']; ?>" class="img-responsive"/>
                        </a>
                    </div>
                    <div>
                        <div class="caption">
                            <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                            <p><?php echo $product['description']; ?></p>
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
                            <?php if ($product['rating']) { ?>
                            <div class="rating">
                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                <?php if ($product['rating'] < $i) { ?>
                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                <?php } else { ?>
                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                            class="fa fa-star-o fa-stack-2x"></i></span>
                                <?php } ?>
                                <?php } ?>
                            </div>
                            <?php } ?>
                        </div>
                        <div class="button-group">
                            <button type="button"
                                    onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
                                <i class="fa fa-shopping-cart"></i> <span
                                        class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span>
                            </button>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>"
                                    onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i
                                        class="fa fa-heart"></i></button>
                            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>"
                                    onclick="compare.add('<?php echo $product['product_id']; ?>');"><i
                                        class="fa fa-exchange"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
        <div class="row">
            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
            <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
        <?php } ?>
        <?php if (!$categories && !$products) { ?>
        <p><?php echo $text_empty; ?></p>
        <div class="buttons">
            <div class="pull-right"><a href="<?php echo $continue; ?>"
                                       class="btn btn-primary"><?php echo $button_continue; ?></a></div>
        </div>
        <?php } ?>
        <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
-->
<?php echo $footer; ?>
