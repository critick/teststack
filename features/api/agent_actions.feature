Feature: Agent Actions
         As the part of agent actions, the agent edits and add new items to the order.
         The agent get order details, agent activities, allocation activities on opening the order.


@level0 @agent_actions
Scenario: Validate the CS Agent is able to view order details, edit and add items to the order
          Given Order is in the Added state
          Then CS user is able to get order details
          And CS User should be able to get the Recursive Menu with "MAIN COURSE" and "LEBANESE SPICY CHICKEN"
          And CS User should be able to update the order and gets message "Cart update successfully!"
