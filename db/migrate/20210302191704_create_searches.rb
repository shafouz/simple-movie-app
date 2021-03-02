class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.text :query
      t.integer :number_of_searches, default: 1

      t.timestamps
    end
  end
end
