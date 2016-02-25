@bank @central
Feature: CRUD operations on Bank panel
  As a Data Head
  I want to add, update and delete banks on TinyOwl Central using bank panel

  Scenario: user able to Add/create new Bank
    Given "Data Head" user Logs on central
    And selects "Banks" panel
    When user create new bank
    Then "Bank created successfully !!" message should be shown on bank panel

  Scenario: user able to edit \ update  Bank
    Given "Data Head" user Logs on central
    And selects "Banks" panel
    When user edits "HDFC" bank
    Then "Bank updated successfully !!" message should be shown on bank panel
