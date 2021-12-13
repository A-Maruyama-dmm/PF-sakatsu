class ChangeDataTimeZornToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :time_zorn, :string
  end
end
