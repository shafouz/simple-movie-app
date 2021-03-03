class Medium < ApplicationRecord
  def self.multi_search(search)
    where('LOWER(original_title) LIKE :search OR LOWER(name) LIKE :search OR LOWER(original_name) LIKE :search', search: "%#{search}%").order(popularity: :desc)
  end
end
