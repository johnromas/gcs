# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $("#line_item_").hide()

  unless $("#line_items_table").children("tbody").children().length > 1
  	$("#line_items_table").children("tfoot").hide()
  $("#invoice_total_value").html($("#invoice_total_value").data("invoiceTotal"))

$(document).ready(ready)
$(document).on('page:load', ready)
