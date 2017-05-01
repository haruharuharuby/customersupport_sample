# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
result_views = ()->
  return $(".search-nursery-result")

$ ->
  $(".estimation-search-message-container").hide()
  $("#search-by-estimation-submit").on "click", ->
    $.ajax(
      url:'/estimations/search.json',
      data: {
        "uuid": $("#uuid").val()
      },
      success: ( (response) ->
        inputs = result_views()
        $.each(response, (key, value)->
          target = $.grep(inputs, (elem, index)->
            elem_keys = elem.id.split("_")
            size = elem_keys.length
            if key == "postal_code"
              return "code" == elem_keys[size-1] && "postal" == elem_keys[size-2] && "attributes" == elem_keys[size-3] && "nursery" == elem_keys[size-4]
            else
              return key == elem_keys[size-1] && "attributes" == elem_keys[size-2] && "nursery" == elem_keys[size-3]
          )
          target[0].value = response[key] if target.length > 0
        )
      ),
      dataType: "json"
    ).done( () ->
      "nop"
    ).fail( (response) ->
      $(".estimation-search-message-container").show()
      $(".estimation-search-message-container").html(response["responseJSON"]["error"])
    )
