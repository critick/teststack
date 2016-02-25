@homemade
Feature:            Homemade Menu for Lunch and Dinner
                    As a User
                    I want to view homemade dishes for each slot

@level0 @homemade_menu
Scenario Outline:	 Validate Homemade Menu Api
			             When User request for <restaurant_id> menu with <locality_id> and timings as <slot_start_time> to <slot_end_time>
			             Then Menu contains list of keys
									 | menu_categories |
									 | timings         |
                   | items           |
									 | item_sizes      |
									 | item_prices     |
									 | chefs           |
									 | inventories     |

Examples:          changing charges,taxes and 3pl flag
                   | restaurant_id              | locality_id | slot_start_time | slot_end_time |
                   | "5659a47b123fea02eb000068" | 12592       | 1450679400      | 1450679600    |

@level0 @menu_planner
Scenario:  Validate user can add a new item through menu planner
          When User sends a request to create a new item
          Then the response status code should be "200" for new item

@level0 @menu_planner
Scenario:  Validate user can update an existing item through menu planner
          When User updates the existing item
          Then The response status code should be "200" for item update
