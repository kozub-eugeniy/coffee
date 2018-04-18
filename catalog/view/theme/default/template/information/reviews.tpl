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
            <span class="page-title azure">Отзывы</span>
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
        <section class="section-reviews">
            <ul class="comments-list">
                <li class="comment">
                    <div class="comment-header">
                        <div class="comment-user">
                            <i class="comment-user__icon"></i>
                            <span class="comment-user__name">Виталий</span>
                        </div>
                        <div class="comment-date">2017-12-07 11:16:28</div>
                    </div>
                    <div class="comment-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    </div>
                    <span class="reply-btn">Ответить</span>
                    <div class="reply">
                        <div class="comment-header">
                            <div class="comment-user admin">
                                <i class="comment-user__icon"></i>
                                <span class="comment-user__name">Администрация</span>
                            </div>
                            <div class="comment-date">2017-12-07 11:16:28</div>
                        </div>
                        <div class="comment-text">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </div>
                    </div>
                </li>
                <li class="comment">
                    <div class="comment-header">
                        <div class="comment-user">
                            <i class="comment-user__icon"></i>
                            <span class="comment-user__name">Василий</span>
                        </div>
                        <div class="comment-date">2017-12-07 11:16:28</div>
                    </div>
                    <div class="comment-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    </div>
                </li>
                <li class="comment">
                    <div class="comment-header">
                        <div class="comment-user">
                            <i class="comment-user__icon"></i>
                            <span class="comment-user__name">Марина Ивановна</span>
                        </div>
                        <div class="comment-date">2017-12-07 11:16:28</div>
                    </div>
                    <div class="comment-text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    </div>
                </li>
                <div class="hidden-comments">
                    <li class="comment">
                        <div class="comment-header">
                            <div class="comment-user">
                                <i class="comment-user__icon"></i>
                                <span class="comment-user__name">Василий</span>
                            </div>
                            <div class="comment-date">2017-12-07 11:16:28</div>
                        </div>
                        <div class="comment-text">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </div>
                    </li>
                    <li class="comment">
                        <div class="comment-header">
                            <div class="comment-user">
                                <i class="comment-user__icon"></i>
                                <span class="comment-user__name">Марина Ивановна</span>
                            </div>
                            <div class="comment-date">2017-12-07 11:16:28</div>
                        </div>
                        <div class="comment-text">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </div>
                    </li>
                    <li class="comment">
                        <div class="comment-header">
                            <div class="comment-user">
                                <i class="comment-user__icon"></i>
                                <span class="comment-user__name">Василий</span>
                            </div>
                            <div class="comment-date">2017-12-07 11:16:28</div>
                        </div>
                        <div class="comment-text">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </div>
                    </li>
                    <li class="comment">
                        <div class="comment-header">
                            <div class="comment-user">
                                <i class="comment-user__icon"></i>
                                <span class="comment-user__name">Марина Ивановна</span>
                            </div>
                            <div class="comment-date">2017-12-07 11:16:28</div>
                        </div>
                        <div class="comment-text">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </div>
                    </li>
                </div>
                <span class="show-more-comments">показать еще</span>
            </ul>
            <div class="comment-form__wrapper">
                <span class="product-info__title"><strong>Оставить</strong> отзыв</span>
                <form action="" class="form_check comment-form main-comment-form">
                    <div class="fields-composition">
                        <div class="comment-form__input-wrapper rline">
                            <input type="text" name="name" class="rfield empty_field comment-form__input" placeholder="Имя">
                            <div class="comment-form__login-wrapper">или <a class="comment-form__login-link" href="">авторизируйтесь</a></div>
                        </div>
                        <div class="comment-form__input-wrapper rline">
                            <textarea name="comment" class="rfield empty_field comment-form__text" placeholder="Отзыв"></textarea>
                        </div>
                        <button class="btnsubmit comment-form__btn">ОТПРАВИТЬ</button>
                    </div>
                </form>
            </div>
        </section>
    </div>
</main>
<?php echo $footer; ?>
