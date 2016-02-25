@level0 @order_edit
Feature: As CS agent 
         I should be able to edit order

  Scenario Outline: Edit order item
    When  agent update order and removes item
    Then  response from update_order should be "200"
    And   should return <message> with <no_of_items>, <total_price>
    Examples:
    |message                    | no_of_items | total_price |
    |"Cart update successfully!"| 1            | 168         |