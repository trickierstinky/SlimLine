module Slimline
  module ViewHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::AssetTagHelper
    def slimline_image_tag(source, options = {} )
      small_image = options.delete(:small_image)
      data_options = options.delete(:data) || {}

      if small_image
        data_options = data_options.merge('full-image' => image_url(source) )

        style = "#{style} filter: blur(2vw);  transform: scale(1.05);"
      end

      data_options = data_options.merge(slimline: true)

      options = options.merge(data: data_options)

      if small_image
        data_options = data_options.merge('full-image' => image_url(source) )
        options = options.merge(style: "#{style} filter: blur(2vw);  transform: scale(1.05);")
        return image_tag(small_image, options)
      end
      image_tag(source, options)
    end
  end
end
