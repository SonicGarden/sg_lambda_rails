# frozen_string_literal: true

require_relative "sg_lambda_rails/version"

require 'dotenv/rails-now'
require 'aws-sdk-ssm'
require 'lambdakiq'

require 'sg_lambda_rails/rails'

module SgLambdaRails
  class Error < StandardError; end
end
