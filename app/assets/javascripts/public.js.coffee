$.fn.raty.defaults.path = '/assets/raty'

feedbackFancyboxOptions =
  fitToView: false
  width: 750
  height: 400
  autoSize: false
  closeClick: false
  openEffect: 'none'
  closeEffect: 'none'
  closeBtn: true
  helpers:
    overlay:
      closeClick: false

$ ->
  $('#slider').nivoSlider()

  $('[rel=feedback]').fancybox feedbackFancyboxOptions