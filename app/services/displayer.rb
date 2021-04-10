module Displayer
  def self.response_handler(response_array)
    formatted_array = { "movies" => [], "tvs" => [], "people" => [], "movie_amount" => 0, "tv_amount" => 0, "person_amount" => 0, "multi_amount" => 0 }

    format_response(response_array, formatted_array)

    formatted_array
  end

  def self.format_response(response_array, formatted_array)
    results = response_array

    results.each do |result|
      result = result.slice("title", "original_title", "name", "original_name", "first_air_date", "profile_path", "release_date", "overview", "poster_path", "popularity", "media_type")

      case result["media_type"]
      when "movie"
        formatted_array["movies"] << result
        formatted_array["movie_amount"] += 1
      when "tv"
        formatted_array["tvs"] << result
        formatted_array["tv_amount"] += 1
      when "person"
        formatted_array["people"] << result
        formatted_array["person_amount"] += 1
      end
    end

    formatted_array["multi_amount"] = formatted_array["movie_amount"] + formatted_array["tv_amount"] + formatted_array["person_amount"]
  end
end
