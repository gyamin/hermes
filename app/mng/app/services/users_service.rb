
class UsersService

  # ユーザ検索
  def search_users(params)
    User.search(params)
  end

  # private method
  private

end