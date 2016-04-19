require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'parallel'
require 'json'
require 'yard'
require 'fileutils'

ADB_SERIAL = ""  #device name please

Cucumber::Rake::Task.new(:auth_api) do |t|
  t.cucumber_opts = " -x APP=api
                      SERVER=https://dev.upgrad.com
                      features -p auth_api "
end

Cucumber::Rake::Task.new(:forumapi) do |t|
  t.cucumber_opts = " -x APP=api
                      SERVER=https://devforumapi.upgrad.com
                      features -p forumapi "
end


Cucumber::Rake::Task.new(:web) do |t|
  t.cucumber_opts = " DRIVER=poltergeist
                      APP=web
                      DEBUG=false
                      SERVER=http://demo.upgrad.com
                      features -p web "
end

Cucumber::Rake::Task.new(:webapp) do |t|
  t.cucumber_opts = " DRIVER=poltergeist
                      APP=web
                      DEBUG=true
                      SERVER=http://stagingapp.upgrad.com
                      features -p webapp "
end


Cucumber::Rake::Task.new(:android) do |t|
  t.cucumber_opts = " DRIVER=appium
                      APP=native
                      OS=android
                      SERVER=https://upgrad.com
                      features -p android "
end


Cucumber::Rake::Task.new(:prodlevel0) do |t|
  t.cucumber_opts = " -x APP=api
                      SERVER=http://upgrad.com
                      features -p prod_level0 "
end

#This Task will start appium and execute posapp tests
task :app do
  sh  './scripts/run_appium.sh'
  Rake::Task["android"].execute
end

task :stop_appium do

end

task :androidapp ,[:appname,:variant,:tag]  do |t, args|
  sh  "./scripts/run_appium.sh"
  sh  "./scripts/fetch_builds.sh #{args[:appname]} #{args[:variant]}"
  Rake::Task["app"].execute
end


task :serve_viewer do
  require "viewer"
  Sinatra::Application.run!
  #run SingingRain
end

task :push_viewer, :port do |t, args|
  require "restclient"
  require "json"
  require "viewer/parses_features"
  features = []
  HOST = "localhost"
  PORT = args[:port] ||"4567"
  PATH = "/projects/tests"
  URL  = "http://#{HOST}:#{PORT}#{PATH}"
  Dir.glob(File.join("features/","**/*.feature")).each do |feature_path|
      begin
             gherkin = Viewer::ParsesFeatures.new.parse(File.read(feature_path))
      rescue
             puts "Couldn't parse '#{feature_path}'"
             puts "Contents:"
             puts File.read(feature_path)
      end
      features << {:path => feature_path, :gherkin => gherkin}
  end
  RestClient.put "#{URL}/features/?authentication_code=#{File.read(".viewer").strip}", features.to_json, {:content_type => :json, :accept => :json}
  puts "completed pushing feaures to database"
end


task :drop_viewer, :port do |t,args|
  require "restclient"
  HOST = "localhost"
  PORT = args[:port] ||"4567"
  PATH = "/projects/tests"
  URL  = "http://#{HOST}:#{PORT}#{PATH}"
  RestClient.delete "#{URL}?authentication_code=#{File.read(".viewer").strip}"
  puts "completed dropping feaures from database"
end

task :cleanup do
  puts ' ========Deleting old reports ang logs========='
  FileUtils.rm_rf('reports')
  File.delete('cucumber_failures.log') if File.exist?('cucumber_failures.log')
  File.new('cucumber_failures.log', 'w')
    Dir.mkdir('reports')
end

task :parallel_run do
  puts '===== Executing Tests in parallel'
  system 'bundle exec parallel_cucumber features/ -o "-p parallel -p poltergeist -p pretty" -n 10'
  puts ' ====== Parallel execution finished and cucumber_failure.log created ========='
end

task :rerun do
  if File.size('cucumber_failures.log') == 0
    puts '==== No failures. Everything Passed ========='
  else
    puts ' =========Re-running Failed Scenarios============='
    system 'bundle exec cucumber @cucumber_failures.log -f pretty'
  end
end

task parallel_cucumber: [:cleanup, :parallel_run, :rerun]

Cucumber::Rake::Task.new(:sauce) do |t|
  t.cucumber_opts = 'features -p sauce --format pretty --profile html '
end

task :cuke_sniffer do
  sh 'bundle exec cuke_sniffer --out html reports/cuke_sniffer.html'
end

task :rubocop do
  sh 'bundle exec rubocop features/'
end

task checkup: [:cleanup, :cuke_sniffer]


task :docker do
  puts 'Preparing docker environment to run cucumber tests inside docker containers======='
  sh 'sh docker.sh'
end

task :load do
  puts 'stating load test'
  sh './load/gatling_local.sh'
end


YARD::Rake::YardocTask.new(:yard) do |t|
#t.files   = ['features/**/*.feature', 'features/**/*.rb']
end

#task :default => [:web]
