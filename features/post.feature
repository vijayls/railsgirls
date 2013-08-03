Feature: create a post

  Scenario: Create a post
    Given I register as admin
    When I got to create post page
    And I fill in post title "My First Post"
    And I fill in post text "This is my first post."
    And I click on submit button
    Then I see post title "My First Post"
    And I see post text "This is my first post."

