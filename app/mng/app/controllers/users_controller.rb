require_relative './../services/users_service'

class UsersController < ApplicationController

  #
  # ユーザ一覧取得（検索）処理
  def index
    client_data = {}
    # ユーザ検索
    user_service = UsersService.new
    client_data[:users] = user_service.search_users(params)
    render :json => client_data
  end
end
