class Tmdb
  def initialize(query)
    @query = query 
  end

  API_ENDPOINT = "https://api.themoviedb.org/3/search/"
  MEDIA_TYPES = %w[multi tv person movie] 

  def format_response(response, response_data)
    response["results"].each do |result|
      response_data[:formatted_results] << case result["media_type"]
      when "movie"
        response_data[:movie_amount] += 1
        {
          title: result["title"], original_title: result["original_title"], release_date: result["release_date"],
          overview: result["overview"], poster_path: result["poster_path"], popularity: result["popularity"], media_type: "movie"
        }
      when "tv"
        response_data[:tv_amount] += 1
        {
          name: result["name"], original_name: result["original_name"], first_air_date: result["first_air_date"],
          overview: result["overview"], poster_path: result["poster_path"], popularity: result["popularity"], media_type: "tv"
        }
      when "person"
        response_data[:person_amount] += 1
        {
          name: result["name"], profile_path: result["profile_path"], popularity: result["popularity"], media_type: "person"
        }
      else
        {}
      end
    end
    response_data[:multi_amount] = response_data[:movie_amount] + response_data[:tv_amount] + response_data[:person_amount]
  end

  def response_handler(response)
    response_data = { formatted_results: [], movie_amount: 0, tv_amount: 0, person_amount: 0, multi_amount: 0 }

    format_response(response, response_data)

    response_data
  end

  def call
    req = Faraday.get("#{API_ENDPOINT}#{MEDIA_TYPES[0]}", { query: @query, language: "pt-BR", api_key: "#{ENV["API_KEY"]}" })
    parsed_body = JSON.parse(req.body)
    response_handler(parsed_body)
  end
end
