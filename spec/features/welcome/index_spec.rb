require 'rails_helper'

describe "Welcome Index", type: :feature do
  describe "when I visit the landing page (root path)" do
    it "displays the name of the app, a brief description, and the logo" do
      visit root_path
      expect(current_path).to eq(root_path)

      expect(page).to have_content("Welcome to")
      expect(page).to have_content("Guardian Angel")
      expect(page).to have_content("Develop your mental wellness with the guidance of Guardian Angel")
    end

    it "displays links for Log In, Sign Up, Emergency Services" do
      visit root_path
      expect(current_path).to eq(root_path)

      expect(page).to have_content("Log In")
      expect(page).to have_content("Sign Up")
      expect(page).to have_content("Emergency Services")
    end
    
    it "takes me to the Log In page when I click the Log In link" do
      visit root_path
      expect(current_path).to eq(root_path)

      click_link "Log In"
      expect(current_path).to eq(login_path)
    end

    it "takes me to the Sign Up page when I click the Sign In link" do
      visit root_path
      expect(current_path).to eq(root_path)

      click_link "Sign Up"
      expect(current_path).to eq(new_user_path)
    end

    it "takes me to the Emergency Services page when I click the Emergency Services link" do
      visit root_path
      expect(current_path).to eq(root_path)

      click_link "View Emergency Services"
      expect(current_path).to eq(emergency_services_path)
    end
  end
end