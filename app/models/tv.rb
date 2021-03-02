class Tv < ApplicationRecord
  validates :name, uniqueness: { scope: :first_air_date }
end
