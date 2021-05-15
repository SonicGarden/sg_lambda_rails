require 'activerecord-refresh_connection'
require 'sg_lambda_rails/adjust_cloud_front_headers'
require 'sg_lambda_rails/adjust_host_header'

module SgLambdaRails
  class Railtie < Rails::Railtie
    initializer "sg_lambda_rails.configure_rails_initialization" do |app|
      app.config.middleware.insert 0, SgLambdaRails::AdjustCloudFrontHeaders
      # app.config.middleware.insert_after SgLambdaRails::AdjustCloudFrontHeaders, SgLambdaRails::AdjustHostHeader
      app.config.middleware.insert_before ActionDispatch::Executor, ActiveRecord::ConnectionAdapters::RefreshConnectionManagement

      # CloudFront を利用した際に origin のチェックが通らないのを回避するためのワークアラウンド
      # app.config.action_controller.forgery_protection_origin_check = false
    end
  end
end
