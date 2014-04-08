# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#user_country').change ->
    if $(this).val() is 'US'
      $('#states_us').show()
    else
      $('#states_us').val("")
      $('#states_us').hide()
      
  $("body").animate
    scrollTop: 1000
  , "fast"

  if $('#user_country').val() is 'US'
    $('#states_us').show()
  else
    $('#states_us').val("")
    $('#states_us').hide()

 
