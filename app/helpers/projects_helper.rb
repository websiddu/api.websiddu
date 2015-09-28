module ProjectsHelper
  require 'fastimage'
  require 'nokogiri'
  require 'open-uri'

  def updateImageSizes(description)
    article = Nokogiri::HTML(description)

    article.css('img').each do |img|
      size = FastImage.size(img.get_attribute('src'))
      img.set_attribute('data-size', size)
    end

    return article.to_s
  end

end
