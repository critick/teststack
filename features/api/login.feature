Feature:           User actions
                   As a user
                   I want to login to upgrad

@auth_api @smoke_api

Scenario Outline:  login for different users
                   Given  <type> user request for login
                   When  params are <user_type> username , <pass_type> password and <session_type> session
                   Then  login responds with <success> ,<status_code> ,<header> and list of keys
                   |user_details    |
                   |username        |
                   |email           |
                   |firstname       |
                   |lastname        |
                   |phoneNumber     |
                   |roles           |
                   |referralCode    |
                   |name            |

Examples:          validate on types of request data
                   | type          | user_type   | pass_type | session_type | success | status_code | header      |
                   | "existing"    | "valid"     | "valid"   | "valid"      | "true"  | "200"       | "Auth-Token"|
