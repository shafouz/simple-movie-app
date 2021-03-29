require "image_processing/vips"

class ImageSaverJob < ApplicationJob
  include MediaHelper

  queue_as :default

  def perform(image_results)
    image_results.each do |image_path|

      url = "https://image.tmdb.org/t/p/original#{image_path}"
      temp = Down.download(url)

      processed = ImageProcessing::Vips
        .source(temp.path)
        .resize_to_limit(94, 141)
        .convert("png")
        .call

      big_img = image_path[0..-5] + "_full.jpg"
      # original size
      full_size = FileUtils.mv temp.path, Rails.root.join("app/assets/images#{big_img}")

      # 100x100
      small_size = FileUtils.mv processed.path, Rails.root.join("app/assets/images#{image_path}")
    end
  end
end
