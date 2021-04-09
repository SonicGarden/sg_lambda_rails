require_relative 'config/boot'
require 'dotenv' ; Dotenv.load ".env.#{ENV['RAILS_ENV']}"
require_relative 'config/application'
require_relative 'config/environment'

Rails.application.load_tasks

def handler(event:, context:)
  event_task = event['task']
  puts "Invoke task lambda with '#{event}'"
  puts "target_task: #{event_task}"

  if (m = event_task.match(/(.+)\[(.*)\]/))
    task = m[1]
    args = m[2].split(',').map(&:strip)
    Rake::Task[task].invoke(*args)
    Rake::Task[task].reenable
  else
    Rake::Task[event_task].invoke
    Rake::Task[event_task].reenable
  end
end
