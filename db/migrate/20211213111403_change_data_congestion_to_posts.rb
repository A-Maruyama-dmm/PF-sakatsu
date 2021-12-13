class ChangeDataCongestionToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :congestion, :string
  end
end
