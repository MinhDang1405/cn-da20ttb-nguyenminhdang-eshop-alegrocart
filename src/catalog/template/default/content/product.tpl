<?php 
  $head_def->setcss($this->style . "/css/product.css");
  $head_def->setcss($this->style . "/css/tab.css");
  $head_def->set_javascript("ajax/jquery.js");
  $head_def->set_javascript("ajax/jqueryadd2cart.js");
  $head_def->set_javascript("tab/tab.js");
  $head_def->set_javascript("magnify/ddpowerzoomer.js"); 
  if($image_display == 'thickbox'){
	$head_def->setcss($this->style . "/css/thickbox.css");  
	$head_def->set_javascript("thickbox/thickbox-compressed.js");
  } else if ($image_display == 'fancybox'){
	$head_def->setcss($this->style . "/css/jquery.fancybox.css\" media=\"screen" ); 
	$head_def->set_javascript("fancybox/jquery.fancybox.js");
	} else if ($image_display == 'lightbox'){
    $head_def->setcss($this->style . "/css/lightbox.css\"  media=\"screen" ); 
	$head_def->set_javascript("lightbox/lightbox.js");
  ?>
  <script>
	$(document).ready(function(){
		$(".lightbox").lightbox({
			fitToScreen: true,
			imageClickClose: true
		});
	});
  </script>
  <?php }
  if ($meta_title){
    $head_def->set_MetaTitle($meta_title);
  }
  if ($meta_description){
    $head_def->set_MetaDescription($meta_description);
  }
  if ($meta_keywords){
    $head_def->set_MetaKeywords($meta_keywords);
  }
  $shared_path = 'catalog/template/' . $this->directory . '/shared/';
?>
<div class="headingbody"><h1><?php echo $text_product_detail.$heading_title; ?></h1></div>
<div class="contentBody">
 <div class="product" id="product">
  <?php if($review_status){ ?>
	<div class="rating"><img src="data:image/png;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=" width="112" height="20" data-src="catalog/styles/<?php echo $this->style;?>/image/stars_<?php echo $average_rating . '.png'; ?>" alt="<?php echo $alt_rating; ?>"><span><?php if($maxrow && $maxrow==1) {echo $maxrow.' '.$text_review;} elseif($maxrow && $maxrow>1){echo $maxrow.' '.$text_reviews;} else {echo $text_rateit;} ?></span></div>
  <?php } ?>
  <div class="a" >
   <?php include $shared_path . 'product_image.tpl';?>
  </a>
 </div>
 <div class="pbox">
  <?php if($product['model_number'] || $product_options){?>
    <div class="model_number">
	  <?php echo $text_model_number;?>
	    <span id="<?php echo $this_controller . '_model_' . $product['product_id'];?>"><?php echo $product['model_number'];?></span>
		<?php if($product_options){?>
		  <script language="JavaScript">
			$(document).ready(function(){
			  UpdateModel(<?php echo $product['product_id'] . ',"' . $this_controller . '"';?>);
			});
		  </script>
		  <?php foreach($product_options as $product_option){?>
		    <input type="hidden" id="<?php echo $this_controller . '_model_' . $product_option['product_option'];?>" value="<?php echo $product_option['model_number'];?>">
		  <?php }?>
		<?php }?>
    </div>
  <?php }?>
  <?php if($show_stock || $show_stock_icon){?>
    <div class="ponhand"><?php echo $quantity_available; ?>
      <span <?php if(!$show_stock){echo 'class="hidden" ';}?>id="<?php echo $this_controller . '_stock_level_' . $product['product_id'];?>"><?php echo $stock_level; ?></span>
	<?php if($show_stock_icon){?>
	  <?php if($stock_level > 0 && $stock_level > $low_stock_warning){
		$icon = 'catalog/styles/'.$this->style.'/image/stock_status_g.png';
	  }else if($stock_level > 0 && $stock_level <= $low_stock_warning){
	    $icon = 'catalog/styles/'.$this->style.'/image/stock_status_o.png';
	  } else {
		$icon = 'catalog/styles/'.$this->style.'/image/stock_status_r.png';
	  }?>
	  <?php if($show_stock_icon && $product_options){?>
		<input type="hidden" id="stock_status_g" value="catalog/styles/<?php echo $this->style?>/image/stock_status_g.png">
		<input type="hidden" id="stock_status_o" value="catalog/styles/<?php echo $this->style?>/image/stock_status_o.png">
		<input type="hidden" id="stock_status_r" value="catalog/styles/<?php echo $this->style?>/image/stock_status_r.png">
		<input type="hidden" id="low_stock_warning" value="<?php echo $low_stock_warning;?>">
	  <?php }?>
	  <img id="stock_icon_<?php echo $this_controller. '_' . $product['product_id'];?>" src="data:image/png;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=" data-src="<?php echo $icon;?>" width="11" height="11" alt="<?php echo $text_stock_icon;?>" title="<?php echo $text_stock_icon;?>">
	<?php }?>
	</div>
  <?php }?>
   <?php if(isset($alt_description)){?>
	<div class="adesc"><?php echo $alt_description; ?></div>
   <?php }?>
  <div class="shipping">
    <?php if ($shipping) { ?><img src="catalog/styles/<?php echo $this->style?>/image/shippable.png" alt="<?php echo $text_shippable; ?>" title="<?php echo $text_shippable; ?>" ><?php } elseif(!$downloads) { ?><img src="catalog/styles/<?php echo $this->style?>/image/non_shippable.png" alt="<?php echo $text_non_shippable; ?>" title="<?php echo $text_non_shippable; ?>"><?php  } ?>
	<?php if ($downloads) { ?><img src="catalog/styles/<?php echo $this->style?>/image/downloadable.png" alt="<?php echo $text_downloadable; ?>" title="<?php echo $text_downloadable; ?>" >
	<span><?php echo $text_downloadable;?></span>
	<?php }?>
<?php if ($shipping_time) { ?><div><?php echo $text_shipping_time;?></div><?php }?>
  </div>
   <?php if (!$product_options) { ?>
  <input type="hidden" id="<?php echo $this_controller . '_cart_level_' . $product['product_id'];?>" name="<?php echo $this_controller . '_cart_level_' . $product['product_id'];?>" value="<?php echo ($product['cart_level'] ? $product['cart_level'] : 0); ?>">
   <?php } ?>
  <?php if($product_options){?>
    <script language="JavaScript">
	  $(document).ready(function(){
	    UpdateQuantity(<?php echo $product['product_id'] . ',"' . $this_controller . '"';?>);
	    UpdateAddToCartButton(<?php echo $product['product_id'] . ',"' . $this_controller . '","' . $Added_to_Cart . '","' . $Add_to_Cart . '"';?>);
	    UpdateAddToCart(<?php echo $product['product_id'] . ',"' . $this_controller . '"';?>);
	  });
	</script>
	<?php foreach($product_options as $product_option){?>
	  <input type="hidden" id="<?php echo $this_controller . '_stock_level_' . $product_option['product_option'];?>" value="<?php echo $product_option['quantity'];?>">
	  <input type="hidden" id="<?php echo $this_controller . '_cart_level_' . $product_option['product_option'];?>" name="<?php echo $this_controller . '_cart_level_' . $product_option['product_option'];?>" value="<?php echo ($product_option['cart_level'] ? $product_option['cart_level'] : 0); ?>">
	<?php }?>
  <?php }?>  
   <?php include $shared_path . 'product_price.tpl' ;?>
  <?php if ($product['options']){
   if(isset($product_options_select) && $product_options_select == 'radio'){
     include $shared_path . 'product_options_radio.tpl';
   } else {
	 include $shared_path . 'product_options.tpl';
  }} ?>
	<?php if ($product['vendor_name']) { ?>
		<div class="vendor"><?php echo $text_soldby; ?><?php echo $product['vendor_name']; ?></div>
	<?php } ?>
   <?php if ($product_addtocart) { ?>
     <table>
      <tr>
	   <td class="a2c">
		<?php include $shared_path . 'add_to_cart.tpl';?>
	   </td>
      </tr>
     </table>
   <?php } ?>
  <?php if($social){ ?>
    <div class="addthis">
	<script src="//platform.linkedin.com/in.js" type="text/javascript"> lang: en_US</script>
	<script type="IN/Share" data-url="<?php echo $current_product ?>" data-counter="right"></script>
	<a class="twitter-share-button" href="https://twitter.com/intent/tweet" data-url="<?php echo $current_product ?>" data-size="default">Tweet</a> 
	<script> window.twttr = (function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0], t = window.twttr || {};
	if (d.getElementById(id)) return t;
	js = d.createElement(s); js.id = id;
	js.src = "https://platform.twitter.com/widgets.js";
	fjs.parentNode.insertBefore(js, fjs);
	t._e = []; t.ready = function(f) {t._e.push(f);}; return t;
	}(document, "script", "twitter-wjs"));</script>
	<div class="fb-share-button" data-href="<?php echo $current_product ?>" data-layout="button_count"></div>
    </div>
  <?php } ?>
 </div>
</div>
 <div class="clearfix"></div>
<div class="box">
  <?php if($review_status){
      if($maxrow){
		$Review_tabs = "<a><div class=\"tab_text\"><h2>".$tab_reviews."(".$maxrow.")"."</h2></div></a>";
	  } else {
		$Review_tabs = "<a><div class=\"tab_text\"><h2>".$tab_write."</h2></div></a>";
	  }
	}
	if($technical){
	$Technical_tabs = "<a><div class=\"tab_text\"><h2>" . $tab_technical . "</h2></div></a>";}
  ?>
<div class="tab" id="tab">
  <div class="tabs"><a><div class="tab_text"><h2><?php echo $tab_description; ?></h2></div></a>
    <?php if (isset($Technical_tabs)){ echo $Technical_tabs;} ?>
    <?php if(count($images)){?>
	<a><div class="tab_text"><h2><?php echo $tab_images."(".count($images).")"; ?></h2></div></a>
	<?php }?>
	<a><div class="tab_text"><h2><?php echo $tab_information; ?></h2></div></a>
	<?php if (isset($Review_tabs)){ echo $Review_tabs;} ?></div>
  <div class="pages">
    <div class="page">
	  <div class="pad">
	    <div>
		  <?php echo $description; ?>
		</div>
	  </div>
	</div>
	<?php if (isset($Technical_tabs)) { ?>
	<div class="page">
      <div class="pad">
	    <div>
		  <?php echo $technical; ?>
		</div>
	  </div>
	</div>	
	<?php } ?>
	<?php if(count($images)){?>
	<div class="page">
      <div class="pad">  
        <?php if ($images) { ?>
          <?php foreach ($images as $image) { ?>
            <?php include $shared_path . 'additional_images.tpl' ;?>
          <?php } ?>
        <?php } ?>
			  <div class="clearfix"></div>
      </div>
    </div>
	<?php }?>
	<div class="page">
	  <div class="pad">
		<?php if ($product['min_qty'] >= '1') { ?>
		<?php echo '<b>' . $text_min_qty . '</b>'; ?><?php echo $product['min_qty']; ?><br>
		<?php } ?>
		<?php if ($product['max_qty'] <> '0') { ?>
		<?php echo '<b>' . $text_max_qty . '</b>'; ?><?php echo $product['max_qty']; ?><br>
		<?php } ?>
		<?php if ($product['multiple'] <> '0') { ?>
		<?php echo '<b>' . $text_multiple . '</b>'; ?><?php echo $product['multiple']; ?><br>
		<?php } ?>
		<br><?php echo '<b>' . $text_tax_rate . '</b>' . $tax_rate;?><br>
		<?php if (isset($product_discounts)){ ?><br>
		  <?php echo "<b>".$text_quantity_discount."</b><br>"; ?>
		  <?php if($discount_options && $product_options){?>
		    <script language="JavaScript">
			  $(document).ready(function(){
				UpdateDiscounts(<?php echo "'" . $this_controller . "'," . $product['product_id'] . ",". $decimal_place . ",'" . $decimal_point . "'";?>,0);
			  });
			</script>
			<input id="<?php echo $this_controller.'_discounts_'.$product['product_id'];?>" type="hidden" value="<?php echo count($product_discounts);?>">
		  <?php }?>
		  <?php foreach ($product_discounts as $key => $product_discount){ ?>
		    <?php echo "&nbsp;&nbsp;".$text_qty_discount.$product_discount['discount_quantity']."&nbsp;&nbsp;".$text_discount.$symbol_left.'<span id="'. $this_controller.'_discount_'.$product['product_id'].'_'.$key.'">'.$product_discount['discount_amount']."</span>" .$symbol_right."&nbsp;&nbsp; (".'<span id="'. $this_controller.'_percent_'.$product['product_id'].'_'.$key.'">'.$product_discount['discount_percent']."</span>%)"; ?><br>
		  <?php } ?>
		<?php } ?>
		<?php if (($product['special_price'] > '$0.00' ) && date('Y-m-d') >= $product['sale_start_date'] && date('Y-m-d') <= $product['sale_end_date']) { ?><br>	
		  <?php echo "<b>".$text_date."</b><br>"; ?>
		  <?php echo "&nbsp;&nbsp;".$text_sale_start.$sale_start; ?><br>
          <?php echo "&nbsp;&nbsp;".$text_sale_end.$sale_end; ?><br>
		<?php } ?>
		<?php if($downloads){?>
		  <?php echo '<br>' . $text_product_download;?>
		<?php }?>
		<?php if($fdownloads && $freedownload){?>
		  <?php echo '<br>' . '<b>'. $text_free_downloads . '</b>';?>
		<?php foreach ($fdownloads as $fdownload) { ?>
		<div class="freedl">
		 <a href="<?php echo $fdownload['href']; ?>"><?php echo $fdownload['name']; ?>&nbsp(<?php echo $fdownload['size']; ?>)</a><br>
		</div>
		<?php } ?>
	      <?php }?>
		<?php if (isset($manufacturer)) { ?><br>
		  <?php echo '<b>' . $text_manufacturer . '</b>' ?>
				 <a href="<?php echo $manufacturer['href']; ?>" class="url"><?php echo $manufacturer['name']; ?></a>
		<br>
		<?php } ?>
		<?php if ($weight) { ?><br>
		  <?php echo '<b>' . $text_weight . '</b>' . ' '; ?>
		  <span id="<?php echo $this_controller . '_weights_' . $product['product_id'];?>"><?php echo $weight;?></span>
		  <?php echo ' ' . $weight_unit;?>
		  <?php if($option_weights){?>
		    <input type="hidden" id="weight_<?php echo $product['product_id'];?>" value="<?php echo number_format((float)str_replace($decimal_point,'.',$weight),4,'.','');?>">
			<script language="JavaScript">
			  $(document).ready(function(){
			    UpdateWeight(<?php echo $weight_decimal . ",'" . $decimal_point . "',". $product['product_id'] . ",'" . $this_controller . "'";?>);
			  });
			</script>
		    <?php foreach($option_weights as $option_weight){?>
			  <input type="hidden" id="<?php echo $this_controller . '_weight_' . $option_weight['product_to_option_id'];?>" value="<?php echo number_format((float)str_replace($decimal_point,'.',$option_weight['option_weight']),4,'.','');?>">
			<?php }?>
		  <?php }?>
		 <?php } ?>
		<?php if ($dimensions || $product_options) { ?><br>
		  <span id="<?php echo $this_controller . '_dimensions_' . $product['product_id'];?>"><?php echo $dimensions ? @$dimensions : ''; ?></span><br>
		  <?php if($product_options){?>
		    <input type="hidden" id="dimension_<?php echo $product['product_id'];?>" value="<?php echo $dimensions;?>">
		    <script language="JavaScript">
			  $(document).ready(function(){
			    UpdateDimensions(<?php echo $product['product_id'] . ',"' . $this_controller . '"';?>);
			  });
			</script>
			<?php foreach($product_options as $product_option){?>
			  <input type="hidden" id="<?php echo $this_controller . '_dimension_' . $product_option['product_option'];?>" value="<?php echo $product_option['dimensions'];?>">
			<?php }?>
		  <?php }?>
		<?php } ?>
		<?php if(($product['barcode'] || $product_options)){?>
		  <div class="barcode">
		    <span <?php if(!$product['barcode']){ echo 'class="hidden" ';}?>id="<?php echo $this_controller . '_barcode_text_' . $product['product_id'];?>"><?php echo $text_barcode; ?></span>
		    <span <?php if(!$product['barcode']){ echo 'class="hidden" ';}?>id="<?php echo $this_controller . '_barcode_' . $product['product_id'];?>"><?php echo $product['barcode']; ?></span>
			<img <?php if(!$product['barcode']){ echo 'classs="hidden" ';}?>id="barcode_<?php echo $this_controller. '_' . $product['product_id'];?>" src="data:image/png;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=" data-src="<?php echo $product['barcode_url'];?>" alt="<?php echo $text_barcode_img;?>" title="<?php echo $text_barcode_img;?>">
		    <?php if($product_options){?>
			  <script language="JavaScript">
			    $(document).ready(function(){
			      UpdateBarcode(<?php echo $product['product_id'] . ',"' . $this_controller . '"';?>);
			    });
			  </script>
			  <?php foreach($product_options as $product_option){?>
			    <input type="hidden" id="<?php echo $this_controller . '_barcode_' . $product_option['product_option'];?>" value="<?php echo $product_option['barcode'];?>">
				<input type="hidden" id="<?php echo $this_controller . '_barcode_url_' . $product_option['product_option'];?>" value="<?php echo $product_option['barcode_url'];?>">
			  <?php }?>
			<?php }?>
		  </div>
		  <div class="clearfix"></div>
		<?php }?>
		<?php if ($shipping) { ?><br>
		  <?php echo '<br><b>' . $text_shipping_yes . '</b>'; } elseif(!$downloads) { echo '<br><br><b>' . $text_shipping_no. '</b>'; ?> <br>
		<?php  } ?>
	  </div>
	</div>
	<div class="page">
      <div class="pad">
	    <?php if(!$maxrow){ echo $text_error; } ?>
		<div class= "rtab" id="rtab">
		  <div class="rtabs">
		  <?php $i=1; while($i <= $maxrow){ echo "<a> ".$i." </a>";$i++;} ?>
		  </div>		  
		  <div class="rpages">
	        <?php foreach ($review_data as $review) { ?>
		    <div class="rpage">
			  <div class="rpad">
				<div class="review">
				  <div class="a">
			        <div class="b"><a href="<?php echo $review['href']; ?>" ><?php //echo $review['name']; ?></a><br>
			          <b><?php echo $text_review_by; ?></b><?php echo $review['author']; ?></div><br>
			        <div class="c"><b><?php echo $text_date_added; ?></b> <?php echo $review['date_added']; ?></div><br>
			        <table>
				      <tr>
				        <td colspan="2"><?php echo $review['text']; ?></td>
				      </tr>
				      <?php for ($i=1; $i<5; $i++) { ?>
				      <tr>
				        <td><br><b><?php echo ${'text_rating'.$i}; ?></b></td><td><img src="catalog/styles/<?php echo $this->style?>/image/stars_<?php echo $review['rating'.$i] . '.png'; ?>" alt="<?php echo $review['out_of'.$i]; ?>" class="png">&nbsp;(<?php echo $review['out_of'.$i]; ?>)</td>
				      </tr>
				      <?php } ?>
			        </table>
			      </div>
		        </div>
		      </div>
	        </div>
			<?php } ?>
		  </div>
	    </div>
	    <?php if($review_status){?>
		<div class="review_write"><br><a href="<?php echo $write; ?>"><img src="data:image/png;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=" data-src="catalog/styles/<?php echo $this->style?>/image/write.png" alt="<?php echo $text_write_short; ?>"></a><br><br>
		<a href="<?php echo $write; ?>"><?php echo $text_write; ?></a></div>
	    <?php } ?>
	  </div>
    </div>
  </div>
</div>
</div></div>
<div class="contentBodyBottom"></div>
<div>
<div class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      <?php } ?>
</div>
</div>
	<script type="text/javascript"><!--
      tabview_initialize('tab')
    //--></script>
	  <script type="text/javascript"><!--
	  rtabview_initialize('rtab');
    //--></script>
