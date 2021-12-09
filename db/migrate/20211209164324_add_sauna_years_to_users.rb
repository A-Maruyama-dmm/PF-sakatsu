class AddSaunaYearsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sauna_years, :string
  end
end
