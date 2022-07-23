require 'sg_lambda_rails/adjust_cloud_front_headers'
require 'sg_lambda_rails/connection_pool_killer'

module SgLambdaRails
  class Railtie < Rails::Railtie
    initializer "sg_lambda_rails.configure_rails_initialization" do |app|
      unless Rails.env.test? || Rails.env.development?
        app.config.middleware.insert 0, SgLambdaRails::AdjustCloudFrontHeaders
      end
    end
  end
end
