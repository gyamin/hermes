class window.ToUserCollection extends Backbone.Collection
  model: window.UserSearch

class window.ToUserView extends Backbone.View
  el: 'main'
  events:
    "click .btn-add-user": 'addUser'

  addUser: (elem) ->
    console.log this
    console.log elem.target;
    console.log $(elem.target).data 'userid'

$ ->
  view = new window.ToUserView()