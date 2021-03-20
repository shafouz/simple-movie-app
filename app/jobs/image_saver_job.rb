require "image_processing/vips"

class ImageSaverJob < ApplicationJob
  include MediaHelper

  queue_as :default

  def perform(image_results)
    image_results.each do |image_path|

      temp = Down.download(get_image_path(image_path))

      processed = ImageProcessing::Vips
        .source(temp.path)
        .resize_to_limit(100, 100)
        .convert("png")
        .call

      # original size
      full_size = FileUtils.mv temp.path, Rails.root.join("app/assets/images/#{image_path}")
      # 100x100
      image_path[0] = "/100x"
      small_size = FileUtils.mv processed.path, Rails.root.join("app/assets/images/#{image_path}")
    end
  end
end
