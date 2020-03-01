// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(function() {
  //ハンバーガーメニュー（三本線から×マークへ）
  $('.humburger_menu').click(function() {
  $('.bar1, .bar2, .bar3').toggleClass('open');
  })

  //ハンバーガーメニューをクリックしたら横からスライド
  $('.humburger_menu').on('click',function(){
    if($(this).hasClass('active')){
      $(this).removeClass('active');
      $('nav').removeClass('open');
    } else {
      $(this).addClass('active');
      $('nav').addClass('open');
    }
  });
});

$(function(){
  $('.animation').css('visibility','hidden');
  $(window).scroll(function(){
   var windowHeight = jQuery(window).height(),
       topWindow = jQuery(window).scrollTop();
   $('.animation').each(function(){
    var targetPosition = jQuery(this).offset().top;
    if(topWindow > targetPosition - windowHeight + 100){
     $(this).addClass("fadeInDown");
    }
   });
  });
});

//ヘッダースクロールイベント
$(function(){
  var header = $('.humburger_menu_bg')
  header_offset = header.offset();
  header_height = header.height();
  $(window).scroll(function () {
    if($(window).scrollTop() > header_offset.top + header_height) {
      header.addClass('scroll');
    }else {
      header.removeClass('scroll');
    }
  });
});
