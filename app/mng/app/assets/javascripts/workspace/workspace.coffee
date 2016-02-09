@logger = new window.Hermes.common.logger()

class window.ToUserCollection extends Backbone.Collection
  model: window.UserSearch

class window.ToUserView extends Backbone.View
  el: 'main'
  events:
    "click .btn-add-user": 'setUserToAddress'

  # 追加ボタンがクリックされたユーザをToAddressに設定
  setUserToAddress: (elem) ->
    logger.debug window.Hermes.global.UserSearchCollection



    console.log this
    console.log elem.target;
    console.log $(elem.target).data 'userid'

$ ->
  userSearchView = new window.UserSearchView()
  toUserView = new window.ToUserView()