module MediaHelper
  def get_image_path(img_path)
    return "https://via.placeholder.com/150" if img_path.blank?

    exists = File.exist? Rails.root.join("app/assets/images#{img_path}")

    return trim_img_path(img_path) if exists
    "https://image.tmdb.org/t/p/w94_and_h141_bestv2#{img_path}"
  end

  def get_big_image_path(img_path)
    return "https://via.placeholder.com/150" if img_path.blank?

    big_img = append_img_size(img_path)
    exists = File.exist? Rails.root.join("app/assets/images#{big_img}")

    return trim_img_path(big_img) if exists
    "https://image.tmdb.org/t/p/original#{img_path}"
  end

  def append_img_size(img_path)
    img_path[0..-5] + "_full.jpg"
  end

  def trim_img_path(img_path)
    img_path.tr("/", "")
  end

  def trim_overview(overview)
    return "" if overview.blank?

    if overview.length >= 300
      overview = overview[0..347] + "..."
    else
      overview
    end
  end

  def convert_date(date)
    return if date.blank?

    date_str = I18n.l Time.zone.parse(date)
    date_str = date_str.split(",")[1]
    date_str = date_str[1..date_str.length - 1]
  end

  def rounded_pill
    "w-8 h-6 text-sm text-white bg-blue-500 rounded-full flex flex-none justify-center items-center font-semibold"
  end

  def btn_primary
    "py-2 cursor-pointer px-4 font-semibold rounded-lg shadow-md text-white bg-blue-500 hover:bg-blue-700 focus:outline-none"
  end

  def form_control
    "mr-3 border border-transparent rounded shadow-md leading-3 w-3/4 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
  end

  def devise_form
    "mb-3 w-full border border-transparent rounded shadow-md leading-3 w-3/4 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent"
  end

end
