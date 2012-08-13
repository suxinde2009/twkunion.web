$(document).ajaxSend(function(event, jqXHR, ajaxOptions) {
  var token = $('meta[name="csrf-token"]').attr("content");
  jqXHR.setRequestHeader("X-CSRF-Token", token);
});

initFollowPrompts();
initRecentActivity();

// Enable placholder attribute for all browsers

$(function(){
  $('[placeholder]').focus(function() {
  var input = $(this);
  if (input.val() == input.attr('placeholder')) {
    input.val('');
    input.removeClass('placeholder');
  }
}).blur(function() {
  var input = $(this);
  if (input.val() == '' || input.val() == input.attr('placeholder')) {
    input.addClass('placeholder');
    input.val(input.attr('placeholder'));
  }
}).blur();

$('[placeholder]').parents('form').submit(function() {
  $(this).find('[placeholder]').each(function() {
    var input = $(this);
    if (input.val() == input.attr('placeholder')) {
      input.val('');
    }
  })
});

/* Drop-down menus on hover */
$('#nav li').hover(
  function() { $(this).find('ul.tabs').show(); },
  function() { $(this).find('ul.tabs').hide(); }
);
$('ul.tabs li').hover(
  function() { $(this).find('ul.sub').show(); },
  function() { $(this).find('ul.sub').hide(); }
);
});

/*
 * jQuery extensions
 */

// Shows the current element(s) and hides the element(s) passed or specified by selector.
jQuery.fn.showAndHide = function(elemToHide) {
  $(elemToHide).hide();
  return this.show();
}

// Returns model id parsed from element id w/ format "prefix-<id>"
jQuery.fn.modelId = function() {
  var id = $(this).attr('id');
  if (id == null) return null; // Just in case; browsers tested return empty string for missing id.

  var idParts = id.split(/[-_]/g); // Split on hyphens and underscores
  return (idParts.length > 1) ? idParts[idParts.length-1] : null;
}

/*
 * Custom libs
 */

Notify = {
  success: function(message) {
    Notify.notify('success', message);
  }, 
  error: function(message) {
    Notify.notify('error', message);
  },
  clear: function() {
    // Also clears case where there's a redirect-style flash message
    $('.notice').hide().find('h2').text('');
  },
  notify: function(typeOfNoticeClass, message) {
    Notify.clear();
    $('.ajax.notice').find('h2').text(message);
    $('.ajax.notice').
      addClass(typeOfNoticeClass).
      show();
  }
}

$.fn.clank = function(message) {
  if (message == null) return;
  
  var $form = $(this).closest('form');
  $form.find('.errorExplanation').remove();
  $form.find('fieldset').removeClass('fieldWithErrors');
  
  message = '<div class="errorExplanation" id="errorExplanation"><h2>Clank!</h2><ul><li>' + message + '</li></ul></div>'
  $form.prepend(message);
  $form.find('fieldset').addClass('fieldWithErrors');
}

ShowAndHideControl = function(options) {
  var elemToShowAndHide = $(options['target']);
  var showTriggers = $(options['showControl']);
  var hideTriggers = $(options['hideControl']);
  
  showTriggers.
    click(function() {
      elemToShowAndHide.showAndHide(showTriggers);
      return false;
    });

  hideTriggers.
    click(function() {
      elemToShowAndHide.hide();
      showTriggers.show();
      return false;
    });
}

/*
 * Converts a number to its value in thousands (K), e.g. 12,000 => 12
 */
function toK(num) {
  return num / 1000;
}

function formatK(num) {
  return toK(num) + 'K';
}

(function($){
  $.fn.fadeable = function(options){

    var settings = {
      target: this,
      duration: 'fast'
    };
    $.extend(settings, options)

    $(this).live('hover', function(event) {
      switch(event.type){
        case 'mouseenter':
          $(this).find(settings.target).stop().fadeTo(settings.duration, 1);
          break;
        case 'mouseleave':
          $(this).find(settings.target).stop().fadeTo(settings.duration, 0);
          break;
      }
    });
  }
})(jQuery);

// Plugin turns a select box into a menu.
// On change, browser navigates to url specified by value of selected option.
(function($) {
  $.fn.selectMenu = function() {
    $(this).change(function(event) {
      location.href = $(this).find(':selected').val();
      event.preventDefault();
    });
  }
})(jQuery);

// Used with a results pane that displays a wait indicator during processing.
// paneContainerSelector specifies an element containing both a
// 'results-pane' and '.processing' elements to show results and status.
ResultsPane = function(paneContainerSelector) {
  $paneContainer = $(paneContainerSelector || '#main');
  var $resultsPane = $paneContainer.find('.results-pane');
  var $waitDiv = $paneContainer.find('div.processing');
  
  return {
    waiting: function() {
      $waitDiv.show();
      $resultsPane.css('opacity', .2);
    },
    finished: function() {
      $waitDiv.hide();
      $resultsPane.css('opacity', 1);
    },
    noResults: function(message) {
      message = message || 'None'
      $resultsPane.html('<div class="null-message"><h2>' + message + '</h2></div>');
    }
  }
}

// show screenshot info on hover
$('ol.dribbbles li div.dribbble-img').fadeable({target: 'a.dribbble-over'});

// show prev/next arrows on hover
$('ol.prevnext li a').fadeable({target: 'strong'});

// show zoom icon on thumbnail hover
$('ol.activity li div.act-shot').fadeable({target: 'strong'});
$('div.the-rebound div.dribbble-img').fadeable({target: 'a.dribbble-over'});

// show zoom icon on multi thumb hover
$('ol.multi-grid li a').fadeable({target: 'strong'});

function attachPlayerTooltipsToGroupShots() {
  $('ol.multi-grid li a.zoom').each(function() {
    var link = $(this);
    link.tipsy({
      gravity: 'n',
      html: true,
      title: function() { return link.closest('li').find('div.tipsy-player').html(); }
    });
  });
}

var Overlay = {
  init: function() {
    var $overlay = $('#overlay'); // Overlay container
    $overlay.find('button.close').live('click', Overlay.hide);
    $overlay.find('form .cancel').live('click', Overlay.hide);
    // So click away from overlay closes it
    $overlay.live('click', function(event) {
      if ($(event.target).is('#overlay'))
        Overlay.hide();
    });
  },
  show: function() {
    $overlay = $('#overlay');
    $overlay.css('height', document.body.clientHeight+'px');
    $overlay.find('.lightbox').css('top', $(window).scrollTop() + 60 + 'px');
    $overlay.fadeIn();
    
    return false;
  },
  hide: function() {
    $overlay = $('#overlay');
    $overlay.fadeOut(function() {
      // Load from scratch next time displayed
      $overlay.find('.display').html('<div class="processing">Loading ...</div>');
    });
    return false;
  }
}

function showOverlay(selector) {
  var $overlay = $(selector);
  $overlay.css('height', document.body.clientHeight+'px');
  $overlay.find('.lightbox').css('top', $(window).scrollTop() + 60 + 'px');
  $(selector).fadeIn();
  return false;
}

// show/hide pixel useage help
$('#pixels-help-a').click(function() {
  $('#pixels-help').slideToggle("normal");
  return false;
})

// show/hide search in adaptive small screen mode
$('#t-search').click(function() {
  $('#dashboard').slideToggle("normal");
  return false;
})

$('[rel=tipsy]').tipsy({fade: true, gravity: 's'});

/*
 * Attaches to behavior to any follow/unfollow link on the page.
 */
function initFollowPrompts() {
  $('.follow-prompt a').live('click', function() {
    var $link = $(this);
    var followPrompt = $link.closest('.follow-prompt');
    var originalHtml = followPrompt.html();
    
    $link.closest('.follow-prompt form').ajaxSubmit({
      beforeSend: function() {
        $link.addClass('processing');
        $link.find('span').text('Wait...');
      },
      success: function(responseHtml) {
        // Update to refect follow status
        $link.closest('.follow-prompt').html(responseHtml);
      },
      error: function(request) {
        followPrompt.html(originalHtml);
        alert(request.responseText);
      }
    });
    return false;
  });
}

/* Handles menu display of incoming activity and logging for views of it. */
function initRecentActivity() {
  $('#t-activity')
    .hover(function() {
      $('img.new-activity:visible').fadeOut('slow', function() {
        var url = $('#t-activity a:first-child').attr('href');
        $.post(url, {_method: 'PUT'})
      });
    })
    .find('.activity-mini a.close')
      .click(function() {
        $('#nav li ul.tabs').hide();
      });
}