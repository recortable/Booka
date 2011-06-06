module AssetsHelper
  def asset_url(asset)
    asset.url_file.present? ? asset.url_file : asset.file.url
  end

  def image_asset(asset, options = {})
    options.merge!({:alt => asset.title})
    image_tag(asset_url(asset), options)
  end
end
