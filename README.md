# Acceptance Test

### _Build Anywhere, Test Here_

This is Testing Framework based on BDD principles in Ruby ,you can use this for  

* design test cases with cucumber
* automate the tests with step definitions in ruby
* executable-specifications and live documentation of featurres
* execute tests suite for products Web , Mobile and API's interfaces


### How to Run Tests

From the project root directory
To run with for specific application  
```bash  
$cucumber DRIVER=<driver_name> APP=<app_type> SERVER=<server_name>
```

(Eg :to run only API type tests for forum over dev server)

```bash  
$cucumber DRIVER=chrome APP=web SERVER=https://dev.example.com -p forumapi
```

DRIVER can be firefox, chrome, poltergeist(headless) ,appium [working on IE ]
APP  can be web or native for Android and iOS native apps, default is web
SERVER can be any backend api server


profile can be any of the below

1. smoke      :run all smoke tests for all apis
2. forumapi   :run all tests for forumapi


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

for smoke api tests
```bash
$cucumber APP=api SERVER=http://api-release.example.com features -p smoke
```
to debug api tests
```bash
$cucumber APP=api DEBUG=true SERVER=http://api-release.example.com features -p level0
```
OR For Lazy Forks we have rake tasks


1.to run forum api tests
```bash
$rake forumapi
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
viewer will run at  as localhost:4567/projects/tests

4.push features into databasex
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

viewer will run at  as http://<server-name>/projects/tests

##Test cases documentation

```bash
$cucumber -d --format html --out report.html --format pretty
```

### Setup with Docker
We can run our cucumber scenario inside Docker containers. Assuming you have Docker installed.

```bash
$bundle exec rake docker
```

This will build Docker image 'teststack' and run cucumber web scenarios inside container 'teststack'.


### Performance Testing - Gatling
You can use Gatling setup to execute load tests against your endpoints. Simply change 'load/user-files/simulation/SampleLoadTEST.scala' file and puts your URL to Test as base URL.

          $ cd load
          $ sh gatling_local.sh
This will run load tests against your url. You are free to record new simulations. Once finished there will be link to HTML report at the end.

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
* Code smells           : Cuke sniffer ,Rubocop


##Pre-requisite and How to Setup

1.prepare system with package manager

install homebrew on mac , MacPort installation is not recommended
OR apt-get package manager on Ubuntu

Install gpg on system ,for mac

```bash
$brew install gpg
```
OR on Ubuntu

```bash
$sudo apt-get install gpg
```

2.Install Ruby on mac /ubuntu

Install the latest stable release of Ruby.
```bash
$\curl -sSL https://get.rvm.io | bash -s stable
$rvm install ruby
```

Make sure rvm is using the correct ruby by default
```bash
$rvm list
$rvm --default use 2.2.1
```

If you have an old ruby/rvm, you can examplee with
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
$git clone git@bitbucket.org:example_team/acceptance_test.git
$cd acceptance_tests
$bundle install
```

2.For Poltergeist,
On Mac

```bash
$brew install phantomjs
```
On Ubuntu,you  use below command ,to install phantomjs (2.2.1)
```bash
$PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
$curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2
$tar xvjf $PHANTOM_JS.tar.bz2
$mv $PHANTOM_JS /usr/local/share
$ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
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
## Wiki
https://bitbucket.org/example_team/acceptance_test/wiki/browse/

## Repo Owner
irfan@critick.io

## Contributing
