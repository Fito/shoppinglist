Then(/^I should see the Add Item button$/) do
  page.should have_content('+ item')
end

Given(/^I click on the Add Item button$/) do
  click_on('+ item')
end

Given(/^I enter information into the item form$/) do
  fill_in('item-name', {:with => 'My Item'} )
end

Then(/^I should see the item I created$/) do
  page.should have_content('My Item')
end
