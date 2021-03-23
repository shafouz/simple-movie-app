module MediaHelper
  def get_image_path(img_path)
    return "150.png" if img_path.blank?

    exists = File.exist? Rails.root.join("app/assets/images#{img_path}")

    return img_path.tr("/", "") if exists
    "https://image.tmdb.org/t/p/w94_and_h141_bestv2#{img_path}"
  end

  def trim_overview(overview)
    return "" if overview.blank?

    if overview.length >= 300
      overview = overview[0..347] + "..."
    else
      overview
    end
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
