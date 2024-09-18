require 'faraday'
require 'json'

class HelplineService
  BASE_URL = Rails.env.production? ? 'https://throughline-sinatra-service-3b392556cf62.herokuapp.com' : 'http://localhost:4567'

  # Helper method to set up Faraday connection
  def self.connection
    Faraday.new(url: BASE_URL) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.ssl[:verify] = false  # Disable SSL verification for localhost
    end
  end

  # Fetch helplines by country code
  def self.get_helplines(country_code, limit = 20)
    response = connection.get('/helplines', { country_code: country_code, limit: limit })
    handle_response(response)
  end

  # Fetch specific helpline details by ID
  def self.get_helpline_details(helpline_id)
    response = connection.get("/helplines/#{helpline_id}")
    handle_response(response)
  end
  # Handle response to ensure its parsed or if there is an error
  def self.handle_response(response)
    if response.success?
      JSON.parse(response.body)
    else
      handle_error(response)
    end
  end
  # Handle error  
  def self.handle_error(response)
    Rails.logger.error("HelplineService API Error: #{response.status} - #{response.body}")
    { error: "API request failed with status #{response.status}" }
  end
end