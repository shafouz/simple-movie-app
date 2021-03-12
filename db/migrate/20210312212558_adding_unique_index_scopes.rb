class AddingUniqueIndexScopes < ActiveRecord::Migration[6.1]
  def change
    add_index :media, [:original_title, :release_date], unique: true
    add_index :media, [:original_name, :first_air_date], unique: true
  end
end
