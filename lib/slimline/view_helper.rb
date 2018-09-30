module Slimline
  module ViewHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::AssetTagHelper
    def slimline_image_tag(source, options = {} )
      small_image = options.delete(:small_image)
      data_options = options.delete(:data) || {}

      data_options = data_options.merge(slimline: true)

      if small_image
        data_options = data_options.merge('full-image' => image_url(source) )
        options = options.merge(data: data_options)
        options = options.merge(class: 'preview')
        return image_tag(small_image, options)
      end

      options = options.merge(data: data_options)
      image_tag(source, options)
    end
  end
end
