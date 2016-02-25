# Acceptance Test

### _Build your app Anywhere, just Break them Here_

This is Testing Framework based on BDD principles in Ruby,used for manual test design, automated functional testing of products across Web, Mobile and API's and maintaining their live documentation open for everyone.

[![Build Status](https://travis-ci.org/natritmeyer/site_prism.png)](https://travis-ci.org/Flutterbee/example-web)

### How to Run Tests

From the project root directory
To run with for specific application  
```bash  
$cucumber DRIVER=<driver_name> APP=<app_type> SERVER=<server_name>
```

(Eg :to run only central tests on chrome browser over release server)

```bash  
$cucumber DRIVER=chrome APP=web SERVER=https://api.example.com -p central
```

DRIVER can be firefox, chrome, poltergeist(headless) ,appium [we are working on IE ]
APP  can be web or native for Android and iOS native apps, default is web
SERVER can be any backend api server


profile can be any of the below

1. api        :run all api tests
2. level0     :run all level0 api tests


OR if you want to run a single feature only

```bash
$cucumber DRIVER=poltergeist SERVER=https://api-release.example.com features/<feature_name>.feature
```

OR if you want to run all features with report
```bash
$cucumber DRIVER=<driver_name> SERVER=<server_name> --format html --out report.html
```

if you want to run all features with console output of test results
```bash
$cucumber DRIVER=<driver_name> SERVER=<server_name> --format pretty
```

for level0 api tests
```bash
$cucumber APP=api SERVER=http://api-release.example.com features -p level0
```
to debug api tests
```bash
$cucumber APP=api DEBUG=true SERVER=http://api-release.example.com features -p level0
```
OR For Lazy Forks we have rake tasks
1.to run all features for for production ci
```bash
$rake prodci
```
2.to run central tests
```bash
$rake central
```
3.to run pos android app tests
```bash
$rake posapp
```
4.to run level0 api tests
```bash
$rake level0
```

### Database backup and restore

To take db backup to s3  from release server ,
go to root and run

```bash
$rake db:backup[full]
```

To restore all db from s3
```bash
$rake db:restore[full]
```

To restore only example.app db from s3
```bash
$rake db:restore
```

To restore all db from local dump
```bash
$rake db:restore[local]
```

### Generate Test Documents online with viewer

To deploy viewer locally

1.make sure mongo db is installed and running
 brew install mongodb

start mongodb by running ,
```bash
$mongod
```

2.start the sinatra server

```bash
$rake serve_viewer
```
3.push features into database
```bash
$rake push_viewer
```
viewer will run at  as localhost:4567/projects.example

4.push features into database
```bash
$rake drop_viewer
```
To deploy viewer sinatra app on server

1.start unicorn server as a deamon ,it will start on port 8080

```bash
$unicorn -c unicorn.rb -D
```
2.push features into database
```bash
$rake push_viewer 8080
```

3.push features into database
```bash
$rake drop_viewer 8080
```

viewer will run at  as http://<server-name>/projects.example

##Test cases documentation

```bash
$cucumber -d --format html --out report.html --format pretty
```

##Pre-requisite and How to Setup

1.Install Ruby on mac /ubuntu

Install the latest stable release of Ruby.
```bash
$\curl -sSL https://get.rvm.io | bash -s stable
$rvm install ruby
```

Make sure rvm is using the correct ruby by default
```bash
$rvm list
$rvm --default use 2.2.0
```

If you have an old ruby/rvm, you can upgrade with
```bash
$rvm get head
$rvm autolibs homebrew
$rvm install ruby
```

Check that it’s installed properly by printing the ruby version.
```bash
$ruby --version
```

Update RubyGems and Bundler.

```bash
$gem update --system
$gem install --no-rdoc --no-ri bundler
$gem update
$gem cleanup
$gem install bundler
```

clone the repo and run bundle install ,all dependencies will be added
```bash
$git clone git@github:Flutterbee/example-web-automation.git
$cd example-web-automation
$bundle install
```

2.For Poltergeist,
On Mac : Use HomeBrew ,MacPort installation is not recommended

```bash
$brew install phantomjs
```
On Ubuntu,you  use below command
```bash
$sudo apt-get install phantomjs
```

3.For Chromedriver

```bash
$gem install chromedriver
```

4.For Appium

Install appium_console gem.
```bash
$gem uninstall -aIx appium_lib
$gem uninstall -aIx appium_console
$gem install --no-rdoc --no-ri appium_console
```
Install flaky gem.
```bash
$gem uninstall -aIx flaky
$gem install --no-rdoc --no-ri flaky
```

Install nodejs using brew.
```bash
$brew update
$brew upgrade node
$brew install node
```
Node should be v0.10.26 or better

Install grunt.
```bash
$npm install -g grunt grunt-cli
```
Install ant .
Install maven 3.1.1. Old maven will not work.

Clone appium
```bash
$git clone git://github.com/appium/appium.git
$cd appium; ./reset.sh
```
to reset for a specific version and verbose logging
```bash
$cd appium ;./reset.sh --android --verbose
```
now start appium.
```bash
$node .
```

## Library documentation
1.Appium
http://www.rubydoc.info/github/appium/ruby_lib/Appium/
2.Capybara
http://www.rubydoc.info/github/jnicklas/capybara/master
3.SitePrism
http://www.rubydoc.info/gems/site_prism/frames
4.Poltergeist
https://github.com/teampoltergeist/poltergeist
5.Cucumber
http://www.rubydoc.info/github/cucumber/cucumber-ruby/
https://github.com/cucumber/cucumber/wiki


## Troubleshooting

1.Appium installation issues

When using Appium.app make sure to set Appium -> Preferences… -> Check “Use External Appium Package” and set it to the path of Appium cloned from GitHub.

Fix permission errors. npm shouldn’t require sudo.

```bash
$brew uninstall node
$brew install node
$rm -rf ./node_modules
$rm -rf "/Users/`whoami`/.npm"
$rm -rf /usr/local/lib/node_modules/
$./reset.sh --ios
$./reset.sh --android
```

If you see config errors, try cleaning git.
```bash
$git clean -dfx; git reset --hard
```
## How to add Tests
https://github.com/Flutterbee/example-web-automation/wiki/Adding-New-Tests
## Wiki
https://github.com/Flutterbee/example-web-automation/wiki

## Repo Owner
qa@example.com

## Contributing

https://github.com/Flutterbee/example-web-automation/blob/master/CONTRIBUTING.md
