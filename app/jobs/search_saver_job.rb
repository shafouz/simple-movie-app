class SearchSaverJob < ApplicationJob
  queue_as :default

  def perform(query)
    Search.create(query: query)
  end
end
