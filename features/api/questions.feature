Feature:           Forum Questions
                   As a upgrad user
                   I want to use questions on upgrad forums

@forumapi @smoke
Scenario Outline:  get all questions
                   When  <type> user request for questions
                   Then  questions responds with <status_code>

Examples:          validate on types of request data
                   | type          | status_code |
                   | "existing"    | "200"       |

@regression 
Scenario Outline: get questions with different params
                  Given params are <context>, <owner>, <bookmarked>, <page>, <order_by> and <pageSize>
                  When  <type> user request for questions
                  Then  questions responds with <status_code>  and list of keys
                  |QuestionDetails | type     |
                  |id              | "number" |
                  |question        | "string" |
                  |owner           | "string" |


Examples:          validate on types of request data
                  | type      | context | owner | bookmarked  | page  | order_by | pageSize | status_code |
                  | "existing"| ""      | "me"  | NA          | 1     | NA       | NA       |  200        |
                  | "existing"| ""      | "me"  | NA          | 99999 | NA       | NA       |  400        |


Scenario Outline: create one question
                  Given  <type> user request for creating questions
                  Then  questions responds with <status_code>

Examples:          validate on types of request data
                  | type          | status_code |
                  | "existing"    | "200"       |
