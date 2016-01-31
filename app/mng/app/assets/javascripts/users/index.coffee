# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$ ->
#  $('#test').click ->
#    alert 'test click12345'


class View extends Backbone.View
  el:'#test'

  initialize: ->
    @render()

  render: =>
    console.log @el
    $(@el).append "<p>aaaaaa</p>"
#    $('#test').append "<p>aaaaaa</p>"

$ ->
  view = new View()
