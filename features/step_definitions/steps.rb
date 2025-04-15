# features/step_definitions/steps.rb

Given('I am on the signup page') do
  visit new_user_registration_path
end

Given('I am on the login page') do
  visit new_user_session_path
end

Given('I am on the forgot password page') do
  visit new_user_password_path
end

Given('I am a registered user') do
  @user = FactoryBot.create(:user, email: 'user@example.com', password: 'password123')
end

Given('I am signed in') do
  visit new_user_session_path
  fill_in 'Email', with: 'user@example.com'
  fill_in 'Password', with: 'password123'
  click_button 'Log in'
end

When('I visit the login page') do
  visit new_user_session_path
end

When('I visit the vault page') do
  visit '/'
end

When('I visit the profile settings page') do
  visit '/dashboard/profile'
end

When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value, match: :first
end

When('I change {string} to {string}') do |field, new_value|
  fill_in field, with: new_value, match: :first
end

When('I click {string}') do |label|
  click_button(label) rescue click_link(label)
end

When('I open the actions menu for {string}') do |service|
  expect(page).to have_selector('button.dropdown-toggle', wait: 5)
  find('button.dropdown-toggle', match: :first).click
end

When('I click "Edit" next to {string}') do |service|
  find('a', text: 'Edit').click
end

When('I click "Delete" next to {string}') do |service|
  find('a', text: 'Delete').click
end

When('I refresh the page') do
  visit current_path
end

Given('I have a credential saved for {string}') do |service|
  Password.create!(service: service, email: "testuser@example.com", password: "supersecret", user: @user)
end

Then('I should see {string}') do |text|
  expect(page).to have_content(text)
end

Then('I should not see {string}') do |text|
  expect(page).not_to have_content(text)
end

Then('I should see {string} listed') do |string|
  expect(page).to have_content(string)
end

Then('I should see {string} next to {string}') do |string, string2|
  expect(page).to have_xpath("//tr[td[contains(.,'#{string2}')]]/td[contains(.,'#{string}')]")
end

Then('I should not see {string} on the page') do |string|
  expect(page).not_to have_content(string)
end
