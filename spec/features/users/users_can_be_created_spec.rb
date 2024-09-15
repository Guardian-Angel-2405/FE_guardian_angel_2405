require 'rails_helper'

describe "User Registration Form" do
  describe "when I visit the users_new_path" do
    it "displays a form to create a new user" do
      visit new_user_path
      expect(current_path).to eq(new_user_path)

      expect(page).to have_content("Guardian Angel")
      expect(page).to have_content("Sign Up")
      expect(page).to have_content("Add Your Account Details")

      expect(page).to have_content("First Name:")
      expect(page).to have_content("Last Name:")
      expect(page).to have_content("Email:")
      expect(page).to have_content("Password:")
      expect(page).to have_content("Password Confirmation:")
      expect(page).to have_content("Phone Number:")
    end
    
    it "creates a new user when I fill out the form" do
      visit new_user_path
      expect(current_path).to eq(new_user_path)

      first_name = "Craig"
      last_name = "Jones"
      email = "craigjones@thebteam.com"
      password = "themenace"
      password_confirmation = "themenace"
      phone_number = "1-101-111-10101"

      fill_in :first_name, with: first_name
      fill_in :last_name, with: last_name
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      fill_in :phone_number, with: phone_number

      click_on "Create User"
      
      user = User.last

      expect(current_path).to eq(user_dashboard_index_path(user))
      expect(page).to have_content("Welcome, #{first_name} #{last_name}!")
    end
  end
end