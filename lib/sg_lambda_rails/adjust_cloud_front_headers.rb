module SgLambdaRails
  class AdjustCloudFrontHeaders
    def initialize(app)
      @app = app
    end

    def call(env)
      cloudfront_forwarded_proto = env['HTTP_CLOUDFRONT_FORWARDED_PROTO']
      if cloudfront_forwarded_proto && cloudfront_forwarded_proto.length > 0
        env['HTTP_X_FORWARDED_PROTO'] = cloudfront_forwarded_proto
      end

      @app.call(env)
    end
  end
end
