<?php 
  $head_def->setcss($this->style . "/css/checkout_confirm.css");
  $head_def->set_javascript("ajax/jquery.js");
?>
<div class="headingbody"><h1><?php echo $heading_title; ?></h1></div>
<div class="contentBody">
<?php if ($message) { ?>
<div class="message"><?php echo $message; ?></div>
<?php } ?>
<?php if ($error) { ?>
<div class="warning"><?php echo $error; ?></div>
<?php } ?>

<div id="checkout">
  <div class="a">
    <table>
      <tr>
        <td><?php if ($shipping_method) { ?>
          <b><?php echo $text_shipping_method; ?></b><br>
          <?php echo $shipping_method; ?><br>
          <a href="<?php echo $checkout_shipping; ?>"><?php echo $text_change; ?></a><br>
          <br>
          <?php } ?>
          <b><?php echo $text_payment_method; ?></b><br>
          <?php echo $payment_method; ?><br>
          <?php if (!$one_payment_method) { ?><a href="<?php echo $checkout_payment; ?>"><?php echo $text_change; ?></a><?php } ?></td>
        <td><?php if ($shipping_address) { ?>
          <b><?php echo $text_shipping_address; ?></b><br>
          <?php echo $shipping_address; ?><br>
          <a href="<?php echo $checkout_shipping_address; ?>"><?php echo $text_change; ?></a>
          <?php } ?></td>
        <td><b><?php echo $text_payment_address; ?></b><br>
          <?php echo $payment_address; ?><br>
          <a href="<?php echo $checkout_payment_address; ?>"><?php echo $text_change; ?></a></td>
      </tr>
    </table>
  </div>
  <div class="h">
    <table class="cur">
      <tr>
		<th class="left" width="80px"><?php echo $text_currency;?></th>
		<td class="left"><?php echo $currency['code'] . ' - ' . $currency['title'];?></td>
	  </tr>
    </table> 
  </div>  
  <div class="b">
    <table class="c">
      <tr>
        <th class="left"><?php echo $text_product; ?></th>

        <th class="center"><?php echo $text_quantity; ?></th>
        <th class="right"><?php echo $text_price; ?></th>
        <th class="right"><?php echo $text_special; ?></th>
		<?php if($columns == 1.2 || $columns == 2.1 || $columns == 1){?>
		  <th class="right"><?php echo $text_extended; ?></th>
		  <?php if($coupon_sort_order < $discount_sort_order){ ?>
		    <th class="right"><?php echo $text_coupon_value; ?></th>
		    <th class="right"><?php echo $text_discount_value; ?></th>
		  <?php } else { ?>
		    <th class="right"><?php echo $text_discount_value; ?></th>
		    <th class="right"><?php echo $text_coupon_value; ?></th>
		  <?php }?>
		  <th class="right"><?php echo $text_net; ?></th>
		  <th class="right"><?php echo $text_tax_rate; ?></th>
		  <th class="right"><?php echo $text_tax_amount; ?></th>
		<?php }?>
		<th class="right"><?php echo $text_shipping; ?></th>
        <th class="right"><?php echo $text_total; ?></th>
      </tr>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>
          <br>
          &nbsp;<small> - <?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
          <?php } ?>
          <br>
		<?php if ($product['vendor_name']) { ?>
			<span class="vendor"><?php echo $text_soldby; ?><br><?php echo $product['vendor_name']; ?></span>
		<?php } ?>
        </td>
        <td class="center"><?php echo $product['quantity']; ?></td>
        <td class="right"><?php if (!$product['discount']) { ?>
          <?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['price']; ?>
          <?php } else { ?>
          <span class="checkout_price_old "><?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['price']; ?></span><br>
          <span class="checkout_price_new "><?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['discount']; ?></span>
          <?php } ?>
        </td>
		<td class="right"><span class="checkout_price_new ">
		  <?php if ($product['special_price'] > "$0.00"){echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['special_price'];} ?>
		</span></td>
		<?php if($columns == 1.2 || $columns == 2.1 || $columns == 1){?>
		  <td class="right"><?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['total'];?></td>
		  <?php if($coupon_sort_order < $discount_sort_order){ ?>
		    <td class="right"><?php echo ($tax_included && $product['coupon'] ? '<span class="tax">*</span>' : '') . $product['coupon'];?></td>
		    <td class="right"><?php echo ($tax_included && $product['general_discount'] ? '<span class="tax">*</span>' : '') . $product['general_discount'];?></td>
		  <?php } else { ?>
		    <td class="right"><?php echo ($tax_included && $product['general_discount'] ? '<span class="tax">*</span>' : '') . $product['general_discount'];?></td>
		    <td class="right"><?php echo ($tax_included && $product['coupon'] ? '<span class="tax">*</span>' : '') . $product['coupon'];?></td>
		  <?php }?>
		  <td class="right"><?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $product['net'];?></td>
		  <td class="right"><?php echo $product['tax'] . '%';?></td>
		  <td class="right"><?php echo $product['product_tax'];?></td>
		  <td class="right">
		  <?php if ($product['download']) {?><img src="catalog/styles/<?php echo $this->style?>/image/downloadable.png" alt="<?php echo $text_downloadable; ?>" title="<?php echo $text_downloadable; ?>" >
		<?php }else if ($product['shipping']) { ?><img src="catalog/styles/<?php echo $this->style?>/image/shippable.png" alt="<?php echo $text_shippable; ?>" title="<?php echo $text_shippable; ?>" ><?php } else { ?><img src="catalog/styles/<?php echo $this->style?>/image/non_shippable.png" alt="<?php echo $text_non_shippable; ?>" title="<?php echo $text_non_shippable; ?>"><?php  } ?>
		</td>
		  <td class="right"><?php echo '<span class="tax">*</span>' . $product['total_discounted']; ?></td>
		<?php } else {?>
		<td class="right">
		  <?php if ($product['download']) {?><img src="catalog/styles/<?php echo $this->style?>/image/downloadable.png" alt="<?php echo $text_downloadable; ?>" title="<?php echo $text_downloadable; ?>" >
		<?php }else if ($product['shipping']) { ?><img src="catalog/styles/<?php echo $this->style?>/image/shippable.png" alt="<?php echo $text_shippable; ?>" title="<?php echo $text_shippable; ?>" ><?php } else { ?><img src="catalog/styles/<?php echo $this->style?>/image/non_shippable.png" alt="<?php echo $text_non_shippable; ?>" title="<?php echo $text_non_shippable; ?>"><?php  } ?>
		</td>
        <td class="right"><?php echo ($tax_included ? '<span class="tax">* </span>' : '') . $product['total']; ?></td>
		<?php }?>
      </tr>
      <?php } ?>
	  <?php if($columns == 1.2 || $columns == 2.1 || $columns == 1){?>
	  <tr class="ptotals">
	    <th class="left"><?php echo $text_product_totals;?></th>
	    <td colspan="3"></td>
	    <td class="right"><?php echo ($tax_included ? '<span class="tax">* </span>' : '') . $extended_total;?></td>
		<?php if($coupon_sort_order < $discount_sort_order){ ?>
	      <td class="right"><?php echo ($tax_included && $coupon_total ? '<span class="tax">* </span>' : '') . $coupon_total;?></td>
		  <td class="right"><?php echo ($tax_included && $discount_total ? '<span class="tax">* </span>' : '') . $discount_total;?></td>
		<?php } else {?>
		  <td class="right"><?php echo ($tax_included && $discount_total ? '<span class="tax">* </span>' : '') . $discount_total;?></td>
		  <td class="right"><?php echo ($tax_included && $coupon_total ? '<span class="tax">* </span>' : '') . $coupon_total;?></td>
		<?php }?>
	    <td class="right"><?php echo ($tax_included ? '<span class="tax">* </span>' : '') . $net_total;?></td>
		<td></td>
		<td class="right"><?php echo $tax_total;?></td>
		<td></td>
		<td class="right"><?php echo '<span class="tax">*</span>' . $totals_total;?></td>
	  </tr>
	  <?php if(isset($shipping_total)){?>
	    <tr class="stotals">
	      <th class="left"><?php echo $text_shipping_cost;?></th>
	      <td colspan="6"></td>
		  <td class="right"><?php echo ($tax_included ? '<span class="tax">* </span>' : '') . $shipping_net;?></td>
		  <td class="right"><?php echo $shipping_tax_rate;?></td>
		  <td class="right"><?php echo $shipping_tax;?></td>
		  <td></td>
		  <td class="right"><?php echo '<span class="tax">*</span>' . $shipping_total;?></td>
	    </tr>
	    <?php if(isset($freeshipping_total)){?>
		  <tr class="ftotals">
	        <th class="left"><?php echo $text_free_shipping;?></th>
	        <td colspan="6"></td>
		    <td class="right"><?php echo ($tax_included ? '<span class="tax">* </span>' : '') . $freeshipping_net;?></td>
		    <td class="right"><?php echo $shipping_tax_rate;?></td>
		    <td class="right"><?php echo $freeshipping_tax;?></td>
		    <td></td>
		    <td class="right"><?php echo '<span class="tax">*</span>' . $freeshipping_total;?></td>
	      </tr>
		<?php }?>
	  <?php }?>
	  <tr class="ctotals">
	    <th class="left"><?php echo $text_cart_totals;?></th>
		<td colspan="3"></td>
		<td class="right"><?php echo ($tax_included ? '<span class="tax">* </span>' : '') . $extended_total;?></td>
		<?php if($coupon_sort_order < $discount_sort_order){ ?>
	      <td class="right"><?php echo ($tax_included && $coupon_total ? '<span class="tax">* </span>' : '') . $coupon_total;?></td>
		  <td class="right"><?php echo ($tax_included && $discount_total ? '<span class="tax">* </span>' : '') . $discount_total;?></td>
		<?php } else {?>
		  <td class="right"><?php echo ($tax_included && $discount_total ? '<span class="tax">* </span>' : '') . $discount_total;?></td>
		  <td class="right"><?php echo ($tax_included && $coupon_total ? '<span class="tax">* </span>' : '') . $coupon_total;?></td>
		<?php } ?>
		<td class="right"><?php echo ($tax_included ? '<span class="tax">* </span>' : '') . $cart_net_total;?></td>
		<td class="right"></td>
		<td class="right"><?php echo $cart_tax_total;?></td>
		<td class="right"></td>
		<td class="right"><?php echo '<span class="tax">*</span>' . $cart_totals_total;?></td>
	  </tr>
	  <?php } ?>
    </table>
    <br>
    <div class="f">
      <table>
        <?php foreach ($totals as $total) { ?>
        <tr>
          <td class="right" colspan="4"><?php echo ($tax_included ? '<span class="tax">*</span>' : '') . $total['title']; ?></td>
          <td class="totals"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>
      </table>  
    </div>
  </div>
  <div class="g"><?php echo $text_comments; ?></div>
  <div class="h">
<textarea id="comment" name="comment" cols="89" rows="8"><?php echo $comment; ?></textarea>
  </div>
  <div class="e">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <table width="100%">
        <tr>
	<?php if($tax_included){?>
	  <?php echo '<td class="left"><div class="taxE"><span class="tax">* </span>' . $text_tax . '</div></td>';?>
	<?php } ?>
		<?php if($couponproducts){?>
          <td class="right"><?php echo $entry_coupon; ?></td>
          <td class="right" width="1"><input type="text" name="coupon" id="coupon" value="<?php echo $coupon; ?>" class="validate_alpha_num"></td>
          <td class="right" width="1"><input type="submit" value="<?php echo $button_update; ?>"></td>
		<?php } ?>
        </tr>
      </table>
    </form>
  </div>
</div>
<form action="<?php echo $payment_url; ?>" method="post" enctype="<?php echo (isset($payment_form_enctype) && $payment_form_enctype)?$payment_form_enctype:'multipart/form-data'?>">
  <?php if ($fields) { ?>
  <div class="a"><?php echo $fields; ?></div>
  <?php } ?>
  <?php if (isset($agree)) { ?>
  <div class="buttons">
    <table>
	  <?php if($hasnoshipping){?>
	    <tr>
		 <td></td>
		 <td class="rtext"><?php echo $text_warehouse_pickup; ?></td>
		 <td width="5"><input type="checkbox" id="pickup" name="pickup" value="1" class="agreement"></td>
		 <td></td>
	    </tr>
	  <?php }?>
      <tr>
	<td><input type="button" value="<?php echo $button_back; ?>" onclick="location='<?php echo $back; ?>'"></td>
	<td class="rtext"><?php echo $agree; ?></td>
	<td width="5"><input type="checkbox" id="agree" name="agreed" value="1" class="agreement"></td>
	<td width="5"><input type="submit" value="<?php echo $button_continue; ?>" id="submit" disabled="disabled"></td>
      </tr>
    </table>
  </div>
  <?php } else { ?>
  <div class="buttons">
    <table>
      <tr>
        <td align="left"><input type="button" value="<?php echo $button_back; ?>" onclick="location='<?php echo $back; ?>'"></td>
	 <?php if($hasnoshipping){?>
	<td align="right"><?php echo $text_warehouse_pickup; ?></td>
	<td align="right" width="5"><input type="checkbox" id="pickup" name="pickup" value="1" class="agreement"></td>
        <td align="right" width="5"><input type="submit" value="<?php echo $button_continue; ?>" id="submit" disabled="disabled"></td>
	 <?php } else { ?>
        <td align="right"><input type="submit" value="<?php echo $button_continue; ?>"></td>
	 <?php }?>
      </tr>
    </table>
  </div>
  <?php } ?>
</form></div>
<div class="contentBodyBottom"></div>
<script type="text/javascript"><!--
$(".agreement").on("change", function(){
	if ($('.agreement:checked').length == $('.agreement').length) {
		$('#submit').attr('disabled', false);
	} else {
		$('#submit').attr('disabled', true);
	}
});
//--></script>
  <script type="text/javascript"><!--
$("#comment").on("change", function(){
	var Comment = $('#comment').val();
	var data_json = {'Comment':Comment};
	$.ajax({
		type:	'POST',
		url:	'index.php?controller=checkout_confirm&action=comment',
		data: data_json,
		dataType:'json',
	});
});
//--></script>
