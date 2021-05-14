module SgLambdaRails
  class AdjustHostHeader
    def initialize(app)
      @app = app
      @domain_name = File.read(".domain_name.#{ENV.fetch('RAILS_ENV')}").strip
    end

    def call(env)
      env['HTTP_HOST'] = @domain_name

      @app.call(env)
    end
  end
end
