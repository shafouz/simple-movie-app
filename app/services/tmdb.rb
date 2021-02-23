class Tmdb
  def initialize(query)
    @query = URI.encode_www_form(query: query)
  end
  
  def query
    @query
  end

  def language
    "language=pt-BR"
  end

  def api_key
    "api_key=#{ENV["API_KEY"]}"
  end

  def api_endpoint
    "https://api.themoviedb.org/3/search"
  end

  def movie_search
    "#{api_endpoint}/movie?#{query}&#{language}&#{api_key}"
  end

  def tv_search
    "#{api_endpoint}/tv?#{query}&#{language}&#{api_key}"
  end

  def person_search
    "#{api_endpoint}/person?#{query}&#{language}&#{api_key}"
  end

  def multi_search
    "#{api_endpoint}/multi?#{query}&#{language}&#{api_key}"
  end

  def test
    @query
  end
end
