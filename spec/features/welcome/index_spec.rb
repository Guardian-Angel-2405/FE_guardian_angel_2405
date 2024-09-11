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

    it "displays buttons for Log In, Sign Up, Emergency Services" do
      visit root_path
      expect(current_path).to eq(root_path)

      expect(page).to have_content("Log In")
      expect(page).to have_content("Sign Up")
      expect(page).to have_content("Emergency Services")
    end
    
    it "takes me to the Log In page when I click the Log In button" do
      visit root_path
      expect(current_path).to eq(root_path)

      click_button "Log In"
      expect(current_path).to eq(log_in_path)
    end

    it "takes me to the Sign Up page when I click the Sign Up button" do
      visit root_path
      expect(current_path).to eq(root_path)

      click_button "Sign Up"
      expect(current_path).to eq(new_user_path)
    end
    
    it "takes me to the Emergency Services page when I click the Emergency Services button" do
      visit root_path
      expect(current_path).to eq(root_path)

      click_button "Emergency Services"
      expect(current_path).to eq(services_path)
    end
  end
end