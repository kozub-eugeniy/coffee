<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<li class="comment">
    <div class="comment-header">
        <div class="comment-user">
            <i class="comment-user__icon"></i>
            <span class="comment-user__name"><?php echo $review['author']; ?></span>
        </div>
        <div class="comment-date"><?php echo $review['date_added']; ?></div>
    </div>
    <div class="comment-text"><?php echo $review['text']; ?></div>
    <div class="reply">
        <div class="comment-header">
            <div class="comment-user admin">
                <i class="comment-user__icon"></i>
                <span class="comment-user__name">Администрация</span>
            </div>
            <div class="comment-date"><?php echo $review['date_added']; ?></div>
        </div>
        <div class="comment-text">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
            dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
            ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
            fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
            deserunt mollit anim id est laborum.
        </div>
    </div>
</li>
<!--<table class="table table-striped table-bordered">
  <tr>
    <td style="width: 50%;"><strong><?php echo $review['author']; ?></strong></td>
    <td class="text-right"><?php echo $review['date_added']; ?></td>
  </tr>
  <tr>
    <td colspan="2"><p><?php echo $review['text']; ?></p>
      <?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($review['rating'] < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } ?>
      <?php } ?></td>
  </tr>
</table>-->
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
