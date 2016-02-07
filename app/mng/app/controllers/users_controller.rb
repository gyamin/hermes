class UsersController < ApplicationController
  def index
    render template: "user_search/index"
  end
end
