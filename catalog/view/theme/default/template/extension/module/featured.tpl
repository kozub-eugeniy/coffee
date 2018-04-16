
  <div class="container">
    <span class="hits-title recommend"><?php echo $heading_title; ?></span>
    <div class="row hits-slider__wrapper">
      <a class="hits-link recommend" href="">все хиты</a>
      <div class="hits-slider">
        <?php foreach ($products as $product) { ?>
        <div class="col-sm-3">
          <div class="item">
            <span class="item-label"></span>
            <div class="item-pic__wrapper">
              <img class="item-pic" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
            </div>
            <div class="item-title__wrapper"><a class="item-title" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <div class="item-price-wrapper">
              <?php if ($product['price']) { ?>
              <?php if (!$product['special']) { ?>
              <div class="hidden-price"><?php echo $product['special']; ?></div>
              <div class="item-price"><?php echo $product['price']; ?></div>
              <?php } else { ?>
              <div class="item-price"><?php echo $product['price']; ?></div>
              <?php } ?>
              <?php } ?>
            </div>
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
    </div>
  </div>
<!--
<h3><?php echo $heading_title; ?></h3>
<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <p><?php echo $product['description']; ?></p>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" ><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
-->