class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :sauna_name
      t.text :address
      t.text :url
      t.string :sauna_image_id
      t.integer :sauna_temperature
      t.integer :water_bath_temperature
      t.integer :outside_air_bath
      t.integer :congestion
      t.integer :time_zorn
      t.integer :vending_machine
      t.integer :comprehensive_evaluation
      t.boolean :admin

      t.timestamps
    end
  end
end
