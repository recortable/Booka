module AssetsHelper
  def image_asset(asset)
    url = asset.url_file.present? ? asset.url_file : asset.url.file
    image_tag(url, :alt => asset.title)
  end
end
