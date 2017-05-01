result_organization_views = ()->
  return $(".search-organization-result")

result_nursery_views = ()->
  return $(".search-nursery-result")

get_currency = (str)->
  return str.trim().slice(0,1) if typeof str == "string"

currency_to_number = (str)->
  return str.trim().slice(1).replace(",","")

quantities = ()->
  return $("tbody tr .quantity")

quantity_values = ()->
  return $("tbody tr .quantity-value")

prices = ()->
  return $("tbody tr .price")

charges = ()->
  return $("tbody tr .charge")

total = ()->
  return $("#total_charge")

rows = ()->
  return $("tbody tr").length - 3 #last line is sum's line

tax_rate = ()->
  return parseFloat($("#tax_rate").val())

tax = ()->
  return $("#tax_consumption")

estimation_elements = ()->
  return {"quantities": quantities(), "prices": prices(), "charges": charges(), "length": rows()}

calc = (elem, n)->
  quantity = elem["quantities"][n]
  price = elem["prices"][n]
  charge = elem["charges"][n]

  if !quantity
    value_charge = 0
  else
    value_quantity = parseInt(quantity.value)
    value_price = parseInt(currency_to_number(price.value))
    value_charge = value_quantity * value_price

    currency_sign = get_currency(price.value)
    charge.value = currency_sign + value_charge.toLocaleString()
  return value_charge

update_estimation = ()->
  coupon = $("#coupon_attached").val()
  qtys = quantities()
  qtys_values = quantity_values()

  qtys.each((index) ->
    qtys_values[index].value = qtys[index].value
  )

  if coupon == "1" || coupon == "attached"
    qtys[1].value = qtys[0].value

    is_order = $("#new_order")
    if is_order.length == 0
      quantities()[1].disabled = true
    else
      $.each( quantities(), (index, elem)->
        elem.value = "1"
        elem.disabled = true
      )

  sum = 0
  elems = estimation_elements()
  value_rows = elems["length"]
  results = []
  results.push calc(elems, n) for n in [0..value_rows]

  sum = 0
  sum_tax = 0
  aggregate = (n)->
    rate = tax_rate()
    sum_tax = sum_tax + (n * rate)
    sum = sum + n
  aggregate(n) for n in results


  tax_line = tax()
  currency_sign = get_currency(tax_line.val())
  tax_line.val(currency_sign + sum_tax.toLocaleString())

  sum = sum + sum_tax
  total_line = total()
  total_line.val(currency_sign + sum.toLocaleString())

search_result_reflect = (target_inputs, values_to_reflect, attribute_name) ->
  $.each(values_to_reflect, (key, value) ->
    target_input = $.grep(target_inputs, (element, index)->
      elem_keys = element.id.split("_")
      size = elem_keys.length
      if key == "postal_code"
        return "code" == elem_keys[size-1] && "postal" == elem_keys[size-2] && "attributes" == elem_keys[size-3] && "nursery" == elem_keys[size-4]
      else if key == "dm_number"
        return "number" == elem_keys[size-1] && "dm" == elem_keys[size-2] && "attributes" == elem_keys[size-3] && "nursery" == elem_keys[size-4]
      else
        return key == elem_keys[size-1] && "attributes" == elem_keys[size-2] && attribute_name == elem_keys[size-3]
    )
    target_input[0].value = values_to_reflect[key] if target_input.length > 0
  )

$(document).on 'ready turbolinks:load', ->
  update_estimation()
  $(".estimation-search-message-container").hide()
  $(".customer-search-message-container").hide()

  $("#_automate_nursery_attributes_postal_code").jpostal({
      postcode: ["#_automate_nursery_attributes_postal_code"],
      address: {
        "#_automate_nursery_attributes_address1": "%3%4%5",
        "#_automate_nursery_attributes_address2": "%6%7"
      }
    }
  )

  $("#applicant_automate_nursery_attributes_postal_code").jpostal({
      postcode: ["#applicant_automate_nursery_attributes_postal_code"],
      address: {
        "#applicant_automate_nursery_attributes_address1": "%3%4%5",
        "#applicant_automate_nursery_attributes_address2": "%6%7"
      }
    }
  )

  $("#location_automate_nursery_attributes_postal_code").jpostal({
      postcode: ["#location_automate_nursery_attributes_postal_code"],
      address: {
        "#location_automate_nursery_attributes_address1": "%3%4%5",
        "#location_automate_nursery_attributes_address2": "%6%7"
      }
    }
  )

  $("#shipping_automate_nursery_attributes_postal_code").jpostal({
      postcode: ["#shipping_automate_nursery_attributes_postal_code"],
      address: {
        "#shipping_automate_nursery_attributes_address1": "%3%4%5",
        "#shipping_automate_nursery_attributes_address2": "%6%7"
      }
    }
  )

  $(".quantity").on "keyup mouseup", ->
    update_estimation()

  $("#attach-coupon").on "click", ->
    $("#messsage-coupon").html("")
    code = $(this).prev().val()
    $.ajax({
      url:"//#{location.host}/coupons/check",
      method: 'get',
      data: {code},
      datatype: 'json'
    })
    .done((response)->
      $("#attach-coupon").prop("disabled", true)

      reducing = parseInt(response['coupon']['reduce_price'])
      product_id = parseInt(response['coupon']['product_id'])

      price_elems = prices()
      currency = get_currency(price_elems[0].value)
      value_price = parseInt(currency_to_number(price_elems[0].value))
      reduced_price = value_price - reducing
      $("#coupon_attached").val("1")

      price_elems[0].value = currency + reduced_price.toLocaleString()

      update_estimation()
      $("#message-coupon").html(response['message'])
    )
    .fail((response)->
      $("#messsage-coupon").html(response.responseText)
    )

  $("#search-by-estimation-submit").on "click", ->
    $.ajax(
      url:'/estimations/search.json',
      data: {
        "uuid": $("#uuid").val()
      },
      success: ( (response) ->
        estimation = response["estimation"]
        organization = response["organization"]
        organization_inputs = result_organization_views()

        nursery = response["nursery"]
        nursery_inputs = result_nursery_views()

        search_result_reflect(organization_inputs, organization, "organization")
        search_result_reflect(nursery_inputs, nursery, "nursery")

        $(".estimation_id").each((index)->
          $(this).val(estimation.id)
        )

        $(".csp_id").first().val(nursery.csp_id)
        $(".organization_id").first().val(nursery.organization_id)
      ),
      dataType: "json"
    ).done( () ->
      "nop"
    ).fail( (response) ->
      $(".estimation-search-message-container").show()
      $(".estimation-search-message-container").html(response["responseJSON"]["error"])
    )

  $("#search-by-dm-number-submit").on "click", ->
    $.ajax(
      url:'/nurseries/search.json',
      data: {
        "dm_number": $("#dm_number").val(),
        "validate_phone": $("#validate_phone").val(),
        "validate_postal_code": $("#validate_postal_code").val()
      },
      success: ( (response) ->
        organization = response["organization"]
        organization_inputs = result_organization_views()

        nursery = response["nursery"]
        nursery_inputs = result_nursery_views()

        search_result_reflect(organization_inputs, organization, "organization")
        search_result_reflect(nursery_inputs, nursery, "nursery")

        $(".csp_id").first().val(nursery.csp_id)
        $(".organization_id").first().val(nursery.organization_id)

      ),
      dataType: "json"
    ).done( (response) ->
      "nop"
    ).fail((response) ->
      $(".customer-search-message-container").show()
      $(".customer-search-message-container").html(response["responseJSON"]["error"])
    )
