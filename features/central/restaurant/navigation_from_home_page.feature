Feature: Navigation to different Panels

Background:
    Given the correct number and password
    When I try to login
    Then I should be able to login

Scenario: Click on Restaurant
    When Navigating to all restaurants page
    Then Search box should be displayed