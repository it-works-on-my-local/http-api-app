# app/services/api_service.rb
class ApiService
  include HTTParty

  base_uri 'https://example.com/api'

  def self.fetch_data(endpoint)
    response = get(endpoint)
    response.parsed_response
  rescue StandardError => e
    Rails.logger.error "Error fetching data from API: #{e.message}"
    nil
  end
end
