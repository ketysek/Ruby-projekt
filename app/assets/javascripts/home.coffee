# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  @vote = (mealId, grade) ->
    $.ajax({
      type: "POST",
      url: "/ratings",
      data: { rating: { value: grade, meal_id: mealId } },
      success:(data) ->
        alert 'Thank you!'
        window.location.reload();
        return false
      error:(data) ->
        alert data.responseJSON.error
        return false
    })
