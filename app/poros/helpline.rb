class Helpline
  attr_reader :id, :name, :description, :website, :phone_number, :sms_number, :web_chat_url, :topics, :country, :timezone

  def initialize(data)
    # Ensure data is a hash and not an array or other type
    data = data.is_a?(Hash) ? data : {}

    @id = data['id'] || data[:id] || "Not available"
    @name = data['name'] || data[:name] || "Not available"
    @description = data['description'].presence || "Description not available"
    @website = data['website'].presence || "Website not available"
    @phone_number = data['phoneNumber'] || data[:phoneNumber] || "Phone number not available"
    @sms_number = data['smsNumber'] || data[:smsNumber] || "SMS number not available"
    @web_chat_url = data['webChatUrl'] || data[:webChatUrl] || "Web chat not available"
    @topics = data['topics'].presence || ["No topics available"]
    @country = data['country'] || { 'name' => 'Unknown country', 'emergencyNumber' => 'Unknown' }
    @timezone = data['timezone'].presence || "Timezone not available"
  end

  def emergency_number
    @country['emergencyNumber'] || 'Unknown'
  end
end