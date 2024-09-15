require 'rails_helper'

describe "User Update" do
  describe "when I visit the user_dashboard_index_path" do
    it "displays a button to edit account details" do
      user = User.create!(email: "blackbeltslayer@gmail.com", first_name: "Nicky", last_name: "Rod", password: "daslayer", phone_number: "2022022020")

      visit user_dashboard_index_path(user.id)
      expect(current_path).to eq(user_dashboard_index_path(user.id))
      
      click_on "Edit Account Details"
      
      expect(current_path).to eq(edit_user_path(user.id))
    end

    it "displays a form that allows you to change you account information" do
      user = User.create!(email: "blackbeltslayer@gmail.com", first_name: "Nicky", last_name: "Rod", password: "daslayer", phone_number: "2022022020")

      visit edit_user_path(user.id)
      expect(current_path).to eq(edit_user_path(user.id))

      first_name = "Nicholas"
      last_name = "Rodriguez"
      email = "nickyrod@gmail.com"

      
      fill_in "First Name:", with: first_name
      fill_in "Last Name:", with: last_name
      fill_in "Email:", with: email

      click_on "Update User"

      expect(current_path).to eq(user_dashboard_index_path(user))
      expect(page).to have_content("Welcome, #{first_name}!")

      expect(page).to have_content("Email: #{email}")
      expect(page).to have_content("First Name: #{first_name}")
      expect(page).to have_content("Last Name: #{last_name}")
      expect(page).to have_content("Phone Number: #{user.phone_number}")
    end
  end
end