require 'rails_helper'
RSpec.describe do
  it "exists and has attribute" do
    incoming_data =    {
                        id: "c8e47108-3f87-4311-ab8f-7a3adf01ba06",
                        name: "988 Suicide & Crisis Lifeline",
                        description: "988 Suicide & Crisis Lifeline is a suicide prevention and crisis intervention service available to anyone in suicidal crisis or emotional distress of any kind in the United States via phone, text message (SMS) and online chat. Callers to the 988 Suicide & Crisis Lifeline are routed to the nearest accredited crisis center in the caller's area.  988 Suicide & Crisis Lifeline conversations are answered by staff at over 200 accredited crisis centers across the United States who provide callers with crisis counseling and mental health referrals.  The Lifeline’s Crisis and Text Chat Service routes chat visitors to a subnetwork of crisis centers accredited in providing online emotional support. Specialized services are available to Veterans (in partnership with VA and SAMHSA, calls route to Veterans Crisis Line), Spanish speakers, and LGBTQ+ youth.",
                        website: "https://988lifeline.org",
                        country: {
                          name: "United States",
                          code: "US",
                          emergencyNumber: "988"
                        },
                        timezone: "America/Puerto_Rico",
                        topics: [
                          "Suicidal thoughts",
                          "Abuse & domestic violence",
                          "Anxiety",
                          "Bullying",
                          "Dementia & Alzheimers",
                          "Depression",
                          "Eating & body image",
                          "Family",
                          "Gambling",
                          "Gender & sexual identity",
                          "Loneliness",
                          "Parenting",
                          "Pregnancy & abortion",
                          "Trauma & PTSD",
                          "Relationships",
                          "School & work",
                          "Self-harm",
                          "Sexual abuse",
                          "Stress",
                          "Substance use",
                          "Supporting others",
                          "Grief & loss",
                          "Physical illness"
                        ],
                        phoneNumber: "988",
                        smsNumber: "988",
                        webChatUrl: "https://988lifeline.org/chat/"
    }

    helpline = Helpline.new(incoming_data)
    require 'pry' ; binding.pry
    expect(helpline).to be_a(Helpline)
    expect(helpline.id).to be_a(String)
    expect(helpline.name).to be_a(String)
    expect(helpline.description).to be_a(String)
    expect(helpline.website).to be_a(String)
    expect(helpline.country).to be_a(Hash)
    expect(helpline.timezone).to be_a(String)
    expect(helpline.topics).to be_a(Array)
    expect(helpline.phone_number).to be_a(String)
    expect(helpline.sms_number).to be_a(String)
    expect(helpline.web_chat_url).to be_a(String)
  end
end
