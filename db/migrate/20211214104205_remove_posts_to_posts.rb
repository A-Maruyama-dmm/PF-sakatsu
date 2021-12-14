class RemovePostsToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :posts, :boolean
  end
end
