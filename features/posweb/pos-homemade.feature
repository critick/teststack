@web @chef
Feature:          Point of Sale Homemade restaurant
                  As a Homemade Restaurant Agent
                  I Want to add, edit chef on POS

Background:
                  Given I am on login page
                  When  I am logged in to POS for homemade as "restaurant agent"
                  Then  I should see "home"

Scenario: Add New Chef in homemade restaurant
  Given user is on Chef page
  When user click on "Add new Chef"
  And fills chef details
  And user click on "Save"
  Then "saved successfully!" message should be shown
  And new chef should be present in Chef API response

Scenario: Edit Chef in homemade restaurant
    Given user is on Chef page
    When user click on "Edit Chef"
    And update chef details
    And user click on "Save"
    Then "saved successfully!" message should be shown
