require 'rails_helper'
RSpec.describe do
  it "exists and has attribute" do
    incoming_data =    { } # Whatever data is coming in from the Journal api

    journal = Journal.new(incoming_data)
    expect(journal).to be_a(Journal)

    #the following are all going to test attribute data types of what you will make the poro
    expect(journal.id).to be_a(String)
    expect(journal.date).to be_a(String)
    expect(journal.entry).to be_a(String)
    expect(journal.affirmation).to be_a(String)
  end
end
