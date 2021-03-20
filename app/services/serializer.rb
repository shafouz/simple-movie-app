module Serializer
  def response_handler(response)
    response_data = { movies: [], tvs: [], people: [], movie_amount: 0, tv_amount: 0, person_amount: 0, multi_amount: 0 }

    format_response(response, response_data)

    response_data.as_json
  end

  def format_response(response, response_data)
    results = response
    results = response["results"] if response.is_a? Hash

    results.each do |result|
      case result["media_type"]
      when "movie"
        response_data[:movie_amount] += 1
        response_data[:movies] << {
          title: result["title"], original_title: result["original_title"], release_date: result["release_date"],
          overview: result["overview"], poster_path: result["poster_path"], popularity: result["popularity"], media_type: "movie"
        }
      when "tv"
        response_data[:tv_amount] += 1
        response_data[:tvs] << {
          name: result["name"], original_name: result["original_name"], first_air_date: result["first_air_date"],
          overview: result["overview"], poster_path: result["poster_path"], popularity: result["popularity"], media_type: "tv"
        }
      when "person"
        response_data[:person_amount] += 1
        response_data[:people] << {
          name: result["name"], profile_path: result["profile_path"], popularity: result["popularity"], media_type: "person"
        }
      end
    end
    response_data[:multi_amount] = response_data[:movie_amount] + response_data[:tv_amount] + response_data[:person_amount]
  end
end
