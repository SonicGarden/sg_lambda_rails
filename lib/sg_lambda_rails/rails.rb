require 'activerecord-refresh_connection'
require 'sg_lambda_rails/adjust_cloud_front_headers'

module SgLambdaRails
  class Railtie < Rails::Railtie
    initializer "sg_lambda_rails.configure_rails_initialization" do |app|
      unless Rails.env.test? || Rails.env.development?
        app.config.middleware.insert 0, SgLambdaRails::AdjustCloudFrontHeaders
        app.config.middleware.insert_before ActionDispatch::Executor, ActiveRecord::ConnectionAdapters::RefreshConnectionManagement
      end
    end
  end
end
