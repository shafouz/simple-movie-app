module MediaHelper
  def poster_path(img_path)
    "https://image.tmdb.org/t/p/original#{img_path}"
  end

  def rounded_pill
    "w-8 h-6 text-sm text-white bg-blue-500 rounded-full flex flex-none justify-center items-center font-semibold"
  end
end
