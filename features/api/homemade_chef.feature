@level0 @homemadec @homemade
Feature: user able to add, update chef for homemade restaurant
  As homemade content team member
  I want to add chef to homemade restaurant

Scenario:  add chef to homemade restaurant
  Given chef details are provided
    When chef api requested to "add" chef
    Then the response status code should be "200" for chef api
    And new chef should created

Scenario:  edit chef of homemade restaurant
  Given chef details are provided
    When chef api requested to "edit" chef
    Then the response status code should be "200" for chef api
    And chef should be updated
