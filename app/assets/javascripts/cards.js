$(document).ready(function () {
  $("#notice").show();
  setTimeout(showNotice, 5000);
  function showNotice(){
      $("#notice:visible").remove();
  }
  $( "#notice" ).click(function() {
    $( "#notice" ).slideUp( "fast", function() {
      // Animation complete.
    });
  });
});
