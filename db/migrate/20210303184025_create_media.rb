class CreateMedia < ActiveRecord::Migration[6.1]
  def change
    create_table :media do |t|
      t.text :title
      t.text :original_title
      t.text :name
      t.text :original_name
      t.text :first_air_date
      t.text :profile_path
      t.text :release_date
      t.text :overview
      t.text :poster_path
      t.float :popularity
      t.text :media_type

      t.timestamps
    end
  end
end
