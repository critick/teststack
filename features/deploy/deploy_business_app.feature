
Feature:      In Order to update the latest pos app on pos devices
              As a tinyowl business admin ,after every new app release
              Needs to install the latest app from play store

Background:   Given I am on gmail login page
  
@deploy

Scenario:     Install tinywl app on devices
                  
              Given I am on gmail login page
              When  I load all device details from "data.csv"
              Then  I install "ToBusiness" from playstore
              
