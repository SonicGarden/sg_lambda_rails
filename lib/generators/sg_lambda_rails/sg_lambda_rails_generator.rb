class SgLambdaRailsGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)
  argument :project_name, type: :string

  def create_lamby_files
    template 'bin/_bootstrap'
    template 'bin/_build'
    template 'bin/_deploy'
    template 'bin/bootstrap'
    template 'bin/deploy'
    template 'bin/lambda_run_rake'

    template 'app.rb'
    template 'Dockerfile'
    template 'Dockerfile-build'
    template 'task.rb'
    template 'template.yaml'
  end
end
