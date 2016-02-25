Feature:          Point of Sale Settings
                  As a Restaurant App Manager
                  I want to implement POS settings on Central
                  In Order to control the acess of Restaurant Agent on POS
                  
Background:       Given I am on login page

@posweb
Scenario Outline: login to POS under differrent POS settings

                  Given I am on login page
                  And   Settings are <app_status> , <service_status> and <email>
                  When  I login in with <email> and <password>
                  Then  I should see <status>

Examples:        Unauthorised user and valid login

                | app_status  | service_status | email        | password    | status                      |
                | "false"     | "false"        | "9999999995" | "password"  | "Mobile No. is Unauthoized"  |


Examples:        Authorised user and Valid login

                | app_status | service_status | email        | password   | status  |
                | "true"     | "true"         | "9999999993" | "password" | "home"  |


@posapp
Scenario Outline: login to POS with fixed POS settings

                  Given I am on login page
                  When  I login in with <email> and <password>
                  Then  I should see <status>
         
Examples:        Authorized user and  Login

                 | email        | password   | status  |
                 | "9999999993" | "password" | "home"  |
            


                    
