Feature:          User logins to tinyowl
                  As a Tinyowl App user
                  I want to login to TinyOwlApp
                  In Order to view your profile
@local
Scenario Outline: login with otp sms
                  Given user requested for login with <number>
                  And   OTP is received on <number> from tinyowl
                  When  OTP is sent to tinyowl
                  Then  login should be <status> for <number>

Examples:         predictions for each query

                  | number         | status        |
                  | "9999999991"   | "successful"  |
