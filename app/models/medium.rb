class Medium < ApplicationRecord
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
end
