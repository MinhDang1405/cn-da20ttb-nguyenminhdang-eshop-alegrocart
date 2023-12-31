<?php 
  $head_def->setcss($this->style . "/css/cart.css");
  if(isset($tax_included)){
    $head_def->set_javascript("ajax/jquery.js");
    $head_def->set_javascript("ajax/tooltip.js");
  }
?>
<div class="headingbody"><h1><?php echo $heading_title; ?></h1></div>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
  <div class="contentBody">
  <?php if ($message) { ?>
	<div class="message"><?php if(isset($message)){ echo $message;} ?></div>
  <?php } ?>
  <?php if ($error) { ?>
  <div class="warning"><?php echo $error; ?></div>
  <?php } ?>
  <?php if ($error_min) { ?>
  <div class="warning"><?php echo $error_min; ?></div>
  <?php } ?>
  <?php if ($error_max) { ?>
  <div class="warning"><?php echo $error_max; ?></div>
  <?php } ?>
  <?php if ($error_multiple) { ?>
  <div class="warning"><?php echo $error_multiple; ?></div>
  <?php } ?>
  <div id="cart">
    <table class="a">
      <tr>
        <th class="b"><?php echo $column_remove; ?></th>
        <th class="c"><?php echo $column_image; ?></th>
        <th class="d"><?php echo $column_name; ?></th>
        <th class="f"><?php echo $column_min_qty; ?></th>
        <th class="f"><?php echo $column_quantity; ?></th>
  <?php if ($max_qty_column) { ?>
        <th class="f"><?php echo $column_max_qty; ?></th>
  <?php } ?>
        <th class="g"><?php echo $column_price; ?></th>
        <th class="e"><?php echo $column_special; ?></th>
		<?php if($columns == 1.2 || $columns == 2.1 || $columns == 1){?>
		  <th class="e"><?php echo $column_extended; ?></th>
		  <?php if($coupon_sort_order < $discount_sort_order){ ?>
			<th class="e"><?php echo $column_coupon_value; ?></th>
			<th class="e"><?php echo $column_discount_value; ?></th>
		  <?php } else { ?>
			<th class="e"><?php echo $column_discount_value; ?></th>
			<th class="e"><?php echo $column_coupon_value; ?></th>
		  <?php }?>
		<?php }?>
		<th class="s"><?php echo $text_shipping; ?></th>
        <th class="g"><?php echo $column_total; ?></th>
      </tr>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="h"><input type="checkbox" name="remove[<?php echo $product['key']; ?>]"></td>
        <td class="i"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a></td>
        <td class="j"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php if (!$product['stock'] && $stock_check) { ?>
          <span><?php echo $text_stock_ind ?></span>
          <?php } ?>
          <?php if ($product['min_qty_error'] == '1') { ?>
          <span><?php echo !$product['stock'] && $stock_check ? ', '.$text_min_qty_ind : $text_min_qty_ind; ?></span>
          <?php } ?>
          <?php if ($product['max_qty_error'] == '1') { ?>
          <span><?php echo !$product['stock'] && $stock_check ? ', '.$text_max_qty_ind : $text_max_qty_ind; ?></span>
          <?php } ?>
          <?php if ($product['multiple_qty_error'] == '1') { ?>
          <span><?php echo (!$product['stock'] && $stock_check) || $product['min_qty_error'] == '1' || $product['max_qty_error'] == '1' ? ', '. $text_multiple_qty_ind : $text_multiple_qty_ind; ?></span>
          <?php } ?>
          <div>
            <?php foreach ($product['option'] as $option) { ?>
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br>
            <?php } ?>
		<?php if ($product['vendor_name']) { ?>
			<div class="vendor"><?php echo $text_soldby; ?><br><?php echo $product['vendor_name']; ?></div>
		<?php } ?>
          </div></td>
        <td class="l"><?php echo $product['min_qty']; ?></td>
        <td class="l">
          <input type="text" name="quantity[<?php echo $product['key']; ?>]" id="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="3" class="validate_int">
          <input type="hidden" name="min_qty[<?php echo $product['key']; ?>]" value="<?php echo $product['min_qty']; ?>">
          <input type="hidden" name="max_qty[<?php echo $product['key']; ?>]" value="<?php echo $product['max_qty']; ?>">
          <input type="hidden" name="multiple[<?php echo $product['key']; ?>]" value="<?php echo $product['multiple']; ?>">
        </td>
        <?php if ($max_qty_column) { ?>
        <td class="l"><?php if ($product['max_qty'] > 0) {echo $product['max_qty'];} ?></td>
        <?php } ?>
        <td class="m"><?php if (!$product['discount']) { ?>
          <?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['price']; ?>
          <?php } else { ?>
          <span class="cartprice_old"><?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['price']; ?></span><br>
          <span class="cartprice_new"><?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['discount']; ?></span>
          <?php } ?></td>
        <td class="k"><?php if ($product['special_price'] > "$0.00"){echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['special_price'];} ?></td>
		<?php if($columns == 1.2 || $columns == 2.1 || $columns == 1){?>
		  <td class="m"><?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['total']; ?></td>
		  <?php if($coupon_sort_order < $discount_sort_order){ ?>
			<td class="m"><?php echo ($tax_included && $product['coupon'] ? '<span class="tax">*</span>' : '') . $product['coupon']; ?></td>
			<td class="m"><?php echo ($tax_included && $product['general_discount'] ? '<span class="tax">*</span>' : '') . $product['general_discount']; ?></td>
		  <?php } else { ?>
			<td class="m"><?php echo ($tax_included && $product['general_discount'] ? '<span class="tax">*</span>' : '') . $product['general_discount']; ?></td>
			<td class="m"><?php echo ($tax_included && $product['coupon'] ? '<span class="tax">*</span>' : '') . $product['coupon']; ?></td>
		  <?php }?>
		<?php } ?>
		<td class="l">
		<?php if ($product['download']) {?><img src="catalog/styles/<?php echo $this->style?>/image/downloadable.png" alt="<?php echo $text_downloadable; ?>" title="<?php echo $text_downloadable; ?>" >
		<?php }else if ($product['shipping']) { ?><img src="catalog/styles/<?php echo $this->style?>/image/shippable.png" alt="<?php echo $text_shippable; ?>" title="<?php echo $text_shippable; ?>" ><?php } else { ?><img src="catalog/styles/<?php echo $this->style?>/image/non_shippable.png" alt="<?php echo $text_non_shippable; ?>" title="<?php echo $text_non_shippable; ?>"><?php  } ?>
		</td>
        <td class="m"><?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['total_discounted']; ?></td>
      </tr>
      <?php } ?>
	  <?php if($columns == 1.2 || $columns == 2.1 || $columns == 1){?>
	  <tr class="totals">
	    <th class="t" colspan="<?php echo ($max_qty_column) ? 8 : 7 ?>"><?php echo $text_product_totals;?></th>
	    <td class="m"><?php echo ($tax_included ? '<span class="tax">* </span>' : '') . $extended_total;?></td>
		
		<?php if($coupon_sort_order < $discount_sort_order){ ?>
	      <td class="m"><?php echo ($tax_included && $coupon_total ? '<span class="tax">* </span>' : '') . $coupon_total;?></td>
		  <td class="m"><?php echo ($tax_included && $discount_total ? '<span class="tax">* </span>' : '') . $discount_total;?></td>
		<?php } else {?>
		  <td class="m"><?php echo ($tax_included && $discount_total ? '<span class="tax">* </span>' : '') . $discount_total;?></td>
		  <td class="m"><?php echo ($tax_included && $coupon_total ? '<span class="tax">* </span>' : '') . $coupon_total;?></td>
		<?php }?>
		  <td class="m"></td>
		  <td class="m"><?php echo ($tax_included && $coupon_total ? '<span class="tax">* </span>' : '') . $subtotal;?></td>
	  </tr>
	  <?php }?>
    </table>
	<?php if ($has_shipping && $estimated_shipping_status && !$islogged) { ?>
    <div class="u">
    <table>
	<tr>
           <th colspan="2"><?php echo $text_estimate ; ?></th>
        </tr>
	<tr>
          <td><?php echo $entry_country; ?></td>
          <td><select name="country_id" onchange="$('#zone').load('index.php?controller=account_create&amp;action=zone&amp;country_id='+this.value+'&amp;zone_id=<?php echo $zone_id; ?>');">
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" SELECTED><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_zone; ?></td>
          <td id="zone">
		    <select name="zone_id"><option disabled></option>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_postcode; ?></td>
          <td><input size="10" type="text" name="postcode" id="postcode" value="<?php echo $postcode; ?>" class="validate_alpha_num"></td>
        </tr>
      </table>
    </div>
    <div class="buttons">
      <table>
        <tr>
        <td class="left" class="buttons"><input type="button" id="calculate" value="<?php echo $button_calculate; ?>" ></td>
        </tr>
      </table>
    </div>
    <div id="estimated_results"></div>
	<?php }?>
    <div class="n">
      <table>
	<?php if($tax_included){?>
	  <tr>
	  <td></td>  
	  <td><?php echo $text_net_total;?></td>
	  <td><?php echo $net_total; ?></td>
	  <?php } ?>
        <?php foreach ($totals as $total) { ?>
		<?php if($total['title']!=':'){?>
        <tr>
	  <td></td> 
          <td><?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $total['title']; ?></td>
          <td><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>
        <?php } ?>
      </table>
    </div>
	<table width="100%">
	<tr>
           <td><span <?php echo isset($text_shortfall) ? 'class="tax"' : ''; ?>><?php echo $minov_status ? $text_min_order_value.$minov_value.'! ' : ''; ?><?php echo isset($text_shortfall) ? $text_shortfall : ''; ?></span></td>
        </tr></table>
	<?php if ($discount_status) {?>
	  <table width="100%">
	    <tr>
		  <?php if(isset($text_discount_lprice)){?>
		    <td><?php echo $text_discount_lprice;?></td>
		  <?php }?>
	    </tr>
	    <tr>
		  <?php if(isset($text_discount_gprice)){?>
		    <td><?php echo $text_discount_gprice;?></td>
		  <?php }?>
		</tr>
	  </table>
	<?php }?>
	  <table width="100%">
	<tr>
          <td><?php echo $text_cart_weight; ?><?php echo $weight; ?></td>
        </tr>
        <tr>
		<?php if($tax_included){?>
		  <script type="text/javascript">
			$(document).ready(function(){
	          $('.taxE[title]').tooltip({
              offset: [160,-70], tipClass: 'tooltip_white'});
	        });
          </script>
		  <?php echo '<td class="left"><div title="' . $text_tax_explantion  . '" class="taxE" ><span class="tax">* </span>' . $text_tax . '</div></td>';?>
		  <?php } else {?>
		  <td></td>
		  <?php }?>
		<?php if($couponproducts){?>
          <td class="right"><?php echo $entry_coupon; ?></td>
          <td class="right" width="1"><input type="text" name="coupon" id="coupon" value="<?php echo $coupon; ?>" class="validate_alpha_num"></td>
		  <?php } else {?>
		  <td></td>
		  <?php }?>
        </tr>
      </table>
  </div>
  <div class="buttons">
    <table>
      <tr>
        <td class="left"><input type="submit" value="<?php echo $button_update; ?>"></td>
        <td class="center"><input type="button" value="<?php echo $button_shopping; ?>" onclick="<?php echo $continue; ?>"></td>
        <td class="right"><input type="button" value="<?php echo $button_checkout; ?>" onclick="location='<?php echo $checkout; ?>'"></td>
      </tr>
    </table>
  </div>
  </div>
  <div class="contentBodyBottom"></div>
  <input type="hidden" name="task" value="update">
</form>
<script type="text/javascript"><!--
$('#zone').load('index.php?controller=cart&action=zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
//--></script>
  <script type="text/javascript"><!--
$("#calculate").on("click", function(){
	var Country_id = $('select[name=country_id] option:selected').val();
	var Zone_id = $('select[name=zone_id] option:selected').val();
	var PostCode = $('#postcode').val();
	var data_json = {'Country_id':Country_id, 'Zone_id':Zone_id, 'PostCode':PostCode};
	$.ajax({
		type:	'POST',
		url:	'index.php?controller=cart&action=estimate',
		data: data_json,
		dataType:'json',
		beforeSend: function (data) {
			$(".calc_error").remove();
			$("#calculate").prop('disabled',true);
			$('#calculate').after('<img src="catalog/styles/<?php echo $this->style; ?>/image/working.gif" alt="" id="working">');
		},
		success: function (data) {
			if (data.status === true) {
				$('#estimated_results').html(data.html);
			} else {
				$('<div class="warning calc_error"><?php echo $error_calc_response; ?></div>').insertBefore("#cart");
				$("#calculate").prop('disabled',false);
			}
		},
		error: function (data) {
			$('<div class="warning calc_error"><?php echo $error_calc_request; ?></div>').insertBefore("#cart");
		},
		complete: function() {
			$("#calculate").prop('disabled',false);
			$('#working').remove();
		}
	});
});
//--></script>
