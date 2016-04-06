Feature:          Web - New Student Application
                  As a user
                  I  want to signup on upgrad website
                  In order to login and apply for courses


Scenario Outline: login to upgrad with explicit credentials

                  Given I am on home page
                  When  I login in with <email> and <password>
                  Then  I should see <status>

Examples:        Authorized user and  Login

                 | email                    | password   | status  |
                 | "irfan.ahmad@upgrad.com" | "password" | "home"  |


Scenario Outline: login to upgrad

                 Given I am on home page
                 When  I login to upgrad
                 Then  I should see <status>

Examples:        Authorized user and  Login

                | email                    | password   | status  |
                | "irfan.ahmad@upgrad.com" | "password" | "home"  |
