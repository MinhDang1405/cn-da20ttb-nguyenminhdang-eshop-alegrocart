<?php
// Heading
$_['heading_title']		= 'Sản phẩm';
$_['heading_form_title']	= 'Sản phẩm:';
$_['heading_description']	= 'Bạn có thể chỉnh sửa sản phẩm của mình tại đây.';

// Text
$_['text_message']         = 'Thành công: Bạn đã cập nhật sản phẩm!';
$_['text_plus']            = '+';
$_['text_minus']           = '-';
$_['text_model']	   = 'Nhập tên Mẫu mới';
$_['text_model_select']	   = 'hoặc chọn từ cơ sở dữ liệu mô hình hiện có';
$_['select_model']         = 'Chọn mẫu';
$_['text_unique']          = 'Tên mặt hàng hoặc sản phẩm phải là duy nhất';
$_['text_linear']          = 'Tuyến tính: Chiều dài, chiều rộng, chiều cao';
$_['text_area']            = 'Diện tích: Dài X Rộng';
$_['text_volume']          = 'Thể tích: Lít,';
$_['text_no_dimensions']   = 'Không có kích thước nào cho <b> %s </b>';
$_['text_no_dim']          = 'None';
$_['text_dimension_ship']  = 'Chiều dài, chiều rộng, chiều cao là tùy chọn, được sử dụng để tính toán vận chuyển khi áp dụng hình khối';
$_['text_options']         = 'Tùy chọn: ';
$_['text_quantity_options']= 'Thêm số lượng trong tab Tùy chọn sản phẩm';
$_['text_barcode_options'] = 'Thêm mã vạch trong tab Tùy chọn sản phẩm';
$_['text_model_options']   = 'Thêm số mẫu trong tab Tùy chọn sản phẩm';
$_['text_option_info']     = '<b>Thông tin quan trọng!</b>';
$_['text_option_explantion'] = 'Trước khi nhập Số lượng và thông tin sản phẩm:tùy chọn khác, trước tiên bạn nên tạo tất cả sản phẩm của mình theo tùy chọn. <br>Sản phẩm có 1 bộ lựa chọn sẽ có các mục như<br> 2:10 - 2:11 - 2:12<br>Với 2 tùy chọn thì các mục sẽ như thế<br> 2:10.13 - 2:11.13 - 2:12.13 - 2:10.14 - 2:11.14 - 2:12.14<br>Như bạn có thể thấy, bộ sản phẩm đầu tiên cho các mục tùy chọn sẽ không còn tồn tại<br>Nếu bạn tạo một bộ tùy chọn và sau đó quyết định tạo tùy chọn thứ hai, tất cả dữ liệu cụ thể về sản phẩm:tùy chọn của bạn sẽ bị mất.<br>';
$_['text_folder_help']    = '<b>Biểu tượng danh sách</b> bên dưới là cổng để thêm hoặc cập nhật tùy chọn sản phẩm.<br>Bạn có thể thêm, xóa hoặc thay đổi tùy chọn sản phẩm cho từng sản phẩm.<br>Biểu tượng có 3 ngôi sao màu đỏ cho biết sản phẩm có options.<br>Nhấp vào biểu tượng để chỉnh sửa các tùy chọn cho sản phẩm đã chọn.';
$_['text_featured_help']  = 'F - Sản phẩm nổi bật<br>S - Sản phẩm có giá đặc biệt<br>R - Sản phẩm liên quan<br>pD - Yêu cầu thanh toán Sản phẩm có thể tải xuống<br>fD - Sản phẩm có thể tải xuống miễn phí';
$_['text_barcode_explanation'] = 'Nếu bạn nhập mã vạch mà không có chữ số kiểm tra cuối cùng, mã vạch sẽ được tính tự động.<br>Chữ số kiểm tra là một chữ số tổng kiểm tra duy nhất được tính từ 11 chữ số mã vạch (UPC) hoặc 12 (EAN-13/ISBN) đầu tiên.';
$_['text_barcode_enc_explanation'] = 'Mã sản phẩm chung (UPC) bao gồm 12 chữ số (11 dữ liệu và 1 chữ số kiểm tra).<br>Mã vạch EAN-13/ISBN là tiêu chuẩn mã vạch gồm 13 chữ số (12 dữ liệu và 1 chữ số kiểm tra).';
$_['text_upc']            = 'UPC';
$_['text_ean']            = 'EAN-13/ISBN';
$_['text_technical_name'] = 'Tùy chọn - Tên thay thế cho Tab Kỹ thuật.';

// Column
$_['column_options']       = 'Tùy chọn!';
$_['column_name']          = 'Tên tùy chọn';
$_['column_price']         = 'Giá'; 
$_['column_dated_special'] = 'Ngày<br>Đặc biệt'; 
$_['column_stock']         = 'Hàng tồn kho'; 
$_['column_weight']        = 'Trọng lượng';
$_['column_weight_class']  = 'Trọng lượng<br>Hạng';
$_['column_image']         = 'Hình ảnh';
$_['column_model']         = 'Mô hình';
$_['column_featured']      = 'Chuyên môn';
$_['column_sort_order']    = 'Sắp xếp<br>Thứ tự';
$_['column_status']        = 'Trạng thái';
$_['column_action']        = 'Thực hiện';

// Entry
$_['entry_name']           = 'Tên sản phẩm (Số mặt hàng):';
$_['entry_description']    = 'Miêu tả:';
$_['entry_model']          = 'Mô hìn:';
$_['entry_model_number']   = 'Số mô hình:';
$_['entry_model_numbers']   = 'Số mô hình';
$_['entry_manufacturer']   = 'nhà chế tạo:';
$_['entry_vendor']         = 'Người bán:';
$_['entry_shipping']       = 'Sản phẩm có thể vận chuyển:';
$_['entry_shipping_time']	= 'Thời gian vận chuyển:';
$_['entry_date_available'] = 'Ngày bắt đầu có thể:';
$_['entry_quantity']       = 'Số lượng còn hàng:';
$_['entry_barcode']        = 'Chữ số mã vạch:';
$_['entry_barcode_encoding'] = 'Mã hóa mã vạch:';
$_['entry_discount']       = 'Số tiền chiết khấu %s';
$_['entry_status']         = 'Trạng thái sản phẩm:';
$_['entry_sort_order']     = 'Thứ tự sắp xếp:';
$_['entry_tax_class']      = 'Loại thế:';
$_['entry_price']          = 'Giá cơ sở:';
$_['entry_weight_class']   = 'Hạng cân:';
$_['entry_weight']         = 'Trọng lượng sản phẩm:';
$_['entry_dimension_class']= 'Loại kích thước:';
$_['entry_dimension']      = 'Kích thước mặc định:';
$_['entry_length']         = 'Chiều dài:';
$_['entry_width']          = 'Chiều rộng:';
$_['entry_height']         = 'Chiều cao:';
$_['entry_area']           = 'Diện tích:';
$_['entry_volume']         = 'Thể tích:';
$_['entry_prefix']         = 'Tiếp đầu ngữ:';
$_['entry_image']          = 'Hình ảnh:';
$_['entry_images']         = 'Hình ảnh bổ sung:';
$_['entry_download']       = 'Tải xuống yêu cầu thanh toán:';
$_['entry_free_download']  = 'Tải xuống miễn phí:';
$_['entry_category']       = 'Thể loại:';
$_['entry_min_qty']        = 'Số lượng đặt hàng tối thiểu:';
$_['entry_max_qty']        = 'Số lượng đặt hàng tối đa:';
$_['entry_multiple']       = 'Bán nhiều:';
$_['entry_dated_special']  = 'Giá đặc biệt ngày  %s '; // New
$_['entry_start_date']     = 'Ngày bắt đầu:'; // New
$_['entry_end_date']       = 'Ngày kết thúc:'; // New
$_['entry_remaining']      = 'Hiển thị số ngày còn lại:'; // New
$_['entry_alt_description']= 'Mô tả ngắn thay thế:<br><br><br>Sử dụng <b>SHIFT->ENTER</b> cho<br>nguồn cấp dữ liệu dòng hoặc các dòng trống<br>để giãn cách.<br>ENTER chỉ tạo<br>Đoạn Thẻ đã bị loại bỏ<br>.'; // New
$_['entry_technical']      = 'Thông số kỹ thuật Mô tả:'; // New
$_['entry_technical_name'] = 'Tên tab kỹ thuật:';
$_['entry_meta_title']     = 'Tiêu đề meta:'; // New
$_['entry_meta_description']	= 'Mô tả Meta:'; // New
$_['entry_meta_keywords']	= 'Từ khóa meta:'; // New
$_['entry_regular_price']	= 'Giá cả phải chăng %s '; //New
$_['entry_percent_discount']	= 'Tỷ lệ chiết khấu% '; // New
$_['entry_quantity_discount']	= '<br>Chiết khấu phần trăm là cơ sở để tính toán chiết khấu theo số lượng.<br>Số tiền bằng đô la chỉ mang tính tham khảo, dựa trên giá bán thông thường.<br>Có thể tạo phần trăm chiết khấu mới bằng cách nhập số tiền bằng đô la.<br>Nếu có Ngày Giá đặc biệt đang có hiệu lực, khoản giảm giá sẽ được tính theo giá đặc biệt ngày đó.';
$_['entry_product_option']	= 'Tùy chọn sản phẩm';
$_['entry_po_quantity']		= 'số lượng trong kho';
$_['entry_po_barcode']		= 'Chữ số mã vạch';
$_['entry_po_barcode_encoding']	= 'Mã hóa mã vạch';
// Button
$_['button_add']		= 'Thêm';
$_['button_remove']		= 'Xoá';

// Tab
$_['tab_general']		= 'Mô tả<br>Tên sản phẩm';
$_['tab_product_options']	= 'Sản phẩm<br>Tùy chọn';
$_['tab_dated_special']		= 'Ngày<br>Đặc biệt';
$_['tab_alt_description']	= 'Mô tả<br>thay thế';
$_['tab_download']		= 'Sản phẩm<br>Tải xuống';
$_['tab_discount']		= 'Số lượng<br>Giảm giá';
$_['tab_category']		= 'Danh mục<br>Loại sản phẩm';
$_['tab_image']			= 'Hình ảnh sản phẩm<br>Hình ảnh bổ sung';
$_['tab_data']			= 'Chi tiết thông tin<br>sản phẩm';

//Explanation
$_['explanation_multiselect_img']	= 'Để chọn/bỏ chọn nhiều hình ảnh, hãy nhấn và giữ &lt;Ctrl&gt; trong khi bạn đang nhấp chuột.';
$_['explanation_multiselect_cat']	= 'Để chọn/bỏ chọn nhiều danh mục, hãy nhấn và giữ &lt;Ctrl&gt; trong khi bạn đang nhấp chuột.';
$_['explanation_multiselect_pr']	= 'Để chọn/bỏ chọn nhiều sản phẩm, hãy nhấn và giữ &lt;Ctrl&gt; trong khi bạn đang nhấp chuột.';
$_['explanation_min_qty']		= 'Khách hàng không thể đặt hàng ít hơn số lượng này.';
$_['explanation_max_qty']		= 'Khách hàng không thể đặt hàng nhiều hơn số lượng này. Mặc định 0 có nghĩa là nó sẽ không được xem xét.';
$_['explanation_multiple']		= 'Nếu được đặt thành ví dụ: 2 khách hàng có thể đặt hàng 2,4,6, v.v. Mặc định 0 có nghĩa là sẽ không được xem xét.';
$_['explanation_shipping_time']		= 'Số ngày hoặc khoảng ngày đơn hàng sẵn sàng rời khỏi kho của bạn. Có thể giải quyết nếu sản phẩm có thể vận chuyển được. Nhập cùng một số vào cả hai ô để đặt ngày.';
$_['explanation_description']	= 'Mẹo để nâng cao khả năng hiển thị mô tả sản phẩm.<br><b>Cột đơn: </b> Kết thúc mỗi dòng văn bản bằng &lt;br /&gt; Thẻ (<b>SHIFT ENTER</b>). Các thẻ này được sử dụng để xác định số dòng sẽ hiển thị như được đặt trong cài đặt hoặc mô-đun cụ thể.<br><b>2 cột trở lên: </b> Tốt nhất nên có các mục trong mô tả thay thế sẽ được sử dụng cho các mục này các định dạng nếu có. Cố gắng giới hạn mỗi dòng ở 30 ký tự và kết thúc bằng &lt;br /&gt; tag.<br>ENTER chỉ tạo ra các thẻ đoạn văn bị loại bỏ.
Để biết thêm thông tin chi tiết, hãy truy cập http://forum.alegrocart.com/viewtopic.php?f=22&t=47';

// Error
$_['error_permission']			= 'Cảnh báo: Bạn không có quyền sửa đổi sản phẩm';
$_['error_name']			= '* Tên sản phẩm phải có từ 1 đến 64 ký tự!';
$_['error_date_available']		= '* Ngày có sẵn không hợp lệ!';
$_['error_start_date']			= '* Ngày bắt đầu không hợp lệ!'; // New
$_['error_end_date']			= '* Ngày kết thúc không hợp lệ!'; // New
$_['error_already_exists']		= '* LỖI - Tên sản phẩm này đã tồn tại *';
$_['error_duplicate_name']		= '*LỖI - Bạn đã có một sản phẩm khác có tên này*';
$_['error_ean']				= 'Mã vạch EAN-13/ISBN phải có 12 hoặc 13 chữ số!'; // New
$_['error_upc']				= 'Mã vạch UPC phải có 11 hoặc 12 chữ số!'; // New
$_['error_barcode_already_exists']	= '* LỖI - Mã vạch này đã tồn tại *';
$_['error_duplicate_barcode']		= '* LỖI - MÃ VẠCH SAO CHÉP *';
$_['error_orphans']			= 'Cảnh báo! Các sản phẩm sau không được xếp vào bất kỳ danh mục hoặc danh mục phụ nào:';
$_['error_multiple']			= '* Nhiều phải nhỏ hơn hoặc bằng Số lượng đặt hàng tối đa!';
$_['error_max_qty']			= '* Số lượng đặt hàng tối đa phải lớn hơn hoặc bằng Số lượng đặt hàng tối thiểu!';
?>
