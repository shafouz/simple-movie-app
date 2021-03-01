class AddMediaTypeToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :media_type, :text
    add_column :tvs, :media_type, :text
    add_column :people, :media_type, :text
  end
end
