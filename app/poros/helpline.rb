class Helpline
  attr  :id, 
        :name,
        :description,
        :website, 
        :phone_number,
        :sms_number,
        :web_chat_url,
        :topics,
        :country,
        :timezone


  def initialize(data)
    @id = data[:id] #|| "not available" #can this be refactored?
    @name = data[:name] #|| "not available"
    @description = data[:description] if data[:description]
    @website = data[:website] #|| "not available"
    @phone_number = data[:phoneNumber] #|| "not available"
    @sms_number = data[:smsNumber] #|| "not available"
    @web_chat_url = data[:webChatUrl] #|| "not available"
    @topics = data[:topics] #|| "not available"
    @country = data[:country] #|| "not available"
    @timezone = data[:timezone] #|| "not available"
  end
end