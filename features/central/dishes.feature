@central @dishes
Feature: Able to add, update and delete dishes
  In order to do add, update and delete dishes
  As a data head user
  I want dishes panel

  Scenario: user able to Add\create new dish
      Given "Data Head" user Logs on central
      And selects "Restaurants" panel
      And search for restaurant
      And view dishes for that restaurant
      When user create new dish
      Then "Dish Saved Successfully!" message should be shown on dish panel

  Scenario: user able to edit\update  dish
      Given "Data Head" user Logs on central
      And selects "Restaurants" panel
      And search for restaurant
      And view dishes for that restaurant
      When user edits dish
      Then "Dish Saved Successfully!" message should be shown on dish panel
