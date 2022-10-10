require 'json'

module UserService
  class FetchRemoteUserService < ApplicationService
      def initialize(limit: nil, offset: nil)
        @limit = limit
        @offset = offset
      end

      def call
        UserService::CreateUserService.call(user_arr: fetch_remote_users)
      end


      private

      def fetch_remote_users
        users = FaradayConnection::Connection.conn.get('/users') do |req|
          req.params['limit'] = @limit if @limit.present?
          req.params['offset'] = @offset if @offset.present?
        end
        format_response users.body
      end

      def format_response(response)
        JSON.parse response
      end
  end

end