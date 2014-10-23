# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $("#line_item_").hide()
  $(".line_item_total").html("1")

  unless $("#line_items_table").children("tbody").length > 1
  	$("#line_items_table").children("tfoot").hide()

$(document).ready(ready)
$(document).on('page:load', ready)
