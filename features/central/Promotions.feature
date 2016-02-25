@promotion
Feature: Promotions Panel

Background:
  Given "Marketing Head" user Logs on central
  When I Open Promotions panel


Scenario: Create Inactive Display Type Promotion without uploading an Image.

  When I click_Add_Button "add_new"
  And I fill Valid Details
  Then I should able to click the button "Go to promotions"
 
Scenario: Create Single Restaurant Type Promotion without uploading an Image.
  When I create Single Restaurant Typw Promotion
  Then I should able to click the button

Scenario: Create Promotion with invalid Date.
  When I create Multiple Restaurant Type Promotion
  Then I should able to see the alert "Invalid date values"

Scenario: Create Promotion without Name.
  When I create Display Restaurant Type Promotion
  Then I should able to see the alert "Please enter a promotion name."

Scenario: Edit the Promotion
  When I click_edit_button "Edit"
  Then I should able to click the button "Go to promotions"

Scenario: Create Active Display Type Promotion
  When I Create Display Type Promotion
  Then I should able to click the button "Go to promotions"