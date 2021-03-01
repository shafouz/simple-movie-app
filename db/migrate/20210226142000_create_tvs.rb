class CreateTvs < ActiveRecord::Migration[6.1]
  def change
    create_table :tvs do |t|
      t.text :name
      t.text :original_name
      t.text :overview
      t.text :poster_path
      t.text :first_air_date

      t.timestamps
    end
  end
end
