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

    xit "displays the name of the app, a brief description, and the logo" do
      
    end
  end
end