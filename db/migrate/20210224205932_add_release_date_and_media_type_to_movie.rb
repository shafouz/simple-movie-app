class AddReleaseDateAndMediaTypeToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :release_date, :text
    add_column :movies, :media_type, :text
  end
end
