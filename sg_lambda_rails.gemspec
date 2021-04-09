# frozen_string_literal: true

require_relative "lib/sg_lambda_rails/version"

Gem::Specification.new do |spec|
  spec.name          = "sg_lambda_rails"
  spec.version       = SgLambdaRails::VERSION
  spec.authors       = ["ruzia"]
  spec.email         = ["ruzia@sonicgarden.jp"]

  spec.summary       = "AWS Lambda support for Rails"
  spec.description   = "Allow to deploy rails application to AWS Lambda."
  spec.homepage      = "https://github.com/SonicGarden/sg_lambda_rails"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/SonicGarden/sg_lambda_rails/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk-ssm"
  spec.add_dependency "lambdakiq"
  spec.add_dependency "activerecord-refresh_connection"
  spec.add_dependency "dotenv-rails"
  spec.add_dependency "lamby"

  # spec.add_development_dependency 'rake'
  # spec.add_development_dependency 'rspec', '~> 2.3'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
