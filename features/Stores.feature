Feature: Seeing and Creating Stores
  In order to organize my shopping
  Members should be able to 
  see and create stores

  Scenario: When there are no stores
    Given there are no stores
    And I go to the home page
    Then I should see the Add Store button
  
  Scenario: When there are stores
    Given there are stores
    And I go to the home page
    Then I should see a store
  
  Scenario: Creating a store
    Given there are no stores
    And I go to the home page
    When I click the Add Store button
    And I enter information into the form
    And I click save
    Then I should see the store I created
  
  Scenario: Deleting a store
    Given there are stores
    And I go to the home page
    And I delete a store
    Then I should not see the store
    And I go to the home page
    Then I should not see the store
    