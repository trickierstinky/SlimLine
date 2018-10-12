module Slimline
  module ViewHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::AssetTagHelper

    def slimline_js_check_class
      'slimline-no-js'
    end

    def slimline_js_check
      content_tag :script do
        raw 'document.documentElement.classList.remove("slimline-no-js");'
      end
    end

    def slimline_image_tag(source, options = {} )
      small_image = options.delete(:small_image)
      srcset = options.delete(:srcset)
      sizes = options.delete(:sizes)
      data_options = options.delete(:data) || {}
      new_options = options

      new_options = new_options.merge(class: 'lazy')

      if small_image
        data_options = data_options.merge('src' => image_path(source))
        new_source = small_image
      else
        new_source = source
      end

      data_options = data_options.merge('srcset' => srcset) if srcset
      data_options = data_options.merge('sizes' => sizes) if sizes

      new_options = new_options.merge(data: data_options)

      image_tag(new_source, new_options) +
        content_tag(:noscript) do
          image_tag(source, options)
        end
    end
  end
end
