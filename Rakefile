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
  t.cucumber_opts = " DRIVER=poltergeist
                      APP=web
                      DEBUG=false
                      SERVER=http://192.168.99.100:5000/
                      features -p web "
end

Cucumber::Rake::Task.new(:webapp) do |t|
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

YARD::Rake::YardocTask.new(:yard) do |t|
#t.files   = ['features/**/*.feature', 'features/**/*.rb']
end

#task :default => [:web]
