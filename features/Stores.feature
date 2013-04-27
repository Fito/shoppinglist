Feature: Seeing and Creating Stores
  In order to organize my shopping
  Members should be able to 
  see and create stores

  Scenario: When there are no stores
    Given there are no stores
    And I go to the home page
    Then I should see the Add Store button