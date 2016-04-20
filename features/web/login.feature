Feature:          Web - Voting
                  As a user
                  I  want to use vote app
                  In order to place my vote

Background:
                  Given I am on home page
@web1
Scenario Outline: vote as a single user

                  When  I vote for <vote>
                  Then  I should see <share>

Examples:        Authorized user and  Login

                 | vote   | share  |
                 | "bug"  | "100"  |
