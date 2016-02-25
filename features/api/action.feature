Feature: Action API
         In order to restaurant to take action on the allocated order, Action API is called

@level0 @action
Scenario: Validate Restaurant User is able to Accept Order
          Given A Restaurant with POS enabled
          And User Places the order
          When Restaurant User Accept the Order
          Then CS User can verify the order logs for "Accepted Order"

@level0 @action
Scenario: Validate Restaurant User is able to Decline Order
          Given A Restaurant with POS enabled
          And User Places the order
          When Restaurant User Decline the Order
          Then CS User can verify the order logs for "Declined Order"
