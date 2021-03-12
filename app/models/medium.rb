class Medium < ApplicationRecord
  validates :original_title, uniqueness: { scope: :release_date }, if: :is_movie?
  validates :original_name, uniqueness: { scope: :first_air_date }, if: :is_tv?

  def self.multi_search(search)
    where(
      "LOWER(title) LIKE :search OR
       LOWER(original_title) LIKE :search OR
       LOWER(name) LIKE :search OR
       LOWER(original_name) LIKE :search",
       search: "%#{search.downcase}%"
    ).order(popularity: :desc)
  end

  def self.movie_search(search)
    where(media_type: "movie")
      .where("LOWER(title) LIKE :search OR
       LOWER(original_title) LIKe :search",
       search: "%#{search.downcase}%")
      .order(popularity: :desc)
  end

  def self.tv_search(search)
    where(media_type: "tv")
      .where("LOWER(name) LIKE :search OR
       LOWER(original_name) LIKE :search",
       search: "%#{search.downcase}%")
      .order(popularity: :desc)
  end

  def self.person_search(search)
    where(media_type: "person")
      .where("LOWER(name) LIKE :search",
             search: "%#{search.downcase}%")
      .order(popularity: :desc)
  end

  private
  def is_movie?
    media_type == "movie"
  end

  def is_tv?
    media_type == "tv"
  end
end
