require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    User.create!(first_name: "A", last_name: "B", email: "test@gmail.com", password: "abc123", password_confirmation: "abc123")
  end
    scenario "User can login" do
    visit "/login"
    expect(page).to have_content 'Login'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'abc123'
    click_button('Submit')
    expect(page).to have_content('Signed in as')
    # DEBUG
    save_screenshot
    end
end
