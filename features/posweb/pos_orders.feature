Feature:          Point of Sale Order Managment
                  As a Restaurant Agent
                  I Want to view ,accept,decline and dispatch orders on POS
                  In Order to update the order status to Tinyowl
                  
Background:
                  When  I am logged in to POS as "restaurant agent"
                  Then  I should see "home"


Scenario Outline: Verify Fetching of orders

                  When  I click on <order_type>
                  Then  <order_type> orders are fetched

@posweb
Examples:        Verify Orders are fetched Correctly

                  | order_type  |
                  | "new"       |
                  | "preparing" |
                  
                   

#also add a step for count verification under section later
#under order pushed ,do all order card validation
                
@web @regression
Scenario Outline: Orders Flow to different sections

                  Given I am on home page
                  And   A <order_mode> order is placed by <user> with <status>
                  Then  Order pushed to POS <section> with <order_status>
                  #And   <section> count is <count_updated>

Examples:         Order Placed by consumer
                
                  | order_mode | user       | status      | section     | order_status |
                  | "pos"      | "consumer" | "received"  | "NA"        | "NA"         |
                  | "pos"      | "consumer" | "added"     | "New"       | "New"        |
                  | "pos"      | "CS"       | "confirmed" | "Preparing" | "Accepted"   |
                  | "pos"      | "consumer" | "delivered" | "History"   | "Delivered"  |
                  | "pos"      | "consumer" | "cancelled" | "History"   | "Cancelled"  |
                  | "pos"      | "CS"       | "cancelled" | "History"   | "Cancelled"  |

                  
@web
Scenario Outline: Order Activity by POS

                Given I am on home page
                And   Order pushed to POS <section> with <pos_section_status>
                And   On POS <pos_activity>
                Then  Order pushed to POS <new_section> with <new_order_status>
                And   Toast <message> appears
                #And   <section> count is <count_updated>

Examples:        All Order activities
                
                 | section     | pos_orders_status | pos_activity | new_section | new_order_status | message                 |
                 | "New"       | "New"             | "accepted"   | "Preparing" | "confirmed"      | "order accepted"        |
                 | "New"       | "New"             | "declined"   | "New"       | "added"          | "you will receive call" |
                 | "Preparing" | "Dispatch"        | "dispatch"   | "Preparing" | "confirmed"      | "order dispatched"      |
