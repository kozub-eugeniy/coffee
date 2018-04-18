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
<main class="main-content not-found-content">
    <div class="container-sm">
        <div class="page-title__wrapper">
            <span class="page-title green">Страница не найдена</span>
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
        <div class="not-found-wrapper">
            <div class="not-found-title">Здесь <span>ничего нет</span></div>
            <img class="not-found-pic" src="/img/not-found-pic.png" alt="">
            <span class="not-found-footnote">Но мы поможем вам достать ещё ;)</span>
            <ul class="not-found-categories">
                <li class="not-found-categories__item">
                    <img class="not-found-categories__pic" src="/img/seed-404.png" alt>
                    <a class="not-found-categories__link" href="">SEED<span>shop</span></a>
                </li>
                <li class="not-found-categories__item">
                    <img class="not-found-categories__pic" src="/img/hemp-404.png" alt>
                    <a class="not-found-categories__link" href="">HEMP<span>shop</span></a>
                </li>
                <li class="not-found-categories__item">
                    <img class="not-found-categories__pic" src="/img/grow-404.png" alt>
                    <a class="not-found-categories__link" href="">GROW<span>shop</span></a>
                </li>
                <li class="not-found-categories__item">
                    <img class="not-found-categories__pic" src="/img/head-404.png" alt>
                    <a class="not-found-categories__link" href="">HEAD<span>shop</span></a>
                </li>
            </ul>
        </div>
    </div>
</main>
<?php echo $footer; ?>
