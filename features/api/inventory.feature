@level0
Feature: Inventory management tests for Homemade
As a restaurant app
I want to manage homemade inventory

Scenario: verify false booking with release api
  Given user books homemade menu item using consumer app
  When  consumer app discard the cart and call release api
  Then  the response status code should be "200" for release api
  And   message should be returned as "Booking released successfully"

Scenario: verify inventory api
  Given restaurant web app call inventories api
  Then  the response status code should be "200" for inventories api
  And   payload should be returned

Scenario: verify inventory when order is cancelled
  Given platform for consumer app is set while placing homemade order
  When consumer app place order from homemade
  Then the response status code should be "200" for homemade order
  And homemade order details should be returned
  When order get cancel from omp then inventory should be released

Scenario: verify inventory when order is placed
  Given platform for consumer app is set while placing homemade order
  And inventory is recorded before placing order
  When consumer app place order from homemade
  Then the response status code should be "200" for homemade order
  And homemade order details should be returned
  And inventory should be updated after placing order
