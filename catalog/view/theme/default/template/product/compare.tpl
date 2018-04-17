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
            <span class="page-title azure">Сравнение товаров</span>
            <span class="page-title__bg">
                <span>c</span>
                <span>o</span>
                <span>f</span>
                <span>f</span>
                <span>e</span>
                <span>e</span>
                <span>s</span>
                <span>h</span>
                <span>o</span>
                <span>p</span>
                <span>.</span>
                <span>u</span>
                <span>a</span>
            </span>
        </div>
        <?php if ($products) { ?>
            <div class="compare-wrapper">
                <ul class="compare-params">
                    <li>Материал</li>
                    <li>Длина</li>
                    <li>Толщина</li>
                    <li>Диаметр</li>
                    <li>Размер</li>
                    <li>Высота</li>
                    <li>Объём</li>


                    <li>Описание</li>
                </ul>
                <div class="compare-slider"></div>
                <?php if ($products) { ?>
                    <?php foreach ($products as $product) { ?>
                        <div class="col-sm-3 compare-item">
                            <div class="item c-item">
                                <span class="item-label"></span>
                                <a href="<?php echo $product['remove']; ?>" class="compare-item-remove">удалить</a>
                                <div class="item-pic__wrapper">
                                    <?php if ($product['thumb']) { ?>
                                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="item-pic"/>
                                    <?php } ?>
                                </div>
                                <div class="item-title__wrapper">
                                    <a class="item-title" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                </div>
                                <div class="item-specsifications">
                                    <?php
                                    if($product['attribute']) {
                                        foreach ($product['attribute'] as $key => $attribute) { ?>
                                        <?php $icons = array(22 => 'material', 20 => 'width', 11 => 'thickness', 26 => 'diameter', 30 => 'size', 21 => 'height', 24 => 'volume'); ?>
                                            <div class="item-specs__info">
                                                <i class="product-info__specs-icon <?php echo $icons[$key]; ?>"></i>
                                                <span class="list-item-specs__title"><?php echo $attribute; ?></span>
                                            </div>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                                <div class="text-decription item-description__wrapper">
                                    <div class="item-description">
                                        <?php echo $product['description']; ?>
                                    </div>
                                </div>
                                <span class="show-compare__description">Читать полностью</span>
                                <?php if ($product['price']) { ?>
                                    <div class="item-price-wrapper">
                                        <?php if (!$product['special']) { ?>
                                        <span class="item-price"><?php echo $product['price']; ?></span>
                                        <?php } else { ?>
                                        <span class="hidden-price"><?php echo $product['price']; ?></span>
                                        <span class="item-price"><?php echo $product['special']; ?></span>
                                        <?php } ?>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    <?php } ?>
                <?php } ?>
            </div>
        <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
        <?php } ?>
    </div>
</main>
<?php echo $footer; ?>