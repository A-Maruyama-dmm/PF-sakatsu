class ChangeDataSaunaTemperatureToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :sauna_temperature, :string
  end
end
