class Movie < ApplicationRecord
  validates :title, uniqueness: { scope: :release_date }
end
