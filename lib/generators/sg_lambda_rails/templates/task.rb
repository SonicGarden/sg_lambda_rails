def handler(event:, context:)
  event_task = event['task']
  puts "Invoke task lambda with '#{event}'"
  puts "target_task: #{event_task}"

  puts `bin/rails #{event_task}`
end
