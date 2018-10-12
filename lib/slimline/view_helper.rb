module Slimline
  module ViewHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::AssetTagHelper

    def slimline_image_tag(source, options = {} )
      small_image = options.delete(:small_image)
      srcset = options.delete(:srcset)
      data_options = options.delete(:data) || {}

      data_options = data_options.merge(slimline: true)

      options = options.merge(class: 'lazy')

      if small_image
        data_options = data_options.merge('src' => source)
        new_source = small_image
      else
        new_source = source
      end

      data_options = data_options.merge('srcset' => srcset) if srcset

      options = options.merge(data: data_options)

      image_tag(new_source, options) +
        content_tag(:noscript) do
          image_tag(source, options)
        end
    end
  end
end
