class AddingDescriptionAndPosterToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :overview, :text
    add_column :movies, :poster, :text
  end
end
