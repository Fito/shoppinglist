Given(/^there are no stores$/) do
  Store.delete_all
end

Given(/^I go to the home page$/) do
  visit('/')
end

Then(/^I should see the Add Store button$/) do
  page.should have_content('Add Store')
end