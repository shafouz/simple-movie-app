class Tmdb
  include Serializer

  def initialize(query)
    @query = query 
  end

  API_ENDPOINT = "https://api.themoviedb.org/3/search/"

  def call
    req = Faraday.get("#{API_ENDPOINT}multi", { query: @query, language: "pt-BR", api_key: "#{ENV["API_KEY"]}" })
    parsed_body = JSON.parse(req.body)
    response_handler(parsed_body)
  end
end
