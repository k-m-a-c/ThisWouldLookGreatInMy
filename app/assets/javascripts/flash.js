$(document).ready(function() {
  var flash = $("div#flash_notice");
  flash.delay(5000).fadeOut('fast');
  flash.on('click', function() {
    flash.clearQueue();
    flash.fadeOut('fast');
  });
});