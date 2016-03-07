Feature:           Forum Questions
                   As a upgrad user
                   I want to use questions on upgrad forums

@forumapi @smoke

Scenario Outline:  get questions
                   Given  <type> user request for questions
                   Then  questions responds with <status_code>

Examples:          validate on types of request data
                   | type          | status_code |
                   | "existing"    | "200"       |
