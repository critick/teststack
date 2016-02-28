require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'parallel'
require 'json'
require 'yard'
require 'fileutils'

ADB_SERIAL = ""  #device name please

Cucumber::Rake::Task.new(:forumapi) do |t|
  t.cucumber_opts = " -x APP=api
                      SERVER=https://dev.upgrad.com
                      features -p forumapi "
end

Cucumber::Rake::Task.new(:web) do |t|
  t.cucumber_opts = " DRIVER=poltergeist
                      APP=web
                      SERVER=http://upgrad.com
                      features -p web "
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


YARD::Rake::YardocTask.new(:yard) do |t|
t.files   = ['features/**/*.feature', 'features/**/*.rb']
end

#task :default => [:web]
