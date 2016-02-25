namespace :rerun_failed_features do
  FAILING_SCENARIOS_FILENAME = 'failing_scenarios.txt'

  task :record do
    # run cucumber and record failing scenarios to the file
    # exit 0, we don't want to fail here
    exec("bundle exec cucumber -f rerun --out #{FAILING_SCENARIOS_FILENAME}; exit 0")
  end

  task :rerun do
    # we don't need to run cucumber again if all scenarios passed
    unless File.zero?("#{FAILING_SCENARIOS_FILENAME}")
      # run cucumber with failing scenarios only
      exec("bundle exec cucumber @#{FAILING_SCENARIOS_FILENAME}")
    end
  end
end
