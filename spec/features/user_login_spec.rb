require 'rails_helper'

RSpec.feature "User logins in and is redirected to index", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create! first_name: "Bob",
                         last_name: "Smith",
                         email: "bob@example.com",
                         password: "test",
                         password_confirmation: "test"
  end

  scenario "They can login with valid credentials" do
    # ACT
    visit '/login'
    fill_in 'email', with: 'bob@example.com'
    fill_in 'password', with: 'test'
    click_button 'Login'
    sleep(5)

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content 'Bob'
  end
end