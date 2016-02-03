# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class UserConst
  @url = "/api/users/index"

class User extends Backbone.Model
  defaults: ->
    id: 0
    first_name: ''
    last_name: ''
    mail_address: ''
    created_at: ''
    updated_at: ''

class UsersCollection extends Backbone.Collection
  model: User
  url: '/api/users/index'
  parse: (data) ->
    console.log data.users
    return data.users

class View extends Backbone.View
  el: '#user-search'
  model: User
  collection: UsersCollection
  template: _.template('<li><%-last_name%> <%-first_name%></li>')
  events:
    "click .btn-search": 'search'

# ユーザ検索
  search: ->
    # 検索文字列取得
    search_text = $('.txt-search').val()
    console.log search_text
    users = new UsersCollection()
#    users.url = "/api/users/index?name=" + search_text
    users.url = UserConst.url + "?name=" + search_text
    console.log users.url
    users.fetch
      success: =>
        # viewで描画処理
        @render(users.models)
      error: (err) ->
        console.log err

# 画面描画処理
  render: (users) =>
    $(".search-results").empty()
    for user in users
      buff = @template(user.toJSON())
      console.log buff
      $(".search-results").append(buff)

# 画面描画時ロード
$ ->
  view = new View()
