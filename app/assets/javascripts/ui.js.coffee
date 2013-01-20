root = this

root.fixedAlertPosition = ->
  if $(document).find('.jumbotron').length == 0
    $('.alert').css('margin-top': '20px')

$ ->
  fixedAlertPosition()