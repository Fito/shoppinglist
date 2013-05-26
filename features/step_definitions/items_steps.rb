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

Given(/^there are items$/) do
  store = Store.new(:name => 'Corner Store')
  store.save
  Item.new(:name => 'my item', :store_id => store.id).save
end

Given(/^there is a Done item$/) do
  Item.last.update_attribute('done', true)
end

Then(/^I should see the (.*) button$/) do |button|
  page.should have_content(button)  
end

Given(/^I click on an item$/) do
  find('.item').click
end

Then(/^I click on the Done button$/) do
  find('.done').click
end

Then(/^I click on the Undo button$/) do
  find('.undo').click
end

Then(/^I should see the item marked as done$/) do
  find('.item.done')
end

Then(/^I should see the item marked as undone$/) do
  page.should_not have_selector('.item.done')
end
