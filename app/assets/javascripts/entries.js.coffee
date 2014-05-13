# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#datetimepicker').datetimepicker();

  @swap_searches = (x) ->
    if (x == 'insert')
      $('#insert-form').hide()
      $('#search-form').show('fade')

    if (x == 'search')
      $('#search-form').hide()
      $('#insert-form').show('fade')
