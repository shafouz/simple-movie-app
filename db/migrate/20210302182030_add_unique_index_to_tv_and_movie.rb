class AddUniqueIndexToTvAndMovie < ActiveRecord::Migration[6.1]
  def change
    add_index :movies, [:title, :release_date], unique: true
    add_index :tvs, [:name, :first_air_date], unique: true
  end
end
