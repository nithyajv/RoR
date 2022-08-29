// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"

$(document).ready(function() {
  $("#tasklist_user_id").change(function (e){
      e.preventDefault();
      $.ajax({
          type: 'POST',
          url: $('.edit_tasklist').attr('action'),
          data: $('.edit_tasklist').serialize(),
          dataType: 'JSON'
      }).done(function (data) {
          alert("Task assigned to user");
      }).fail(function (data) {
          alert(e);
      });
  });
});