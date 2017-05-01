$(document).on 'ready turbolinks:load', ->
  $("#confirm_button").prop("disabled": true)
  $("#privacy-aggreement-check").on "click", ->
    if $("#privacy-aggreement-check").is(":checked")
      $("#confirm_button").prop("disabled", false)
    else
      $("#confirm_button").prop("disabled", true)
