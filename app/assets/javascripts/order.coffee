# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

display_with_condition = (check_target, condition, modify_target) ->
  if condition.includes($(check_target).val())
    $(modify_target).show()
    return "show"
  else
    $(modify_target).hide()
    return "hide"

$(document).on 'ready turbolinks:load', ->
  display_with_condition("#order_is_first_order", ["false"], "#experience")
  display_with_condition("#order_is_ship_to_nursery", ["false"], "#shipping")
  display_with_condition("#order_billing_ship_to", ["2"], "#billing")
  display_with_condition("#order_nursery_condition", ["1","2"], "#open_or_change_corp")

  $("#order_nursery_will_change_at").datetimepicker({
      format: 'YYYY-MM-DD'
  })

  $("#order_nursery_postal").jpostal({
      postcode: ["#order_nursery_postal"],
      address: {
        "#order_nursery_addr1": "%4%5",
        "#order_nursery_addr2": "%6%7"
      }
    }
  )

  $("#order_shipping_postal").jpostal({
      postcode: ["#order_shipping_postal"],
      address: {
        "#order_shipping_addr1": "%4%5",
        "#order_shipping_addr2": "%6%7"
      }
    }
  )

  $("#order_billing_shipping_postal").jpostal({
      postcode: ["#order_billing_shipping_postal"],
      address: {
        "#order_billing_shipping_addr1": "%4%5",
        "#order_billing_shipping_addr2": "%6%7"
      }
    }
  )

  $("#order_is_first_order").on "change", ->
    display_with_condition("#order_is_first_order", ["false"], "#experience")

  $("#order_is_ship_to_nursery").on "change", ->
    display_with_condition("#order_is_ship_to_nursery", ["false"], "#shipping")

  $("#order_billing_ship_to").on "change", ->
    display_with_condition("#order_billing_ship_to", ["2"], "#billing")

  $("#order_nursery_condition").on "change", ->
    display_with_condition("#order_nursery_condition", ["1","2"], "#open_or_change_corp")
