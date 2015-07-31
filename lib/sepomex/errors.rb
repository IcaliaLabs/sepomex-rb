module Sepomex
  module Exception
    class APIError < StandardError
      attr_accessor :http_status, :response_body

      def initialize(http_status, response_body)
        message = " [HTTP #{http_status}] #{response_body}"
        super(message)
      end
    end

    # Any error with a 5xx HTTP status code
    class ServerError < APIError; end

    # Any error with a 4xx HTTP status code
    class ClientError < APIError; end
  end
end
