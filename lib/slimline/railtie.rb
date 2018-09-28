module Slimline
  class Engine < ::Rails::Engine
    initializer 'slimline.initialize' do
      ActiveSupport.on_load(:action_view) do
        include Slimline::ViewHelper
      end
    end
  end
end
