require_relative './../services/users_service'

class UsersController < ApplicationController

  def index
    client_data = {}
    user_service = UsersService.new
    client_data[:users] = user_service.search_users
    render :json => client_data
  end
end
