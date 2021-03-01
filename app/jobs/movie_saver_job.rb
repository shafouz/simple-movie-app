class MovieSaverJob < ApplicationJob
  queue_as :default

  def perform(formatted_results)
    formatted_results.each do |result|
      case result[:media_type]
      when "movie"
        Movie.create(result)
      when "tv"
        Tv.create(result)
      when "person"
        Person.create(result)
      else
        puts "No media type matched"
      end
    end
  end
end
