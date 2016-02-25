Feature:           Fetch Referral Details
                   As a TinyOwlApp user
                   I want to view my referral details
                   In Order to refer new users for TinyOwlApp

@level0 @prod_level0
Scenario Outline:  Verify Referral details
                   Given users are in <platform>
                   When  user request for referral details
                   Then  "referral_code","message" are fetched with <status>

Examples:          validate on different platform
                   | platform  | status |
                   | "ANDROID" | "200"  |
                   | "IOS"     | "200"  |
