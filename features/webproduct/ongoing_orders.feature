Feature:           Ongoing Orders Tracking
                   As a Consumer
                   I Want to view ongoing orders page
                   In Order to get updated status for all ongoing orders
                  
Background:
                   #user logins

Scenario:          new user visits ongoing orders page
                   When user visit ongoing order page
                   Then live orders page displayed

Scenario:          user places order and moved to ongoing orders page
                   When user performs place order
                   Then live orders page displayed
                   And  All Order details displayed

Scenario Outline:  user contacts tinyowl
                   When user contacts tinyowl
                   Then contact page with <data> displayed
                   And  user submits query with <status>
                   
Examples:          polling live status for order
                   | data         | status        |
                   | "autofilled" | "success"     |

Scenario Outline:  user receives ongoing orders updated status
                   When <agent> perform <action>
                   Then order status is <status>
                   And <web_status> displayed
                   
Examples:          polling live status for order
                   | agent  | action        | status       | web_status  |
                   | "user" | "place order" | "added"      | ""          |
                   | "pos"  | "accept"      | "confirmed"  | "confrmed"  |
                   | "user" | "on time"     | "delivered"  | "delivered" |
                 
                                  
