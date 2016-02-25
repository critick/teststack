@magicfridge
Feature:           MagicFridge
                   As a TinyOwlApp user
                   I want to get personalised view of tinyowl


Scenario: fetch tags for user onboarding
                  Given  a new user onboards to tinyowl and calls for "tags"
                  Then "tags" are fetched with "200" and keys
                  | keys            |
                  | tags            |

Scenario: fetch moods for user onboarding
                  Given  a new user onboards to tinyowl and calls for "moods"
                  Then "moods" are fetched with "200" and keys
                  | keys            |
                  | anchors         |


Scenario: fetch greeting for user onboarding
                  Given  a new user onboards to tinyowl and calls for "greeting"
                  Then "greeting" are fetched with "200" and keys
                  | keys            |
                  | title           |
                  | description     |


Scenario: fetch daily_menu for user onboarding
                  Given  a new user onboards to tinyowl and calls for "daily_menu"
                  Then "daily_menu" are fetched with "200" and keys
                  | keys            |
                  | items           |
                  | title           |


Scenario: fetch item_details for user onboarding
                  Given  a new user onboards to tinyowl and calls for "item_details"
                  Then "item_details" are fetched with "200" and keys
                  | keys            |
                  | items           |
                  | chefs           |
                  | item_sizes      |


Scenario: fetch greeting for user onboarding
                Given  a new user onboards to tinyowl and calls for "add_ons_for_items"
                Then "add_ons_for_items" are fetched with "200" and keys
                | keys            |
                | items           |


Scenario: fetch greeting for user onboarding
                Given  a new user onboards to tinyowl and calls for "item_for_moods"
                Then "item_for_moods" are fetched with "200" and keys
                | keys            |
                | items           |
