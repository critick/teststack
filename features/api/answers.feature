Feature:           Forum Answers
                   As a upgrad user
                   I want to view/add/update/delete answers on upgrad forums

@smoke
Scenario Outline:  post answers to a question
                   Given  <type> user request for answers
                   Then  answers responds with <status_code>

Examples:          validate on types of request data
                   | type          | status_code |
                   | "existing"    | "200"       |
