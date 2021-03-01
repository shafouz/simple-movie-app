class ChangingMovieModel < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :media_type
    change_column :movies, :name, :text
    add_column :movies, :original_title, :text
    rename_column :movies, :name, :title
  end
end
