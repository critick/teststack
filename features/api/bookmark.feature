Feature:           Forum Bookmark Question
                   As a upgrad user
                   I want to bookmark questions on upgrad forums

@forumapi @smoke
Scenario Outline:  perform bookmark on a question
                   When  <type> user request for <operation> bookmark
                   Then  bookmark responds with <statusCode>

Examples:          validate on types of request data
                  | type          | operation | statusCode  |
                  | "existing"    | "add"     | "201"       |
                  | "existing"    | "delete"  | "204"       |
