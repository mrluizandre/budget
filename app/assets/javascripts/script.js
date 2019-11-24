$(document).on('turbolinks:load', function (){
  $( ".datepicker" ).datepicker();

  $('.select2').select2();

  $('.slideToggle').hide();
} );

function goalSlideToggle(event){
  $(event.target).next().slideToggle();
}