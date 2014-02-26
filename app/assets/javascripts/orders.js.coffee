jQuery ->
  $('#order_tier_id').change ->
    location.href = "/orders/new?tier=" + $(this).val();
  