class JournalService
  # Always use the Heroku URL for the Sinatra service
  BASE_URL = 'https://throughline-sinatra-service-3b392556cf62.herokuapp.com'

  def self.connection
    Faraday.new(url: BASE_URL) do |faraday|
      faraday.adapter Faraday.default_adapter
      # SSL verification is not needed for Heroku-hosted services
    end
  end

  # Fetch specific entries based on the users ID
  def self.get_dates(user_id)
    
    connection = Faraday.new(url: "http://localhost:3000")

    response = connection.get("/api/v0/gratitudes/#{user_id}/dates")
    JSON.parse(response.body, symbolize_names: true)
    # handle_response(response)
  end
  
  # Fetch one entry based on the user and the entry id 
  def self.get_gratitude(user_id, entry_id)
    connection = Faraday.new(url: "http://localhost:3000")

    response = connection.get("/api/v0/gratitudes/#{user_id}/dates/#{entry_id}")
    JSON.parse(response.body, symbolize_names: true)
    # handle_response(response)
  end

  # Handle response to ensure it's parsed or handle an error
  def self.handle_response(response)
    if response.success?
      JSON.parse(response.body)
    else
      handle_error(response)
    end
  end

  # Handle error  
  def self.handle_error(response)
    Rails.logger.error("JournalService API Error: #{response.status} - #{response.body}")
    { error: "API request failed with status #{response.status}" }
  end
end
