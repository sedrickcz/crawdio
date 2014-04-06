jQuery ->
  $('#order_tier_id').change ->
    location.href = "/orders/new?tier=" + $(this).val();
  
  $('#order_country').change ->
    if $(this).val() is 'US'
      $('#states_us').show()
    else
      $('#states_us').val("")
      $('#states_us').hide()