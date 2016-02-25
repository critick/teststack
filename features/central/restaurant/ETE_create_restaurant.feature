@central @resttest
Feature: User Creates a Restaurant & fires and API to see if restaurant gets active on app

  Background:
    Given the correct number and password
    And I try to login
    And I should be able to login
    And Navigating to all restaurants page
    And Search box should be displayed

  Scenario: User Creates a Restaurant & fires and API to see if restaurant gets active on app
    When User creates restaurant using API
    And User is on profile page
    And Enter the restaurant profile fields
    And User is able to save changes
    And User is on Restaurant Timings page
    And Entered operational, item & delivery timings
    And I should be able to save successfully
    And I am on delivery areas page
    And I enter the delivery areas
    And User is on Miscellaneous page
    And Enter the mandatory fields
    And I am able to see logo field on Logs & Documents page
    And I upload image file
    And I am able to see uploaded image
    And User is on Restaurant Menu page
    And Entered menu details
    And Menu should be able to be pushed successfully
    And User is on Update Status page
    And Changed the state of restaurant to ACTIVE

    And User fires the api for getting status on app
    And Restaurant is ACTIVE in api

    Then When user has the unique restaurant id
    And User tries to delete the restaurant through API
    And User is able to delete a restaurant
