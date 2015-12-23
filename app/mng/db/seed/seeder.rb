require 'CSV'

module Seeder

  # csvファイルの読み込み
  def read_csv_file
    @csv_rows = CSV.read(@file_path)
  end

  # テーブルの初期化
  def init_table
    # 全件削除
    @model_name.constantize.destroy_all
    # シーケンス初期化
    ActiveRecord::Base.connection.reset_pk_sequence!(@table_name)
  end
end