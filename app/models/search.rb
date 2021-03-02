class Search < ApplicationRecord
  validates :query, uniqueness: true
end
