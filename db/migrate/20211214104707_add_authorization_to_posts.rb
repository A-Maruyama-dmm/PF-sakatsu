class AddAuthorizationToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :authorization, :boolean, null: false, default: false
  end
end
