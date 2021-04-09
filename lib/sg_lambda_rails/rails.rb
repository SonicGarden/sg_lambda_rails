require 'activerecord-refresh_connection'

module SgLambdaRails
  class Railtie < Rails::Railtie
    initializer "sg_lambda_rails.configure_rails_initialization" do |app|
      # Insert activerecord-refresh_connection middleware.
      app.config.middleware.insert_before ActionDispatch::Executor,
        ActiveRecord::ConnectionAdapters::RefreshConnectionManagement
    end
  end
end
