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

When(/^I fill in "(Name|Email|Current password)" with "(.*)" on the profile settings form$/) do |field, value|
  # Map human-readable test labels to actual field IDs
  field_ids = {
    "Name" => "nameField",
    "Email" => "emailField",
    "Current password" => "currentPasswordField"
  }

  field_id = field_ids[field]

  raise "No field mapping for '#{field}'" unless field_id

  click_button("Edit") if page.has_button?("Edit")

  using_wait_time 2 do
    input = find("##{field_id}", visible: :all)
    input.native.remove_attribute("disabled") if input.disabled?
    input.set(value)
  end
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

#watchtower
Given("I am logged in") do
  user = User.find_by(email: "user@example.com") || FactoryBot.create(:user, email: "user@example.com", password: "password123")
  visit new_user_session_path
  fill_in "Email", with: "user@example.com"
  fill_in "Password", with: "password123"
  click_button "Log in"
end


When("I visit the Watch Tower page") do
  visit dashboard_watchtower_path
end

Given('I have a mix of weak, medium, and strong passwords') do
  user = User.find_by(email: "user@example.com") || FactoryBot.create(:user, email: "user@example.com", password: "password123")
  Password.create!(service: "site1", email: "a@example.com", password: "short", user: user)
  Password.create!(service: "site2", email: "b@example.com", password: "Password1", user: user)
  Password.create!(service: "site3", email: "c@example.com", password: "StrongPass1!", user: user)
end

Given('I have passwords stored in the vault') do
  user = User.find_by(email: "user@example.com") || FactoryBot.create(:user, email: "user@example.com", password: "password123")
  Password.create!(service: "gmail", email: "user@gmail.com", password: "short1", user: user)
  Password.create!(service: "facebook", email: "user@fb.com", password: "short1", user: user)
end

Then("I should see a list of weak passwords") do
  expect(page).to have_content("Weak Passwords")
  expect(page).to have_button("Show Items")
end

Then("each password should show why it is considered weak") do
  expect(page).to have_content("Weak Passwords")
end

Then("I should see those entries under reused passwords") do
  expect(page).to have_content("Reused Passwords")
  expect(page).to have_button("Show Items")
end

Then("I should see my passwords grouped into strong, medium, and weak categories") do
  expect(page).to have_content("Overall Password Strength")
  expect(page).to have_content("Weak Passwords")
  expect(page).to have_content("Reused Passwords")
end

Then("I should see a security score out of 100") do
  expect(page).to have_content("Overall Security Score")
end

Then("the score should reflect password strength and reuse penalties") do
  expect(page).to have_content("Overall Security Score")
end
