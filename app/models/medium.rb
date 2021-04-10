class Medium < ApplicationRecord
  validates :original_title, uniqueness: { scope: :release_date }, if: :is_movie?
  validates :original_name, uniqueness: { scope: :first_air_date }, if: :is_tv?
  validates :name, uniqueness: true, if: :is_person?

  def self.multi_search(search)
    where(
      "LOWER(title) LIKE :search OR
       LOWER(original_title) LIKE :search OR
       LOWER(name) LIKE :search OR
       LOWER(original_name) LIKE :search",
       search: "%#{search.downcase}%"
    ).limit(20).order(popularity: :desc)
  end

  private
  def is_movie?
    media_type === "movie"
  end

  def is_tv?
    media_type === "tv"
  end

  def is_person?
    media_type === "person"
  end
end
