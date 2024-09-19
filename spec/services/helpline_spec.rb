require 'rails_helper'

RSpec.describe HelplineService do
  it 'can #get_helplines' do

    query = HelplineService.get_helplines("us", limit = 20)
    helpline = query.first

    expect(query).to be_a Array
    expect(helpline).to be_a Hash

    expect(helpline).to have_key("id")
    expect(helpline["id"]).to be_a(String)

    expect(helpline).to have_key("name")
    expect(helpline["name"]).to be_a(String)

    expect(helpline).to have_key("description")
    expect(helpline["description"]).to be_a(String).or be_nil

    expect(helpline).to have_key("website")
    expect(helpline["website"]).to be_a(String)
  end
  
  it 'can #get_helpline_details' do
  helpline = {"id"=>"c8e47108-3f87-4311-ab8f-7a3adf01ba06", 
              "name"=>"988 Suicide & Crisis Lifeline", 
              "description"=>nil, "website"=>"https://988lifeline.org"}
  query = HelplineService.get_helpline_details(helpline["id"])
  expect(query).to be_a Hash

  expect(query).to have_key("id")
  expect(query["id"]).to be_a(String)

  expect(query).to have_key("name")
  expect(query["name"]).to be_a(String)

  expect(query).to have_key("description")
  expect(query["description"]).to be_a(String).or be_nil

  expect(query).to have_key("website")
  expect(query["website"]).to be_a(String)

  expect(query).to have_key("phoneNumber")
  expect(query["phoneNumber"]).to be_a(String)

  expect(query).to have_key("smsNumber")
  expect(query["smsNumber"]).to be_a(String)

  expect(query).to have_key("webChatUrl")
  expect(query["webChatUrl"]).to be_a(String)

  expect(query).to have_key("country")
  expect(query["country"]).to be_a(Hash)
  expect(query["country"]).to have_key("name")
  expect(query["country"]).to have_key("code")

  expect(query).to have_key("timezone")
  expect(query["timezone"]).to be_a(String)

  expect(query).to have_key("topics")
  expect(query["topics"]).to be_an(Array)
  end
end