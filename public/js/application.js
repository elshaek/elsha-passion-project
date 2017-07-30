$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()



  /*eventListener();*/
});


// function eventListener() {
//   $('form').on('click', 'button', function(e) {
//     e.prevenDefault();

//     var form = $(this).closest('form')

//     var request = $.ajax({
//       method: form.attr('method'),
//       url: form.attr('action'),
//       data: form.serialize()
//     });

//     request.done(function(response) {

//     });

//     request.done(function() {
//       alert('Failed to perform action');
//     })
//   });
// };