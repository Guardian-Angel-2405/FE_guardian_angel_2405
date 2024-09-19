require 'rails_helper'

RSpec.describe JournalService do
  it 'can make API call #get_dates' do
    user = User.create!(email: "blackbeltslayer@gmail.com", first_name: "Nicky", last_name: "Rod", password: "daslayer", phone_number: "2022022020")

    query = JournalService.get_dates(user.id)

    expect(query).to be_a Hash
    expect(query).to have_key(:data)
    expect(query[:data]).to be_a(Array)
  end
  
  it 'can make API call #get_gratitude' do
    user = User.create!(email: "blackbeltslayer@gmail.com", first_name: "Nicky", last_name: "Rod", password: "daslayer", phone_number: "2022022020")

    # entry = ?
    # query = JournalService.get_gratitude(user.id, entry.id)

    # expect(query).to be_a Hash
    # expect(query).to have_key(:data)
    # expect(query[:data]).to be_a(Array)
  end
end