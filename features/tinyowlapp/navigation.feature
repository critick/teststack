@tinyowlapp @tinyowliosapp
Feature: Navigation
          test that app is working fine with different navigation paths
@app_navigation
  Scenario: verify navigation flow while placing restaurant order
    Given user is on restaurant screen
    When user select restaurant
    And select menu item and quantity
    And taps on checkout
    And fills contact details
    And select address to proceed
    Then make payment screen should be displayed
    When user taps on back arrow in title bar on payment screen
    And user taps on back arrow in title bar on choose address screen
    And user taps on back arrow in title bar on menu screen
    And user clear cart by hitting DISCARD
    Then user should be on restaurant screen

@app_navigation
  Scenario: verify navigation flow while placing dish order
    Given user is on dish screen
    When user taps on ORDER NOW
    And select quantity and taps on checkout
    And fills contact details
    And select address to proceed
    Then make payment screen should be displayed
    When user taps on back arrow in title bar on payment screen
    And user taps on back arrow in title bar on choose address screen
    Then user should be on dish screen

@app_navigation
  Scenario: verify navigation flow while placing homemade order
    Given user is on homemade screen
    When user ADD item and taps on checkout
    And fills contact details
    And select delivery slot to proceed
    And select address to proceed
    Then make payment screen should be displayed
    When user taps on back arrow in title bar on payment screen
    And user taps on back arrow in title bar on choose address screen
    And user taps on back arrow in title bar on cart
    Then user should be on homemade screen
