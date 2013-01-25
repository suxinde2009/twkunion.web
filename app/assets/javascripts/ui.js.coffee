root = this

root.fixedAlertPosition = ->
  if $(document).find('.jumbotron').length == 0
    $('.alert').css('margin-top': '20px')

root.initInfiniteScrollFeed = ->
  #---------------------------------------------- Posts Flow
  $container = $('.infinite-feed')
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: '.photo-wrapper'
      columnWidth: 230
      gutterWidth: 10

  $container.infinitescroll
    navSelector: '#page-nav' # selector for the paged navigation
    nextSelector: '#page-nav a' # selector for the NEXT link (to page 2)
    itemSelector: '.photo-wrapper' # selector for all items you'll retrieve
    loading:
      finishedMsg: 'No more pages to load.'
      img: '/assets/version2/loading.gif'

  # trigger Masonry as a callback
  , (newElements) ->
    
    $newElems = $(newElements)
    $container.masonry 'appended', $newElems, true
    Holder.run()

$ ->
  fixedAlertPosition()
  initInfiniteScrollFeed()