class ChangeDataWaterBathTemperatureToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :water_bath_temperature, :string
  end
end
