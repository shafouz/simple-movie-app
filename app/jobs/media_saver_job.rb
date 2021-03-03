class MediaSaverJob < ApplicationJob
  queue_as :default

  def perform(formatted_results)
    formatted_results.each do |result|
      Medium.create(result)
    end
  end
end
