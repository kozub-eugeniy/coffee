<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="catalog/view/theme/default/js/jquery-ui.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1">
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/fontello.css"/>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/slick.css"/>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/animate.css">
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/slick-theme.css"/>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/fancySelect.css"/>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/selectize.default.css"/>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/magnific-popup.css"/>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/bootstrap.min.css">
  <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/style.css">
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/media.css">
  <link rel="icon" type="image/png" sizes="16x16" href="catalog/view/theme/default/img/favicon-16x16.png">

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<header <?php if($home == $og_url) { echo 'class="main-header"';} else { echo 'class="static-header"'; } ?>>
    <nav class="top-menu">
        <div class="container">
            <ul class="top-menu__list">
                <li class="top-menu__item current">
                    <a class="top-menu__link" href="<?php echo $home; ?>">Главная</a>
                </li>
                <?php foreach ($categories as $category) { ?>
                <li class="top-menu__item">
                    <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                    <?php if ($category['children']) { ?>
                    <ul class="top-submenu__list">
                        <li class="top-submenu__item top-submenu__title"><?php echo $category['name']; ?></li>
                        <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                        <?php foreach ($children as $child) { ?>
                        <li class="top-submenu__item">
                            <span></span><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                        <?php } ?>
                        <?php } ?>
                        <span class="close-dropdown"></span>
                    </ul>
                    <?php } ?>
                </li>
                <?php } ?>
            </ul>
            <div class="top-menu__tools">
                <?=$currency?>
                <div class="btns-group">
                    <a id="compare-counter" class="compare-btn" href="<?php echo $compare_url; ?>" title="В сравнении">
                        <span class="compare-counter"><?php echo $compare_count; ?></span>
                    </a>
                    <a id="bookmark-counter" class="bookmark-btn" href="<?php echo $wishlist; ?>" title="Мои закладки">
                        <span class="bookmark-counter"><?php echo $wishlist_count; ?></span>
                    </a>
                </div>
                <?php echo $cart;?>
                <a class="login-btn" href="<?php echo $login; ?>">Вход</a>
                <button class="burger-btn">
                    <span></span>
                </button>
                <div class="mobile-menu">
                    <div class="mobile-menu__inner">
                        <ul class="mobile-menu__list">
                            <li class="mobile-menu__item">
                                <a href="">Вход</a>
                            </li>
                            <li class="mobile-menu__item">
                                <a href="">Регистрация</a>
                            </li>
                            <li class="mobile-menu__item">
                                <a href="">Мои закладки <span>(<i
                                                class="compare-counter menu-compare-counter">0</i>)</span></a>
                            </li>
                            <li class="mobile-menu__item">
                                <a href="">Избранное <span>(<i
                                                class="bookmark-counter menu-bookmark-counter">0</i>)</span></a>
                            </li>
                            <li class="mobile-menu__item mobile-menu__category-item">
                                <strong class="mobile-menu__category-item__title">SEEDSHOP</strong>
                                <ul class="mobile-submenu">
                                    <li class="mobile-submenu__item"><a href="">Автоцветущие феминизированные семена</a>
                                    </li>
                                    <li class="mobile-submenu__item"><a href="">Фотопериодичные феминизированные
                                            семена</a></li>
                                </ul>
                            </li>
                            <li class="mobile-menu__item mobile-menu__category-item">
                                <strong class="mobile-menu__category-item__title">GROWSHOP</strong>
                                <ul class="mobile-submenu">
                                    <li class="mobile-submenu__item"><a href="">Гроубоксы</a></li>
                                    <li class="mobile-submenu__item"><a href="">Удобрения</a></li>
                                    <li class="mobile-submenu__item"><a href="">Освещение</a></li>
                                </ul>
                            </li>
                            <li class="mobile-menu__item mobile-menu__category-item">
                                <strong class="mobile-menu__category-item__title">HEMPSHOP</strong>
                                <ul class="mobile-submenu">
                                    <li class="mobile-submenu__item"><a href="">Одежда</a></li>
                                    <li class="mobile-submenu__item"><a href="">Постельное бельё</a></li>
                                </ul>
                            </li>
                            <li class="mobile-menu__item mobile-menu__category-item">
                                <strong class="mobile-menu__category-item__title">HEADSHOP</strong>
                                <ul class="mobile-submenu">
                                    <li class="mobile-submenu__item"><a href="">Бонги, трубки, всё для курения</a></li>
                                    <li class="mobile-submenu__item"><a href="">Гриндеры</a></li>
                                    <li class="mobile-submenu__item"><a href="">Прочее</a></li>
                                </ul>
                            </li>
                            <li class="mobile-menu__item">
                                <a href=""><strong>О нас</strong></a>
                            </li>
                            <li class="mobile-menu__item">
                                <a href="">Вопросы</a>
                            </li>
                            <li class="mobile-menu__item">
                                <a href="">Доставка и Оплата</a>
                            </li>
                            <li class="mobile-menu__item">
                                <a href="">Замена и возврат</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <?php if($home == $og_url){ ?>
    <div class="middle-header">
        <div class="container">
            <div class="contacts-wrapper">
                <div class="contacts-left__mobile">
                    <div class="main-logo-wrapper">
                        <?php if ($home == $og_url) { ?>
                        <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/>
                        <?php } else { ?>
                        <a href="<?php echo $home; ?>">
                            <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/>
                        </a>
                        <?php } ?>
                    </div>
                    <button class="callback-btn inline-popup" data-mfp-src="#callback-popup">ОБРАТНЫЙ ЗВОНОК</button>
                    <div class="phone-block__wrapper">
                        <div class="phone-block">
                            <i class="cell-icon"></i>
                            <i class="telegram-icon"></i>
                            <i class="viber-icon"></i>
                            <span class="phone" id="copy">(095) 420 0 666</span>
                        </div>
                        <ul class="phone-menu">
                            <li class="phone-copy" data-clipboard-target="#copy">Скопировать номер телефона</li>
                            <li><a href="">Написать в Telegram</a></li>
                            <li><a href="">Написать в Viber</a></li>
                        </ul>
                    </div>
                </div>
                <ul class="schedule">
                    <li class="schedule-title">Мы работаем:</li>
                    <li class="schedule-time">пн-пт: <strong>с 10 до 18</strong><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><br>сб-вс: <strong>с 10 до 15</strong></li>
                    <li class="schedule-footnote">круглосуточно онлайн!</li>
                </ul>
            </div>
            <div class="main-slider">
                <div class="main-slider__item">
                    <div class="main-slider__bg" style="background: url('catalog/view/theme/default/img/slider/1.jpg') #205211;">
                        <div class="main-slider__item-inner">
                            <span class="main-slider__title">Всё для грова</span>
                            <div class="main-slider__descr">
                                <strong>У нас лучшие товары для грова!</strong>
                                <p>Давайте послушаем, что говорят наши клиенты:</p>
                                <i>"По-по-поднял бабла, стали другими дела, <br>
                                    стали считаться со мной, знают, кто теперь я..."</i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-slider__item">
                    <div class="main-slider__bg" style="background: url('catalog/view/theme/default/img/slider/1.jpg') no-repeat #205211;">
                        <div class="main-slider__item-inner">
                            <span class="main-slider__title">Какой-то заголовок</span>
                            <div class="main-slider__descr">
                                <strong>Заголовок</strong>
                                <p>Подзаголовок</p>
                                <i>"Какая-то цитата <br>
                                    в две строки..."</i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-slider__item">
                    <div class="main-slider__bg" style="background: url('catalog/view/theme/default/img/slider/1.jpg') no-repeat #205211;">
                        <div class="main-slider__item-inner">
                            <span class="main-slider__title">Какой-то заголовок</span>
                            <div class="main-slider__descr">
                                <strong>Заголовок</strong>
                                <p>Подзаголовок</p>
                                <i>"Какая-то цитата <br>
                                    в две строки..."</i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php } else { ?>
    <div <?php if($home == $og_url) { echo  'class="static-middle-header static-middle-header__before'; } else { echo 'class="static-middle-header"'; } ?>>
        <div class="container-sm">
            <div class="static-middle-header__inner">
                <div class="phone-block__wrapper">
                    <div class="phone-block">
                        <i class="cell-icon"></i>
                        <i class="telegram-icon"></i>
                        <i class="viber-icon"></i>
                        <span class="phone" id="copy">(095) 420 0 666</span>
                    </div>
                    <ul class="phone-menu">
                        <li class="phone-copy" data-clipboard-target="#copy">Скопировать номер телефона</li>
                        <li><a href="">Написать в Telegram</a></li>
                        <li><a href="">Написать в Viber</a></li>
                    </ul>
                </div>
                <div class="main-logo-wrapper">
                    <?php if ($home == $og_url) { ?>
                    <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/>
                    <?php } else { ?>
                    <a href="<?php echo $home; ?>">
                        <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/>
                    </a>
                    <?php } ?>
                </div>
                <ul class="static-schedule">
                    <li class="schedule-title">Мы работаем:</li>
                    <li class="schedule-time">пн-пт: <strong>с 10 до 18</strong><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><br>сб-вс: <strong>с 10 до 15</strong></li>
                    <li class="schedule-footnote">круглосуточно онлайн!</li>
                </ul>
                <button class="static-callback-btn inline-popup" data-mfp-src="#callback-popup">ОБРАТНЫЙ ЗВОНОК</button>
            </div>
        </div>
    </div>
    <?php }  ?>
    <!--
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div id="logo">
                    <?php if ($logo) { ?>
                    <?php if ($home == $og_url) { ?>
                    <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/>
                    <?php } else { ?>
                    <a href="<?php echo $home; ?>">
                        <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/>
                    </a>
                    <?php } ?>
                    <?php } else { ?>
                    <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                    <?php } ?>
                </div>
                <div class="phone-block__wrapper">
                    <div class="phone-block">
                        <i class="cell-icon"></i>
                        <i class="telegram-icon"></i>
                        <i class="viber-icon"></i>
                        <span class="phone" id="copy">(095) 420 0 666</span>
                    </div>
                    <ul class="phone-menu">
                        <li class="phone-copy" data-clipboard-target="#copy">Скопировать номер телефона</li>
                        <li><a href="">Написать в Telegram</a></li>
                        <li><a href="">Написать в Viber</a></li>
                    </ul>
                </div>
                <div class="working-block__wrapper">
                    <h6>Мы работаем:</h6>
                    <p>пн-пт: <span>с 10 до 18</span> сб-вс: <span>с 10 до 15</span></p>
                    <h6 class="red">круглосуточно онлайн!</h6>
                </div>
            </div>
            <div class="col-sm-5"></div>
        </div>
    </div>
-->
    <nav class="static-middle-menu">
        <div class="container">
            <ul class="shop-menu">
                <li class="shop-menu__item">
                    <a class="shop-menu__link" href="<?php echo $about; ?>">О нас</a>
                    <ul class="shop-submenu">
                        <li class="shop-submenu__item"><a href="">Отзывы о магазине</a></li>
                        <li class="shop-submenu__item"><a href="">Связаться с нами</a></li>
                    </ul>
                </li>
                <li class="shop-menu__item">
                    <a class="shop-menu__link" href="">Вопросы</a>
                </li>
                <li class="shop-menu__item">
                    <a class="shop-menu__link" href="">Доставка и Оплата</a>
                </li>
                <li class="shop-menu__item">
                    <a class="shop-menu__link" href="">наши новости</a>
                    <ul class="shop-submenu">
                        <li class="shop-submenu__item"><a href="">Новости магазина</a></li>
                        <li class="shop-submenu__item"><a href="">Мировые новости</a></li>
                    </ul>
                </li>
            </ul>
            <div class="search-dropdown__wrapper control-group">
                <select class="search-dropdown" placeholder="Все категории"></select>
            </div>
            <?php echo $search; ?>
        </div>
    </nav>
    <?php if($home == $og_url){ ?>
    <nav class="menu-categories static-menu-categories">
        <div class="container">
            <ul class="categories-list row">
                <li class="col-sm-3 cat-item__wrapper">
                    <div class="cat-item">
	    					<span class="cat-item__link" href="">
		    					<img class="cat-pic" src="catalog/view/theme/default/img/seed-icon.png" alt="">
		    					<div class="cat-name__wrapper">
		    						<span class="cat-title">SEED</span>
		    						<p class="cat-subtitle">shop</p>
		    					</div>
	    					</span>
                        <ul class="cat-list">
                            <li><span></span><a href="">Аэропоника</a></li>
                            <li><span></span><a href="">Гидропоника</a></li>
                            <li><span></span><a href="">Autopot</a></li>
                            <li><span></span><a href="">Капельный полив</a></li>
                            <li><span></span><a href="">Bluemat</a></li>
                            <li><span></span><a href="">Прочее</a></li>
                        </ul>
                    </div>
                </li>
                <li class="col-sm-3 cat-item__wrapper">
                    <div class="cat-item">
	    					<span class="cat-item__link" href="">
		    					<img class="cat-pic" src="catalog/view/theme/default/img/hemp-icon.png" alt="">
		    					<div class="cat-name__wrapper">
		    						<span class="cat-title">HEMP</span>
		    						<p class="cat-subtitle">shop</p>
		    					</div>
	    					</span>
                        <ul class="cat-list">
                            <li><span></span><a href="">Аэропоника</a></li>
                            <li><span></span><a href="">Гидропоника</a></li>
                            <li><span></span><a href="">Autopot</a></li>
                            <li><span></span><a href="">Капельный полив</a></li>
                            <li><span></span><a href="">Bluemat</a></li>
                            <li><span></span><a href="">Прочее</a></li>
                        </ul>
                    </div>
                </li>
                <li class="col-sm-3 cat-item__wrapper">
                    <div class="cat-item">
	    					<span class="cat-item__link" href="">
		    					<img class="cat-pic" src="catalog/view/theme/default/img/grow-icon.png" alt="">
		    					<div class="cat-name__wrapper">
		    						<span class="cat-title">GROW</span>
		    						<p class="cat-subtitle">shop</p>
		    					</div>
	    					</span>
                        <ul class="cat-list">
                            <li><span></span><a href="">Аэропоника</a></li>
                            <li><span></span><a href="">Гидропоника</a></li>
                            <li><span></span><a href="">Autopot</a></li>
                            <li><span></span><a href="">Капельный полив</a></li>
                            <li><span></span><a href="">Bluemat</a></li>
                            <li><span></span><a href="">Прочее</a></li>
                        </ul>
                    </div>
                </li>
                <li class="col-sm-3 cat-item__wrapper">
                    <div class="cat-item">
	    					<span class="cat-item__link" href="">
		    					<img class="cat-pic" src="catalog/view/theme/default/img/head-icon.png" alt="">
		    					<div class="cat-name__wrapper">
		    						<span class="cat-title">HEAD</span>
		    						<p class="cat-subtitle">shop</p>
		    					</div>
	    					</span>
                        <ul class="cat-list">
                            <li><span></span><a href="">Аэропоника</a></li>
                            <li><span></span><a href="">Гидропоника</a></li>
                            <li><span></span><a href="">Autopot</a></li>
                            <li><span></span><a href="">Капельный полив</a></li>
                            <li><span></span><a href="">Bluemat</a></li>
                            <li><span></span><a href="">Прочее</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
            <div class="menu-categories__content col-xs-12">
                <ul class="menu-categories__mobile-list">
                    <li class="menu-categories__mobile-list__item"><a href="">БИОСТИМУЛЯТОРЫ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">ЗАЩИТА РАСТЕНИЙ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">КОМПЛЕКТЫ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GHE</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">PLAGRON</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">POWDER FEEDING</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GROWTH TECHNOLOGY</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">CANNA</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">ADVANCED HYDROPONICS</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GUANOKALONG</a></li>
                </ul>
            </div>
            <div class="menu-categories__content col-xs-12">
                <ul class="menu-categories__mobile-list">
                    <li class="menu-categories__mobile-list__item"><a href="">БИОСТИМУЛЯТОРЫ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">ЗАЩИТА РАСТЕНИЙ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">КОМПЛЕКТЫ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GHE</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">PLAGRON</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">POWDER FEEDING</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GROWTH TECHNOLOGY</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">CANNA</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">ADVANCED HYDROPONICS</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GUANOKALONG</a></li>
                </ul>
            </div>
            <div class="menu-categories__content col-xs-12">
                <ul class="menu-categories__mobile-list">
                    <li class="menu-categories__mobile-list__item"><a href="">БИОСТИМУЛЯТОРЫ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">ЗАЩИТА РАСТЕНИЙ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">КОМПЛЕКТЫ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GHE</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">PLAGRON</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">POWDER FEEDING</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GROWTH TECHNOLOGY</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">CANNA</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">ADVANCED HYDROPONICS</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GUANOKALONG</a></li>
                </ul>
            </div>
            <div class="menu-categories__content col-xs-12">
                <ul class="menu-categories__mobile-list">
                    <li class="menu-categories__mobile-list__item"><a href="">БИОСТИМУЛЯТОРЫ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">ЗАЩИТА РАСТЕНИЙ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">КОМПЛЕКТЫ</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GHE</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">PLAGRON</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">POWDER FEEDING</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GROWTH TECHNOLOGY</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">CANNA</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">ADVANCED HYDROPONICS</a></li>
                    <li class="menu-categories__mobile-list__item"><a href="">GUANOKALONG</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <?php } ?>
    <!--
  {*<?php if ($categories) { ?>*}
  {*<div class="container">*}
    {*<nav id="menu" class="navbar">*}
      {*<div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>*}
        {*<button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>*}
      {*</div>*}
      {*<div class="collapse navbar-collapse navbar-ex1-collapse">*}
        {*<ul class="nav navbar-nav">*}
          {*<?php foreach ($categories as $category) { ?>*}
          {*<?php if ($category['children']) { ?>*}
          {*<li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>*}
            {*<div class="dropdown-menu">*}
              {*<div class="dropdown-inner">*}
                {*<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>*}
                {*<ul class="list-unstyled">*}
                  {*<?php foreach ($children as $child) { ?>*}
                  {*<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>*}
                  {*<?php } ?>*}
                {*</ul>*}
                {*<?php } ?>*}
              {*</div>*}
              {*<a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>*}
          {*</li>*}
          {*<?php } else { ?>*}
          {*<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>*}
          {*<?php } ?>*}
          {*<?php } ?>*}
        {*</ul>*}
      {*</div>*}
    {*</nav>*}
  {*</div>*}
  {*<?php } ?>*}
  -->
</header>

