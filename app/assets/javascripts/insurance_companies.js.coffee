ready = ->
  $('#insurance-index').dataTable()

$(document).ready(ready)
$(document).on('page:load', ready)