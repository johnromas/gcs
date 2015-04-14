# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#line_items_table tbody').sortable(
      axis: 'y'
      handle: '.handle'
      placeholder: "placeholder"
      forcePlaceholderSize: true
      update: ->
        $.post($(this).parent().data('update-url'), $(this).sortable('serialize'))
  ).disableSelection()
