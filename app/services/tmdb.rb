# params: language=pt-BR, query=, api_key=,
# endpoint: https://api.themoviedb.org/3/search/multi?
# params = { query: "", language: "pt-BR", api_key: ENV["API_KEY"] }

class Tmdb
  def initialize(query)
    @query = query
  end

  def multi_search
  end
end
