Feature:           Store and Fetch Address on app
                   As a TinyOwlApp user
                   I want to add,view and update my address details
                   In Order to place new orders

@level0 @prod_level0
Scenario Outline:  fetch users address
                   When  user request for address details on <platform>
                   Then  "addresses" are fetched with <status>

Examples:          validate on different platform
                   | platform  | status |
                   | "ANDROID" | "200"  |
                   | "IOS"     | "200"  |

@level0
Scenario Outline: add new users address
                 When  user save new address details on <platform>
                 Then  "addresses" are saved with <address_id> and <status>
Examples:          validate on different platform
                 | platform  | status | address_id |
                 | "ANDROID" | "200"  | "id"       |
                 | "IOS"     | "200"  | "id"       |
