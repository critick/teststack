# TestStack

### _Build Anywhere, Test Here_

[![Code Climate](https://codeclimate.com/github/critickio/teststack/badges/gpa.svg)](https://codeclimate.com/github/critickio/teststack)
[![Build Status](https://travis-ci.org/critickio/teststack.svg?branch=demo)](https://travis-ci.org/critickio/teststack)

This is Testing Framework based on BDD principles in Ruby ,you can use this for  

* design test cases with cucumber
* automate the tests with step definitions in ruby
* executable-specifications and live documentation of featurres
* execute tests suite for products Web , Mobile and API's interfaces


### How to Run Tests

From the project root directory
To run with for specific application  
```  
$ cucumber DRIVER=<driver_name> APP=<app_type> SERVER=<server_name>
```

(Eg :to run only API type tests for app running on example server)

```  
$ cucumber DRIVER=chrome APP=web SERVER=https://example.com -p api
```

* DRIVER can be firefox, chrome, poltergeist(for headless), appium
* APP  can be web or native for Android and iOS native apps, default is web
* SERVER can be any backend api server URL

profile can be any of the below

* api      :run all tests for api
* web      :run all tests for web


OR if you want to run a single feature only

```
$ cucumber DRIVER=poltergeist SERVER=https://test.example.com features/<feature_name>.feature
```

OR if you want to run all features with report
```
$ cucumber DRIVER=<driver_name> SERVER=<server_name> features/<feature_name>.feature --format html --out report.html
```

if you want to run all features with console output of test results
```
$ cucumber DRIVER=<driver_name> SERVER=<server_name> --format pretty
```

OR For Lazy Forks (like me) we have rake tasks

1.to run api tests
```
$ rake api
```

2.to run web tests
```
$ rake web
```

3.to run api tests
```
$ rake android
```

4.to run load tests
```
$ rake load
```


### Generate Test Documents online with viewer

To deploy viewer locally

1.make sure mongo db is installed and running
```
$  brew install mongodb
```

start mongodb by running ,
```
$ mongod
```

2.start the sinatra server

```
$ rake serve_viewer
```
3.push features into database
```
$ rake push_viewer
```
viewer will run at  as localhost:4567/projects/tests

4.push features into databasex
```
$ rake drop_viewer
```
To deploy viewer sinatra app on server

1.start unicorn server as a deamon ,it will start on port 8080

```
$ unicorn -c unicorn.rb -D
```
2.push features into database
```
$ rake push_viewer 8080
```

3.push features into database
```
$ rake drop_viewer 8080
```

viewer will run at  as http://<server-name>/projects/tests

##Test cases documentation

```
$ cucumber -d --format html --out report.html --format pretty
```

## Code documentation with Yard Server
```
$ yard server
```

### Setup with Docker
after installing docker ,you can run any test inside docker containers
```
$ rake docker["api"]    #for api tests
$ rake docker["web"]    #for web tests
```

This will build Docker image 'teststack' and run cucumber web scenarios inside container 'teststack'.


### Performance Testing - Gatling
You can use Gatling setup to execute load tests against your endpoints.
```
$ rake load
```


There is CI integration to plug it with jenkins.

### Integrations Supported in Library

* Test Runner           : Cucumber
* Test Implemenataion   : Ruby
* API Testing           : Rest-Client
* Web Testing           : Capybara ,Selenium Webdriver [chrome,firefox,poltergeist(headless)]
* Mobile App            : Appium (Android and iOS)
* Mobile Web            : Appium (Android Browser ,Chrome,iOS Safari)  
* Performance Testing   : Gatling
* Setup, Deployment     : Docker   
* Cloud Testing Infra   : SauceLab
* Feature documentation : sinatra app [viewer]
* Code documentation    : Yard


##Pre-requisite and How to Setup

1.prepare system with package manager

install homebrew on mac
OR apt-get package manager on Ubuntu

Install gpg on system ,for mac

```
$ brew install gpg
```
OR on Ubuntu

```
$ sudo apt-get install gpg
```

2.Install Ruby on mac /ubuntu

Install the latest stable release of Ruby.
```
$ curl -sSL https://get.rvm.io | bash -s stable
$ rvm install ruby
```

Make sure rvm is using the correct ruby by default
```
$ rvm list
$ rvm --default use 2.2.1
```

If you have an old ruby/rvm, you can examplee with
```
$ rvm get head
$ rvm autolibs homebrew
$ rvm install ruby
```

Check that it’s installed properly by printing the ruby version.
```
$ ruby --version
```

Update RubyGems and Bundler.

```
$ gem update --system
$ gem install --no-rdoc --no-ri bundler
$ gem update
$ gem cleanup
$ gem install bundler
```

clone the repo and run bundle install ,all dependencies will be added

```
$ git clone git@github.com:irfanah/TestStack.git
$ cd acceptance_tests
$ bundle install
```

2.For Poltergeist,
On Mac

```
$ brew install phantomjs
```
On Ubuntu,you  use below command ,to install phantomjs (2.2.1)

```
$ PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
$ curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
$ tar xvjf $PHANTOM_JS.tar.bz2
$ mv $PHANTOM_JS /usr/local/share
$ ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
```

3.For Chromedriver

```
$ gem install chromedriver
```

4.For Appium

Install appium_console gem.
```
$ gem uninstall -aIx appium_lib
$ gem uninstall -aIx appium_console
$ gem install --no-rdoc --no-ri appium_console
```
Install flaky gem.
```
$ gem uninstall -aIx flaky
$ gem install --no-rdoc --no-ri flaky
```

Install nodejs using brew.
```
$ brew update
$ brew upgrade node
$ brew install node
```
Node should be v0.10.26 or better

Install appium

```
$ npm install -g appium
$ appium
```


## Library documentation
* Appium
http://www.rubydoc.info/github/appium/ruby_lib/Appium/  
* Capybara
http://www.rubydoc.info/github/jnicklas/capybara/master
* SitePrism
http://www.rubydoc.info/gems/site_prism/frames
* Poltergeist
https://github.com/teampoltergeist/poltergeist
* Cucumber
http://www.rubydoc.info/github/cucumber/cucumber-ruby/
* Rest-Client
http://www.rubydoc.info/github/rest-client/rest-client/master
* Docker https://docs.docker.com/engine/quickstart/
* Gatling http://gatling.io/#/docs



## Troubleshooting

1.Appium installation issues

When using Appium.app make sure to set Appium -> Preferences… -> Check “Use External Appium Package” and set it to the path of Appium cloned from GitHub.

Fix permission errors. npm shouldn’t require sudo.

```
$ brew uninstall node
$ brew install node
$ rm -rf ./node_modules
$ rm -rf "/Users/`whoami`/.npm"
$ rm -rf /usr/local/lib/node_modules/
$ ./reset.sh --ios
$ ./reset.sh --android
```

If you see config errors, try cleaning git.
```
$ git clean -dfx; git reset --hard
```
### Directory structure

```
├── config
│   ├── cucumber.yml
│   ├── env.rb
│   ├── mobile
│   │   ├── android
│   │   └── ios
│   └── hook.rb
├── data
│   └── fixtures
├── helpers
├── features
│   ├── api
│   └── app
│   └── web
├── pages
│   ├── api
│   ├── app
│   ├── web
│   └── application.rb
├── step_definitions
│   ├── api
│   ├── app
│   └── web
├── load
├── lib
│   ├── reporting
│   ├── viewer
├── scripts
│   ├── docker
│   │   ├── Dockerfile
│   │   └── docker.sh
│   └── mobile
│       └── run_appium.sh
├── docker-compose.yml
├── Rakefile
└── wiki
```

## Wiki
https://github.com/irfanah/TestStack/wiki

## Repo Owner
irfan ahmad, irfan@critick.io

## Contributing
https://github.com/irfanah/TestStack/blob/master/CONTRIBUTING.md
