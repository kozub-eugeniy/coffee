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
            <span class="page-title azure">Контакты</span>
            <span class="page-title__bg">coffeeshop.ua</span>
            <span class="page-title__bg-mobile">
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
        <div class="contacts-block-wrapper">
            <div class="contacts-block">
                <div class="contacts-inner">
                    <div class="contacts-schedule">
                        <span class="contacts-block__title">Мы работаем</span>
                        <ul class="contacts-schedule__time">
                            <li class="contacts-schedule__time-row">пн-пт: <strong>с 10 до 18</strong></li>
                            <li class="contacts-schedule__time-row">сб-вс: <strong>с 10 до 15</strong></li>
                        </ul>
                        <span class="contacts-schedule__footnote">Круглосуточно онлайн!</span>
                    </div>
                    <div class="contacts-main">
                        <span class="contacts-block__title">Наши контакты</span>
                        <ul class="contacts-main__list">
                            <li class="contacts-main__list-item">
                                <i class="contacts-icon phone"></i>
                                <a href="tel:(095) 420 0 666">(095) 420 0 666</a>
                            </li>
                            <li class="contacts-main__list-item">
                                <i class="contacts-icon telegram"></i>
                                <a href="tel:(095) 420 0 666">(095) 420 0 666</a>
                            </li>
                            <li class="contacts-main__list-item">
                                <i class="contacts-icon viber"></i>
                                <a href="tel:(095) 420 0 666">(095) 420 0 666</a>
                            </li>
                            <li class="contacts-main__list-item">
                                <i class="contacts-icon skype"></i>
                                <a href="live:kh.coffeeshop.ua">live:kh.coffeeshop.ua</a>
                            </li>
                            <li class="contacts-main__list-item">
                                <i class="contacts-icon mail"></i>
                                <a href="mailto:kh.coffeeshop.ua@gmail.com">kh.coffeeshop.ua@gmail.com</a>
                            </li>
                        </ul>
                    </div>
                    <div class="contacts-form__wrapper">
                        <span class="contacts-block__title">Напишите нам</span>
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form_check contacts-form">
                            <div class="fields-composition">
                                <div class="contacts-input__wrapper rline">
                                    <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="rfield empty_field contacts-input" placeholder="Имя"/>
                                    <?php if ($error_name) { ?>
                                        <div class="text-danger"><?php echo $error_name; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="contacts-input__wrapper rline">
                                    <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="rfield empty_field mailfield contacts-input" placeholder="E-Mail"/>
                                    <?php if ($error_email) { ?>
                                    <div class="text-danger"><?php echo $error_email; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="contacts-input__wrapper rline">
                                    <textarea name="enquiry" rows="10" id="input-enquiry" class="rfield empty_field contacts-text" placeholder="Сообщение"><?php echo $enquiry; ?></textarea>
                                    <?php if ($error_enquiry) { ?>
                                        <div class="text-danger"><?php echo $error_enquiry; ?></div>
                                    <?php } ?>
                                </div>
                                <div class="contacts-input__wrapper rline">
                                    <button class="btnsubmit contacts-btn" type="submit" value="<?php echo $button_submit; ?>">ОТПРАВИТЬ</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="section-map-contacts">
        <div class="container">
            <div class="map-wrapper">
                <div class="map-mask mask-contacts"></div>
                <div class="map-title map-title-contacts">Мы находимся</div>
                <div class="map" id="map"></div>
            </div>
        </div>
    </section>
</main>
<!--
<div class="container">
    <div class="row">
        <div id="content" class="<?php echo $class; ?>">
            <?php echo $content_top; ?>
            <h1><?php echo $heading_title; ?></h1>
            <h3><?php echo $text_location; ?></h3>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <?php if ($image) { ?>
                        <div class="col-sm-3"><img src="<?php echo $image; ?>" alt="<?php echo $store; ?>"
                                                   title="<?php echo $store; ?>" class="img-thumbnail"/></div>
                        <?php } ?>
                        <div class="col-sm-3"><strong><?php echo $store; ?></strong><br/>
                            <address>
                                <?php echo $address; ?>
                            </address>
                            <?php if ($geocode) { ?>
                            <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15"
                               target="_blank" class="btn btn-info"><i
                                        class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                            <?php } ?>
                        </div>
                        <div class="col-sm-3"><strong><?php echo $text_telephone; ?></strong><br>
                            <?php echo $telephone; ?><br/>
                            <br/>
                            <?php if ($fax) { ?>
                            <strong><?php echo $text_fax; ?></strong><br>
                            <?php echo $fax; ?>
                            <?php } ?>
                        </div>
                        <div class="col-sm-3">
                            <?php if ($open) { ?>
                            <strong><?php echo $text_open; ?></strong><br/>
                            <?php echo $open; ?><br/>
                            <br/>
                            <?php } ?>
                            <?php if ($comment) { ?>
                            <strong><?php echo $text_comment; ?></strong><br/>
                            <?php echo $comment; ?>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php if ($locations) { ?>
            <h3><?php echo $text_store; ?></h3>
            <div class="panel-group" id="accordion">
                <?php foreach ($locations as $location) { ?>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>"
                                                   class="accordion-toggle" data-toggle="collapse"
                                                   data-parent="#accordion"><?php echo $location['name']; ?> <i
                                        class="fa fa-caret-down"></i></a></h4>
                    </div>
                    <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
                        <div class="panel-body">
                            <div class="row">
                                <?php if ($location['image']) { ?>
                                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>"
                                                           alt="<?php echo $location['name']; ?>"
                                                           title="<?php echo $location['name']; ?>"
                                                           class="img-thumbnail"/></div>
                                <?php } ?>
                                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br/>
                                    <address>
                                        <?php echo $location['address']; ?>
                                    </address>
                                    <?php if ($location['geocode']) { ?>
                                    <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15"
                                       target="_blank" class="btn btn-info"><i
                                                class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                                    <?php } ?>
                                </div>
                                <div class="col-sm-3"><strong><?php echo $text_telephone; ?></strong><br>
                                    <?php echo $location['telephone']; ?><br/>
                                    <br/>
                                    <?php if ($location['fax']) { ?>
                                    <strong><?php echo $text_fax; ?></strong><br>
                                    <?php echo $location['fax']; ?>
                                    <?php } ?>
                                </div>
                                <div class="col-sm-3">
                                    <?php if ($location['open']) { ?>
                                    <strong><?php echo $text_open; ?></strong><br/>
                                    <?php echo $location['open']; ?><br/>
                                    <br/>
                                    <?php } ?>
                                    <?php if ($location['comment']) { ?>
                                    <strong><?php echo $text_comment; ?></strong><br/>
                                    <?php echo $location['comment']; ?>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
            <?php } ?>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                <fieldset>
                    <legend><?php echo $text_contact; ?></legend>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="name" value="<?php echo $name; ?>" id="input-name"
                                   class="form-control"/>
                            <?php if ($error_name) { ?>
                            <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="email" value="<?php echo $email; ?>" id="input-email"
                                   class="form-control"/>
                            <?php if ($error_email) { ?>
                            <div class="text-danger"><?php echo $error_email; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                        <div class="col-sm-10">
                            <textarea name="enquiry" rows="10" id="input-enquiry"
                                      class="form-control"><?php echo $enquiry; ?></textarea>
                            <?php if ($error_enquiry) { ?>
                            <div class="text-danger"><?php echo $error_enquiry; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <?php echo $captcha; ?>
                </fieldset>
                <div class="buttons">
                    <div class="pull-right">
                        <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>"/>
                    </div>
                </div>
            </form>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
-->
<?php echo $footer; ?>
