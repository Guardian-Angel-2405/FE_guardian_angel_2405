require 'rails_helper'

describe "User Update" do
  describe "when I visit the user_index_dashboard_path" do
    it "displays a button to edit account details" do
      user = User.create(email: "blackbeltslayer", first_name: "Nicky", last_name: "Rod", password: "daslayer", phone_number: "2022022020")
      
      visit user_index_dashboard_path(user)
      expect(current_path).to eq(user_index_dashboard_path)
      
      click_on "Edit Account Details"
      
      expect(current_path).to eq(login_path)
    end

    it "displays a form that allows you to change you account information" do
      user = User.create(email: "blackbeltslayer", first_name: "Nicky", last_name: "Rod", password: "daslayer", phone_number: "2022022020")

      visit user_path(user)
      expect(current_path).to eq(user_path(user))

      first_name = "Nicholas"
      last_name = "Rodriguez"
      email = "nickyrod@gmail.com"

      fill_in :first_name, with: first_name
      fill_in :last_name, with: last_name
      fill_in :email, with: email
      fill_in :password, with: user.password
      fill_in :phone_number, with: user.phone_number

      click_on "Update User"

      expect(current_path).to eq(user_dashboard_index_path)
      expect(page).to have_content("Welcome, #{first_name} #{last_name}!")

      expect(page).to have_content("Email: #{email}")
      expect(page).to have_content("First Name: #{first_name}")
      expect(page).to have_content("Last Name: #{last_name}")
      expect(page).to have_content("Phone Number: #{user.phone_number}")
    end
  end
end