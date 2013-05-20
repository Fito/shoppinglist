Feature: Seeing and Creating Items
  In order to organize my shopping
  Members should be able to 
  see and create items

  Scenario: When there are no items
    Given there are stores
    And I go to the home page
    Then I should see the Add Item button
  
  Scenario: Creating an item
    Given there are stores
    And I go to the home page
    And I click on the Add Item button
    And I enter information into the item form
    And I click save
    Then I should see the item I created
    