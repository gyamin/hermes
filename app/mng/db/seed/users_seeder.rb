require_relative 'seeder'

class UsersSeeder
  include Seeder

  def initialize
    @model_name = 'User'
    @talbe_name = 'users'
    @file_path = File.dirname(__FILE__) + "/csv/#{@talbe_name}.csv"

    # テーブル初期化
    self.init_table

    # csvデータ挿入
    self.read_csv_file
    self.insert_csv_data
  end

  # usersテーブルにcsvデータを登録する
  def insert_csv_data
    @csv_rows.each_with_index do |elem, index|
      user = User.new
      user.id = elem[0]
      user.first_name = elem[1]
      user.last_name = elem[2]
      user.mail_address = elem[3]
      user.password = elem[4]
      user.company_id = elem[5]
      user.save
      puts "Insert: #{@talbe_name} #{index}"
    end
  end
end