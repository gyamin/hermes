# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.UserSearchConst
  @url = "/api/users/index"

class window.User extends Backbone.Model
  defaults: ->
    id: 0
    first_name: ''
    last_name: ''
    mail_address: ''
    created_at: ''
    updated_at: ''

class window.UserSearchCollection extends Backbone.Collection
  model: window.User
  parse: (data) ->
    console.log data.users
    window.Hermes.global.UserSearchCollection = data.users
    return data.users

class window.UserSearchView extends Backbone.View
  el: '#user-search'
  model: window.UserSearch
  collection: window.UserSearchCollection
  template: _.template('
      <li>
        <button type="button" class="btn-add-user" data-userid="<%=id%>">追加</button>
        <%-last_name%> <%-first_name%>
      </li>
    ')
  events:
    "click .btn-search": 'search'

  # Search Users
  search: ->
    # get search text string
    search_text = $('.txt-search').val()
    console.log search_text
    users = new window.UserSearchCollection()
    users.url = window.UserSearchConst.url + "?name=" + search_text
    console.log users.url
    users.fetch
      success: =>
        # render template with view
        @render(users.models)
      error: (err) ->
        console.log err

  # rendering view
  render: (users) =>
    # clear results first
    $(".search-results").empty()
    for user in users
      buff = @template(user.toJSON())
      console.log buff
      $(".search-results").append(buff)