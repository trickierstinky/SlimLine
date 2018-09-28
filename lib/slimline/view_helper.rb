module Slimline
  module ViewHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::AssetTagHelper
    def slimline_image_tag(source, options = {} )
      small_image = options.delete(:small_image)
      solid_color = options.delete(:solid_color)

      if small_image
        if data_options = options.delete(:data)
          data_options.merge()
        end

        data_options = {'full-image' => image_url(source) }
        options = options.merge!(data: data_options)

        options = options.merge(style: "background-color: #{solid_color}")
        puts(options)
        return image_tag(small_image, options)
      end

      image_tag(source, options)
    end
  end
end
