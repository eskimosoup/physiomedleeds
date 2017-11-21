// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require colorbox
//= require_tree .

$(document).on("click", ".mobile-toggle", function() {
  $('#nav').toggle();
});

$(document).on("click", ".area-toggle", function() {
  if ($(this).text() == 'Read More') {
    $(this).text('Read Less');
  } else if ($(this).text() == 'Read Less') {
    $(this).text('Read More');
  }
  var toggleContainer = this.hash;
  $(toggleContainer).slideToggle();
  return false;
});

$(document).on("click", ".mobile-area-toggle", function() {
  var toggleContainer = this.hash;
  $(toggleContainer).toggleClass('mobile-hidden');
  return false;
});

$(document).on("click", ".top", function() {
   $('html, body').animate({scrollTop:0}, 'slow');
  return false;
});

function updateSelect(selectValue) {
  $('#booking_time_4i option:not(.out-of-hours)').show();
  /*
  $('#booking_time_4i option').each(function() {
    if( parseInt( $(this).val() ) <= 7 || parseInt( $(this).val() ) >= 18 ) {
      $(this).hide();
    }
  });
  */

  switch( selectValue ) {
    case 18:
      //$('#booking_clinic option[value="Physio Med Guiseley"]').attr('disabled', 'disabled');

      $(".datepicker").datepicker({
        minDate: 0,
        dateFormat: "dd MM yy",
        beforeShowDay: function(date) {
          var day = date.getDay();
          var month = date.getMonth();
          //return [( day == 3 && month == 10), ''];
          return [( day == 1 || day == 2 || day == 3 || day == 4 || day == 5), ''];
        }
      });

      //$('#booking_clinic option:not([disabled])').attr('selected', 'selected');
      //$("#booking_clinic").trigger("change");
      //$('#warning-output').text('This offer is only available at Physio Med Leeds.');

      break;

    case 19:

      $('#warning-output').html('This offer is available Monday & Thursday between 6-9PM');

      $(".datepicker").datepicker({
        minDate: 0,
        dateFormat: "dd MM yy",
        beforeShowDay: function(date) {
          var day = date.getDay();
          return [( day == 1 || day == 4), ''];
        }
      });

      $('#booking_time_4i option:not([value=18], [value=19])').hide();
      $('#booking_time_4i option[value=18]').attr('selected', 'selected').show();
      $('#booking_time_4i option[value=19]').show();
      $('#booking_clinic')
         .append($("<option></option>")
         .attr( { "value": 'Not applicable', "selected": 'selected' } )
         .text('Not applicable'));

      break;

    case 20:

      $('#warning-output').html('This offer is available Monday – Friday between 11-1PM');

      $(".datepicker").datepicker({
        minDate: 0,
        dateFormat: "dd MM yy",
        beforeShowDay: function(date) {
          var day = date.getDay();
          return [( day == 1 || day == 2 || day == 3 || day == 4 || day == 5), ''];
        }
      });

      $('#booking_time_4i option:not([value=11], [value=12])').hide();
      $('#booking_time_4i option[value=11]').attr('selected', 'selected');

      //$('#booking_time_5i option[value=30]').attr('disabled', 'disabled');
      $('#booking_clinic')
         .append($("<option></option>")
         .attr( { "value": 'Not applicable', "selected": 'selected' } )
         .text('Not applicable'));

      break;

    default:
      $( ".datepicker" ).datepicker({
        minDate: 0,
        dateFormat: "dd MM yy",
        beforeShowDay: $.datepicker.noWeekends
      });
  }
}

$(document).on('change', '#booking_clinic', function() {
  var selectedText =  $('#booking_clinic option:selected' ).text();

  if( selectedText == 'Physio Med Leeds' ) {
    $('#booking_time_4i option').removeClass('out-of-hours').show();
    $('#booking_time_4i option').each(function() {
      if( parseInt( $(this).val() ) <= 7 || parseInt( $(this).val() ) > 19 ) {
        $(this).addClass('out-of-hours').hide();
      }
    });
    $('#booking_time_4i option[value=23]').hide();
  } else if( selectedText == 'Physio Med Guiseley' )  {
    $('#booking_time_4i option').removeClass('out-of-hours').show();
    $('#booking_time_4i option').each(function() {
      if( parseInt( $(this).val() ) <= 7 || parseInt( $(this).val() ) > 19 ) {
        $(this).addClass('out-of-hours').hide();
      }
    });
    $('#booking_time_4i option[value=23]').hide();
  }

  // Update times for treatment to override clnnic
  var selectValue = parseInt( $('#booking_treatment_id').val() );
  if( selectValue >= 18 && selectValue <= 20 ) {
    updateSelect(selectValue)
  }

});

$(document).on('change', '#booking_time_4i', function() {

  $('#booking_time_5i option[value=30]').show();

  if( parseInt( $('#booking_treatment_id').val() ) == 19 && parseInt( $(this).val() ) == 19 ) {
    $('#booking_time_5i option[value=30]').hide();
  }

});

$(document).on('change', '#booking_treatment_id', function() {
  $( '.datepicker' ).datepicker( "destroy" );
  $('#booking_clinic option[value="Physio Med Guiseley"]').removeAttr('disabled');
  $('#warning-output').text('');

  $("#booking_clinic").trigger("change");

  $('#booking_time_4i option').removeAttr('disabled');
  $('#booking_time_5i option[value=30]').removeAttr('disabled');
  $('#booking_clinic option[value="Not applicable"]').remove();

  var selectValue = parseInt( $(this).val() );

  updateSelect(selectValue);
});


$(document).ready(function() {
  $("#booking_clinic").trigger("change");

  $('.colorbox').colorbox({rel:'gal'});
  $( ".datepicker" ).datepicker({ minDate: 0, dateFormat: "dd MM yy", beforeShowDay: $.datepicker.noWeekends });

  //if (!jQuery.browser.mobile) {
    $('li.contact-right').hover(function() {
      $('#contact-drop').fadeIn('fast');
    }, function() {
      $('#contact-drop').fadeOut('fast');
    });
  //}

  // <a href="#" id="stop-slider">Stop slider</a>
  $('#stop-slider').click(function() {
    clearInterval(sliderTimer);
    return false;
  });

  // <a href="#" id="start-slider">Start slider</a>
  $('#start-slider').click(function() {
    clearInterval(sliderTimer);
    sliderTimer = setInterval(sliderToggle, sliderSpeed);
    return false;
  });

  // <a href="#" class="toggle-slide" data-slide-id="1">Item 1</a>
  $('.toggle-slide').click(function() {
    clearInterval(sliderTimer);
    var fadeOut    = sliderPosition;
    var newSlide   = $(this).attr('data-slide-id');
    sliderPosition = newSlide;

    $('.slide-' + fadeOut).fadeOut('fast', function() {
      $('.slide-' +  sliderPosition).fadeIn('fast');
    });

    $(this).siblings().removeClass('current-slide');
    $(this).addClass('current-slide');
    return false;
  });

  // Setup some variables
  var sliderItems     = $('.slide');
  var sliderItemTotal = sliderItems.length - 1;

  var sliderPosition = 0;
  var sliderSpeed    = 8000;
  var sliderTimer    = setInterval(sliderToggle, sliderSpeed);

  // Actually do stuff
  function sliderToggle() {
    var fadeOut = sliderPosition;

    if(sliderPosition == sliderItemTotal) {
      sliderPosition = 0;
    } else {
      sliderPosition++;
    }

    $('.slide-' + fadeOut).fadeOut('fast', function() {
      $('.slide-' + sliderPosition).fadeIn('fast');
      $('.toggle-' + sliderPosition).siblings().removeClass('current-slide');
      $('.toggle-' + sliderPosition).addClass('current-slide');
    });
  }

  // http://www.mkyong.com/jquery/how-to-create-a-tooltips-with-jquery/
  var changeTooltipPosition = function(event) {
    var tooltipX = event.pageX - 40;
    var tooltipY = event.pageY - 45;
    $('div.know-your-body-tooltip').css({top: tooltipY, left: tooltipX});
  };

  var showTooltip = function(event) {
    $('div.tooltip').remove();
    $('<div class="know-your-body-tooltip green-header">' + $(this).attr('data-title') + '</div>').appendTo('body');
    changeTooltipPosition(event);
  };

  var hideTooltip = function() {
     $('div.know-your-body-tooltip').remove();
  };

  $("#back-body a, #front-body a").bind({
     mousemove : changeTooltipPosition,
     mouseenter : showTooltip,
     mouseleave: hideTooltip
  });
});

$(document).on('click', '.ga-event', function (e) {
  var eventCategory = $(this).data('event-category');
  var eventAction = $(this).data('event-action');
  var eventLabel = $(this).data('event-label');
  // var eventValue = $(this).data('event-value');

  if (eventCategory && eventAction && typeof ga === 'function') {
    ga('send', {
      hitType: 'event',
      eventCategory: eventCategory, // required
      eventAction: eventAction, // required
      eventLabel: eventLabel,
      // eventValue: eventValue,
      // hitCallback: function() {
      //   console.log('ga Event, category: "' + eventCategory + '", action: "' + eventAction + '", label: "' + eventLabel + '"');
      // }
    });
  }
});
