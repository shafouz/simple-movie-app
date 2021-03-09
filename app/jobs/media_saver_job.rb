class MediaSaverJob < ApplicationJob
  queue_as :default

  def perform(results)
    results["movies"].each do |result|
      Medium.create(result)
    end
    results["tvs"].each do |result|
      Medium.create(result)
    end
    results["people"].each do |result|
      Medium.create(result)
    end
  end
end
