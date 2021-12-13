class RenameAdminColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :admin, :authorization,default: false, null: false
  end
end
