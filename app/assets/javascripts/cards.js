$(document).ready(function () {
  $("#notice, #success").show();
  setTimeout(showNotice, 5000);
  function showNotice() {
    $("#notice:visible, #success:visible").remove();
  }
  $("#notice, #success").click(function() {
    $("#notice, #success").slideUp("fast", function() {
    });
  });
});
