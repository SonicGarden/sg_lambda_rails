# frozen_string_literal: true

require_relative "sg_lambda_rails/version"

require 'aws-sdk-ssm'
require 'lambdakiq'
require 'activerecord-refresh_connection'
require 'dotenv/rails-now'

module SgLambdaRails
  class Error < StandardError; end
end
