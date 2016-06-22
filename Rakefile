require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'parallel'
require 'json'
require 'yard'
require 'fileutils'

Cucumber::Rake::Task.new(:api) do |t|
  t.cucumber_opts = " -x APP=api
                      SERVER=http://google.com
                      features -p api "
end


Cucumber::Rake::Task.new(:web) do |t|
  t.cucumber_opts = " DRIVER=selenium
                      APP=web
                      DEBUG=false
                      SERVER=http://192.168.99.100:5000/
                      features -p web "
end


Cucumber::Rake::Task.new(:android) do |t|
  t.cucumber_opts = " DRIVER=appium
                      APP=native
                      OS=android
                      SERVER=http://192.168.99.100:5000
                      features -p android "
end

Cucumber::Rake::Task.new(:cloud) do |t|
  t.cucumber_opts = " DRIVER=appium
                      APP=native
                      OS=android
                      SERVER=http://google.com
                      features -p cloud "
end

#Run rake docker["web"] for web

task :docker, :task do |t, args|
  TASK = args[:task] ||"api"
  puts 'bringing containers up ....'
  sh  "sh ./scripts/docker/docker.sh #{TASK}"
end

ADB_SERIAL = ""  #device name

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
  FileUtils.rm_rf('reports')
  File.delete('cucumber_failures.log') if File.exist?('cucumber_failures.log')
  File.new('cucumber_failures.log', 'w')
    Dir.mkdir('reports')
end

task :rerun do
  if File.size('cucumber_failures.log') == 0
    puts 'no failures'
  else
    system 'bundle exec cucumber @cucumber_failures.log -f pretty'
  end
end

task parallel_cucumber: [:cleanup, :parallel_run, :rerun]


task :load do
  puts 'stating load test'
  sh 'sh ./load/gatling.sh'
end


YARD::Rake::YardocTask.new(:yard) do |t|
#t.files   = ['features/**/*.feature', 'features/**/*.rb']
end

#task :default => [:web]
