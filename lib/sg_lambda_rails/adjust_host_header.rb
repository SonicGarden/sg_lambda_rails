module SgLambdaRails
  class AdjustHostHeader
    def initialize(app)
      @app = app
    end

    def call(env)
      env['HTTP_HOST'] = env.fetch('DOMAIN_NAME')

      @app.call(env)
    end
  end
end
