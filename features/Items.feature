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

  Scenario: Marking an item as done
    Given there are items
    And I go to the home page
    And I click on an item
    Then I should see the Done button
    And I click on the Done button
    Then I should see the item marked as done
  
  Scenario: Marking an item as undone
    Given there are items
    And there is a Done item
    And I go to the home page
    And I click on an item
    Then I should see the Undo button
    And I click on the Undo button
    Then I should see the item marked as undone
  
    