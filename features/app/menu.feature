@tinyowlapp @tinyowliosapp

Feature: Navigation flow

Background:
      Given user is on home screen

Scenario: verify navigation flow by visiting all tabs through hamburger
    When user taps on hamburger
    And select various menu options
    Then respeactive screens should be displayed
