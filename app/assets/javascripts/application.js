// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery-ui
// require jquery.ui.touch-punch.min
// require jquery.ui.sortable
// require jquery-ui/sortable
// require cocoon
//= require autocomplete-rails
//= require typehead.js.js
//= require twitter/bootstrap
//= require jquery.turbolinks
//= require jquery_ujs
// require turbolinks
//= require select2
//= require select2_locale_ja
//= require rails-sweetalert2-confirm
//= require_tree .
//= require_self
//= require moment
//= require moment/ja
//= require pickers
//= require jquery.datetimepicker

//cocoonは２行追加になるので（どこかで宣言されている？）現在削除している。

//$(document).on('turbolinks:load', function(){
//    $("input.datepicker").datepicker();
//});

// 日本語化対応用
//$.datetimepicker.setLocale('ja');
///jQuery.datetimepicker.setLocale('ja');

// datetimepickerクラスにdatetimepickerを適用する。
//$('.datetimepicker').datetimepicker(
//jQuery('.datetimepicker').datetimepicker(
//   {timepicker:false}
//)//;

//{format: 'YYYY/mm/DD'
        

//var data = 'yy-mm-dd';
//$(function(){
//	$('.date-picker').datepicker(
//    {dateFormat: data,
//     minDate: 0}
//    );
//});

//var data = {'data-format': 'yyyy-MM-dd' };
$(function(){
  //$.datetimepicker.setLocale('ja');
  $('.datetimepicker').datetimepicker(
//jQuery('.datetimepicker').datetimepicker(
   {
      timepicker:false,
      closeOnDateSelect:true,
      format: 'Y/m/d',
      lang: 'ja'
   }
  );
});


//var data = {'data-format': 'yyyy-MM-dd' };
//$(function(){
//    $('.datepicker').attr(data);
//    $('.datepicker').datetimepicker({format: 'yyyy-MM-dd'});
////    //$('.datepicker').datetimepicker({format: 'YYYY-mm/DD'});
////    $('.datepicker').datetimepicker({pickTime: true, format: 'YYYY/mm/DD'});
////    
//});
