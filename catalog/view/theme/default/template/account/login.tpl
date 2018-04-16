<?php echo $header; ?>
<?php if ($success) { ?>
<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<main class="main-content">
    <div class="container-sm">
        <div class="page-title__wrapper">
            <span class="page-title azure">Панель клиента</span>
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
        <div class="authorization-wrapper">
            <nav class="log-reg__tabs">
                <ul class="log-reg__list">
                    <li class="log-reg__list-item active"><i></i><span>Авторизация</span></li>
                    <li class="log-reg__list-item"><i></i><span>Регистрация</span></li>
                </ul>
                <div class="log-reg__content active">
                    <form action="<?php echo $action; ?>" method="post" class="form_check login-form auth-form" enctype="multipart/form-data">
                        <div class="fields-composition">
                            <div class="login-form-input__wrapper rline">
                                <input type="email" name="email" class="rfield empty_field mailfield login-form-input" placeholder="E-Mail">
                            </div>
                            <div class="login-form-input__wrapper rline">
                                <input type="text" name="password" class="rfield empty_field passfield login-form-input" placeholder="Пароль">
                                <span class="show-pass-btn"></span>
                            </div>
                            <div class="login-form-input__wrapper rline">
                                <div class="login-form__link-wrapper">Нет аккаунта?
                                    <span class="login-form__link">Зарегистрируйтесь</span>
                                </div>
                            </div>
                            <div class="login-form-input__wrapper rline">
                                <button type="submit" class="btnsubmit login-form-btn">Войти</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="log-reg__content">
                    <form action="<?php echo $register; ?>" method="post" class="form_check login-form reg-form">
                        <div class="fields-composition">
                            <div class="login-form-input__wrapper rline">
                                <input type="phone" name="phone" class="rfield empty_field phonefield login-form-input"
                                       placeholder="Телефон (в формате +380ХХХХХХХХХ)">
                            </div>
                            <div class="login-form-input__wrapper rline">
                                <input type="email" name="email" class="rfield empty_field mailfield login-form-input"
                                       placeholder="E-Mail">
                            </div>
                            <div class="login-form-input__wrapper rline">
                                <input type="text" name="firstname" class="rfield empty_field login-form-input"
                                       placeholder="Имя, фамилия">
                            </div>
                            <div class="login-form-input__wrapper rline">
                                <input type="text" name="password" class="rfield empty_field passfield login-form-input"
                                       placeholder="Пароль">
                                <span class="show-pass-btn"></span>
                            </div>
                            <div class="login-form-input__wrapper rline">
                                <input type="text" name="confirm" class="rfield empty_field passfield login-form-input"
                                       placeholder="Повторите пароль">
                                <span class="show-pass-btn"></span>
                            </div>
                            <div class="login-form-input__wrapper rline">
                                <input type="hidden" name="agree" value="1">
                                <button class="btnsubmit login-form-btn login-form-btn__reg">Регистрация</button>
                            </div>
                        </div>
                    </form>
                </div>

            </nav>
        </div>
    </div>
</main>
<!--
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
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
        <div class="col-sm-6">
          <div class="well">
            <h2><?php echo $text_new_customer; ?></h2>
            <p><strong><?php echo $text_register; ?></strong></p>
            <p><?php echo $text_register_account; ?></p>
            <a href="<?php echo $register; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
        </div>
        <div class="col-sm-6">
          <div class="well">
            <h2><?php echo $text_returning_customer; ?></h2>
            <p><strong><?php echo $text_i_am_returning_customer; ?></strong></p>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
          </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
-->
<?php echo $footer; ?>