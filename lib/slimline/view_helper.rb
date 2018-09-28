class Slimline
  module ViewHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::AssetTagHelper

    def slimline_image_tag(source, options = {} )
      small_image = options.delete(:small_image)
      solid_color = options.delete(:solid_color)

      img =  Magick::Image.read(source).first
      pix = img.scale(1, 1)
      average_color = pix.pixel_color(0,0)

      if small_image
        if data_options = options.delete(:data)
          data_options.merge('small-image' => small_image )
        end
        options.merge(data: data_options)
      end

      options.merge(style: "background-color: #{average_color}")
      image_tag(source, options)
    end
  end
end
