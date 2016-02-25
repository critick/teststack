Feature:           Perform operations on questions
                   As a user
                   I want to view, post, update, bookmark and vote on answers in forums
                   In Order to interact with other students/ta

@forumapi
Scenario Outline:  view answers in forums
                   Given a <type>user
                   When  user request for question details
                   Then  "questions" are fetched with <status>

Examples:          validate on different platforms
                   | type    | status |
                   | "staff" | "200"  |
