Feature:          Web - New Student Application
                  As a user
                  I  want to signup on upgrad website
                  In order to login and apply for courses

Background:
                  Given I am on home page
@web
Scenario:         Signup new user

                  When  I signup as "new" user
                  Then  I should see applicatio page

@web
Scenario Outline: apply to course

                 When  I register as new user
                 And   apply for <course>
                 Then  I should see <status>

Examples:        Authorized user and  Login

                | course             | status     |
                | "entrepreneurship" | "preview"  |
