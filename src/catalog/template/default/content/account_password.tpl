<?php 
  $head_def->setcss($this->style . "/css/account_password.css");
?>
<div class="headingbody"><h1><?php echo $heading_title; ?></h1></div>
<div class="contentBody">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
  
  <div id="password">
    <div class="a"><?php echo $text_password; ?></div>
    <div class="b">
      <table> 
        <tr>
          <td width="150"><span class="required">*</span> <?php echo $entry_password; ?></td>
          <td><input type="password" name="password" value="<?php echo $password; ?>">
            <?php if ($error_password) { ?>
            <span class="error"><?php echo $error_password; ?></span>
            <?php } ?>
          </td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_confirm; ?></td>
          <td><input type="password" name="confirm" value="<?php echo $confirm; ?>">
            <?php if ($error_confirm) { ?>
            <span class="error"><?php echo $error_confirm; ?></span>
            <?php } ?></td>
        </tr>
      </table>
    </div>
  </div></div>
  <div class="contentBodyBottom"></div>
  <div class="buttons">
    <table>
      <tr>
        <td class="left"><input type="button" value="<?php echo $button_back; ?>" onclick="location='<?php echo $back; ?>'"></td>
        <td class="right"><input type="submit" value="<?php echo $button_continue; ?>"></td>
      </tr>
    </table>
  <input type="hidden" name="account_validation" value="<?php echo $account_validation;?>">
  </div>
</form>
