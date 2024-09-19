class JournalService
  # Always use the Heroku URL for the Sinatra service
  BASE_URL = 'https://throughline-sinatra-service-3b392556cf62.herokuapp.com'

  # Fetch specific entries based on the users ID
  def self.get_dates(user_id)
    response = conn.get("/api/v0/gratitudes/#{user_id}/dates")
    parse_data(response)
    handle_response(response)
  end
  
  # Fetch one entry based on the user and the entry id 
  def self.get_gratitude(user_id, entry_id)
    response = conn.get("/api/v0/gratitudes/#{user_id}/dates/#{entry_id}")
    parse_data(response)
    handle_response(response)
  end

  # Handle response to ensure it's parsed or handle an error
  def self.handle_response(response)
    if response.success?
      parse_data(response)
    else
      handle_error(response)
    end
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    connection = Faraday.new(url: "http://localhost:3000")
  end
  # Handle error  
  def self.handle_error(response)
    Rails.logger.error("JournalService API Error: #{response.status} - #{response.body}")
    { error: "API request failed with status #{response.status}" }
  end
end
