require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create!(email: "blackbeltslayer@gmail.com", first_name: "Nicky", last_name: "Rod", password: "daslayer", phone_number: "2022022020")

    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)

    within(".input") do
      fill_in :email, with: user.email
      fill_in :password, with: user.password
    end

    click_on "Log In"

    expect(current_path).to eq(user_dashboard_index_path(user.id))

    expect(page).to have_content("Welcome, #{user.first_name}")
  end
  
  it "cannot log in with bad credentials" do
    user = User.create!(email: "blackbeltslayer@gmail.com", first_name: "Nicky", last_name: "Rod", password: "daslayer", phone_number: "2022022020")

    visit login_path
  
    within(".input") do
      fill_in :email, with: user.email
      fill_in :password, with: "incorrect password"
    end
  
    click_on "Log In"
  
    expect(current_path).to eq(login_path)
  
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end
