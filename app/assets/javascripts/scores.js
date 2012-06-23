$(document).ready(function() {
  if ($('#pending').length > 0) {
    setTimeout(function() {
      location.reload(true);
    }, 15000);
  }
});

