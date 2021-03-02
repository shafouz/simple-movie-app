class AddPopularityToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :popularity, :string
    add_column :tvs, :popularity, :string
    add_column :people, :popularity, :string
  end
end
