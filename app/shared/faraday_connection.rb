require 'dotenv/load'

module FaradayConnection
  class Connection
    class << self
      def conn
        Faraday.new(
          url: Constants::API_BASE_URL,
          headers: {'Authorization' => ENV['USERS_API_KEY']}
        )
      end
    end
  end

end