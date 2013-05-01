Given(/^there are no stores$/) do
  Store.delete_all
end

Given(/^there are stores$/) do
  Store.new(:name => 'Corner Store').save
end

Given(/^I go to the home page$/) do
  visit('/')
end

Then(/^I should see the Add Store button$/) do
  page.should have_content('Add Store')
end

When(/^I click the Add Store button$/) do
  click_on('Add Store')
end

When(/^I enter information into the form$/) do
  fill_in('name', {:with => 'My Store'} )
end

When(/^I click save$/) do
  click_on('Save')
end

Then(/^I should see the store I created$/) do
  page.should have_content('My Store')
end

Then(/^I should see a store$/) do
  store = Store.last
  page.should have_content(store.name)
end
