class ChangeDataVendingMachineToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :vending_machine, :string
  end
end
