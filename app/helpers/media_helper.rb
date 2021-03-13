module MediaHelper
  def poster_path(img_path)
    "https://image.tmdb.org/t/p/original#{img_path}"
  end
end
