require_relative './../services/users_service'

class UsersController < ApplicationController
  def index
    user_service = UsersService.new
    user_service.search_users()

    render 'users/index'
  end
end
