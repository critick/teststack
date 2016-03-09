Feature:           User signup
                   As a user
                   I want to register to upgrad

Scenario Outline:  register for different users
                   When  <type>user request for register
                   Then  user is registered with <success> and <status>

Examples:          validate on different platforms
                   | type    | success     | status |
                   | "new"   | "true"      | "200"  |
