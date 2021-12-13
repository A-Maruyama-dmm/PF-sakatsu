class ChangeDataOutsideAirBathToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :outside_air_bath, :string
  end
end
