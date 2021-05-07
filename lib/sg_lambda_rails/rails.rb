require 'activerecord-refresh_connection'
require 'sg_lambda_rails/cloud_front_header'

module SgLambdaRails
  class Railtie < Rails::Railtie
    initializer "sg_lambda_rails.configure_rails_initialization" do |app|
      app.config.middleware.insert_before ActionDispatch::Executor, ActiveRecord::ConnectionAdapters::RefreshConnectionManagement
      app.config.middleware.insert_before ActiveRecord::ConnectionAdapters::RefreshConnectionManagement, SgLambdaRails::CloudFrontHeader
    end
  end
end
