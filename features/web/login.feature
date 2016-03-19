Feature:          Marketing Website
                  As a user
                  I  want to register on upgrad website
                  In order to use upgrad platform

@web1
Scenario Outline: login to upgrad with explicit credentials

                  Given I am on home page
                  When  I login in with <email> and <password>
                  Then  I should see <status>

Examples:        Authorized user and  Login

                 | email                    | password   | status  |
                 | "irfan.ahmad@upgrad.com" | "password" | "home"  |

@web
Scenario Outline: login to upgrad

                 Given I am on home page
                 When  I login to upgrad
                 Then  I should see <status>

Examples:        Authorized user and  Login

                | email                    | password   | status  |
                | "irfan.ahmad@upgrad.com" | "password" | "home"  |
