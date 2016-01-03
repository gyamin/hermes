class User < ActiveRecord::Base

  # パラメータによる検索
  def self.search(params)
    # バインドパラメータ
    binds = {}
    # sql 生成
    sql = ""
    sql << "SELECT * FROM users "
    sql << "WHERE 1 = 1 "

    if(params[:name])
      sql << "and last_name || first_name like :name "
      binds[:name] = params[:name] + "%"
    end

    if(params[:mail_address])
      sql << "and mail_address like :mail_address "
      binds[:mail_address] = params[:mail_address] + "%"
    end

    users = self.find_by_sql([sql, binds])
  end

end
