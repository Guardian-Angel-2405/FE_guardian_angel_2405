require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create(email: "blackbeltslayer", first_name: "Nicky", password: "daslayer")

    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_dashboard_index_path(user.id))

    expect(page).to have_content("Welcome, #{user.first_name}")
  end
  
  it "cannot log in with bad credentials" do
    user = User.create(email: "blackbeltslayer@thebteam.com", password: "daslayer")

    visit login_path
  
    fill_in :email, with: user.email
    fill_in :password, with: "incorrect password"
  
    click_on "Log In"
  
    expect(current_path).to eq(login_path)
  
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end
