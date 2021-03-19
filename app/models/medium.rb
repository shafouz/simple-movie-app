class Medium < ApplicationRecord
  validates :original_title, uniqueness: { scope: :release_date }, if: :is_movie?
  validates :original_name, uniqueness: { scope: :first_air_date }, if: :is_tv?

  def self.multi_search(search)
   results = where(
      "LOWER(title) LIKE :search OR
       LOWER(original_title) LIKE :search OR
       LOWER(name) LIKE :search OR
       LOWER(original_name) LIKE :search",
       search: "%#{search.downcase}%"
    ).limit(20).order(popularity: :desc)

   Tmdb.new("").response_handler(results.as_json)
  end

  private
  def is_movie?
    media_type == "movie"
  end

  def is_tv?
    media_type == "tv"
  end
end
