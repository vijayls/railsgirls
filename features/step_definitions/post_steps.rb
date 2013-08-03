When /^I got to create post page$/ do
  visit('/posts/new')
end
When /^I fill in post title "(.*?)"$/ do |title|
  fill_in 'post_title', :with => title
end
When /^I fill in post text "(.*?)"$/ do |text|
  fill_in 'post_text', :with => text
end
When /^I click on submit button$/ do
  click_button "Save Post"
end
Then /^I see post title "(.*?)"$/ do |title|
  page.find("li#title").has_text?(title)
end
When /^I see post text "(.*?)"$/ do |text|
  page.find("li#title").has_text?(text)
end
Given /^I login as admin$/ do
  visit('/admins/sign_in')
  fill_in 'admin_email', :with => 'admin@test.com'
  fill_in 'admin_password', :with => 'password'
  click_button 'Sign In'
end
Given /^I register as admin$/ do
  visit('/admins/sign_up')
  fill_in 'admin_email', :with => 'admin@test.com'
  fill_in 'admin_password', :with => 'password'
  fill_in 'admin_password_confirmation', :with => 'password'
  click_button 'Sign up'
end


