module MediaHelper
  def poster_path(img_path)
    "https://image.tmdb.org/t/p/original#{img_path}"
  end

  def rounded_pill
    "w-8 h-6 text-sm text-white bg-blue-500 rounded-full flex flex-none justify-center items-center font-semibold"
  end

  def btn_primary
    "py-2 px-4 font-semibold rounded-lg shadow-md text-white bg-blue-500 hover:bg-blue-700 focus:outline-none"
  end

  def form_control
    "border border-transparent rounded shadow leading-3 w-3/4 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
  end
end
