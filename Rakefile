require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'parallel'
require 'json'
require 'yard'
require 'fileutils'

ADB_SERIAL = ""  #device name please

Cucumber::Rake::Task.new(:posweb) do |t|
  t.cucumber_opts = " DRIVER=firefox
                      APP=web
                      SERVER=http://restaurants-release.tinyowl.com
                      features -p posweb "
end


Cucumber::Rake::Task.new(:central) do |t|
  t.cucumber_opts = " DRIVER=chrome
                      APP=web
                      SERVER=https://central-release.tinyowl.com
                      features -p central "
end


Cucumber::Rake::Task.new(:pos_app) do |t|
  t.cucumber_opts = " DRIVER=appium
                      APP=native
                      SERVER=https://api-release.tinyowl.com
                      features -p posapp "
end

Cucumber::Rake::Task.new(:android) do |t|
  t.cucumber_opts = " DRIVER=appium
                      APP=native
                      SERVER=https://api-release.tinyowl.com
                      features -p android "
end

Cucumber::Rake::Task.new(:level0) do |t|
  t.cucumber_opts = " -x APP=api
                      SERVER=http://api-release.tinyowl.com
                      features -p level0 "
end

Cucumber::Rake::Task.new(:webproduct) do |t|
  t.cucumber_opts = " DRIVER=poltergeist
                      APP=web
                      SERVER=http://f-webproduct.tinyowl.com
                      features -p webproduct "
end

Cucumber::Rake::Task.new(:tinyowl_app) do |t|
  t.cucumber_opts = " DRIVER=appium
                      APP=native
                      OS=android
                      SERVER=https://api-release.tinyowl.com
                      features -p tinyowlapp "
end

Cucumber::Rake::Task.new(:tinyowl_ios_app) do |t|
  t.cucumber_opts = " DRIVER=appium
                      APP=native
                      OS=ios
                      SERVER=https://api-release.tinyowl.com
                      features -p tinyowliosapp "
end
Cucumber::Rake::Task.new(:prodlevel0) do |t|
  t.cucumber_opts = " -x APP=api
                      SERVER=http://api.tinyowl.com
                      features -p prod_level0 "
end

#This Task will start appium and execute posapp tests
task :posapp do
  sh  './scripts/run_appium.sh'
  Rake::Task["pos_app"].execute
end

task :stop_appium do

end


task :tinyowlapp ,[:appname,:variant,:tag]  do |t, args|
  sh  "./scripts/run_appium.sh"
  sh  "./scripts/fetch_builds.sh #{args[:appname]} #{args[:variant]}"
  Rake::Task["tinyowl_app"].execute
end

task :tinyowliosapp do
  sh  './scripts/run_appium.sh'
  Rake::Task["tinyowl_ios_app"].execute
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
  PATH = "/projects/tinyowl"
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
  PATH = "/projects/tinyowl"
  URL  = "http://#{HOST}:#{PORT}#{PATH}"
  RestClient.delete "#{URL}?authentication_code=#{File.read(".viewer").strip}"
  puts "completed dropping feaures from database"
end


YARD::Rake::YardocTask.new(:yard) do |t|
t.files   = ['features/**/*.feature', 'features/**/*.rb']
end


namespace :db do
  desc 'performs operations on tinyowl databases'

  task :restore, [:mode]  do |t, args|
    if args[:mode].eql?"full"
      sh %{'./scripts/db/tinyowl.app/mongo_restore.sh'
           './scripts/db/tinyowl.app/pg_restore.sh'
           './scripts/db/iam-service/pg_restore.sh'
           './scripts/db/location-service/pg_restore.sh'
           }
    elsif args[:mode].eql?"local"
       sh './scripts/db/restore_local_db.sh'
    else
      sh %{ ./scripts/db/tinyowl.app/mongo_backup.sh
            ./scripts/db/tinyowl.app/pg_backup.sh
          }
    end
  end

    task :backup, [:mode]  do |t, args|
      if args[:mode].eql?"full"
         sh %{'./scripts/db/tinyowl.app/mongo_backup.sh'
              './scripts/db/tinyowl.app/pg_backup.sh'
              './scripts/db/iam-service/pg_backup.sh'
              './scripts/db/location-service/pg_backup.sh'
              }
      else
        sh %{ ./scripts/db/tinyowl.app/mongo_backup.sh
              ./scripts/db/tinyowl.app/pg_backup.sh
            }
      end
    end

end


#task :default => [:web]
