require "image_processing/vips"

class ImageSaverJob < ApplicationJob
  include MediaHelper

  queue_as :default

  def perform(results)
    results = results["movies"].concat(results["tvs"], results["people"]).pluck("poster_path")
    pp results
    results.each do |result|

      pp result
      temp = Down.download(poster_path(result))

      processed = ImageProcessing::Vips
        .source(temp.path)
        .resize_to_limit(100, 100)
        .convert("png")
        .call

      # original size
      full_size = FileUtils.mv temp.path, Rails.root.join("storage/#{result}")
      # 100x100
      small_size = FileUtils.mv processed.path, Rails.root.join("storage/100x#{result}")
    end
  end
end
