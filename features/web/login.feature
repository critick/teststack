Feature:          Web - Existing Student
                  As a user
                  I  want to  login on upgrad website
                  In order to view my application status

Background:
                  Given I am on home page

@web1
Scenario Outline: login to upgrad with explicit credentials

                  When  I login in with <email> and <password>
                  Then  I should see <status>

Examples:        Authorized user and  Login

                 | email                    | password   | status  |
                 | "irfan.ahmad@upgrad.com" | "password" | "home"  |

@web
Scenario Outline: login to upgrad

                 When  <user_type> user login to upgrad
                 Then  I should see <status>

Examples:        Authorized user and  Login

                | user_type   | status  |
                | "existing"  | "home"  |


@web
Scenario Outline: preview the application

                  When  <user_type> user login to upgrad
                  And   views <course> details
                  And   Apply to <course>
                  Then  I should see <status>

Examples:        students for different courses

                  | user_type   | course              | status     |
                  | "existing"  | "entherprenurship"  | "preview"  |
