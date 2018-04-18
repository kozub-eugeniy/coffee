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
    <div class="container-sm">
        <div class="page-title__wrapper">
            <span class="page-title yellow">В Грузии разрешили употреблять марихуану в целях развития демократии</span>
            <span class="page-title__bg">
					<span>н</span><span>а</span><span>ш</span><span>и</span><span>&nbsp;</span><span>н</span><span>о</span><span>в</span><span>о</span><span>с</span><span>т</span><span>и</span>
				</span>
        </div>
    </div>
    <section class="section-blog-unit">
        <div class="container-sm">
            <div class="blog-unit__wrapper">
                <div class="blog-unit__pic-wrapper">
                    <img class="blog-unit__pic" src="catalog/view/theme/default/img/news/1.jpg" alt="">
                    <div class="blog-unit__date">2017-12-07 11:16:28</div>
                </div>
                <div class="blog-unit__text">
                    <p>Конституционный суд Грузии признал незаконным уголовное наказание за употребление марихуаны и конопли. Таким образом, суд удовлетворил иск оппозиционной партии «Гирчи», требовавшей декриминализации легких наркотиков, сказано на сайте суда.
                    </p><p>
                        Как говорится в сообщении, «истец в своем иске пояснил, что употребление марихуаны возможно как в медицинских целях, так и с целью развлечения, что право человека самостоятельно... выбирать форму разгрузки и отдыха защищено от вмешательства».
                    </p><p>
                        Одновременно сообщается, что ответчик — парламент Грузии — не смог предоставить доказательства того, что употребление марихуаны и конопли провоцирует людей на совершение общественно опасных деяний или употребление более тяжелых наркотиков. Конституционный суд Грузии признал незаконным уголовное наказание за употребление марихуаны и конопли. Таким образом, суд удовлетворил иск оппозиционной партии «Гирчи», требовавшей декриминализации легких наркотиков, сказано на сайте суда.
                    </p><p>
                        Как говорится в сообщении, «истец в своем иске пояснил, что употребление марихуаны возможно как в медицинских целях, так и с целью развлечения, что право человека самостоятельно... выбирать форму разгрузки и отдыха защищено от вмешательства».
                    </p><p>
                        Одновременно сообщается, что ответчик — парламент Грузии — не смог предоставить доказательства того, что употребление марихуаны и конопли провоцирует людей на совершение общественно опасных деяний или употребление более тяжелых наркотиков.</p>
                </div>
                <div class="blog-unit__footer">
                    <nav class="blog-unit__navigation">
                        <a class="blog-unit__prev" href="">Вернуться назад</a>
                        <a class="blog-unit__next" href="">Следующая новость</a>
                    </nav>
                    <div class="share42init"></div>
                </div>
            </div>
        </div>
    </section>
</main>
<?php echo $footer; ?>