# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#doctors-index').dataTable()
  $('.dataTables_length').addClass("hidden-xs")
  $(".dataTables_filter input").css("width", "175px")
	$(".dataTable").next().children().first().next().removeClass("col-xs-6").addClass("col-xs-12")
	$('.phone-input').inputmask({ mask: ["999-999-9999 [x99999]", "+099 99 99 9999[9]-9999"], showTooltip: true })
  $('.ssn-input').inputmask({ mask: ["999-99-9999"], showTooltip: true })

$(document).ready(ready)
$(document).on('page:load', ready)