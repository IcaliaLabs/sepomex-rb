require 'sepomex/errors'

module Sepomex
  class ZipCode < OpenStruct
    include HTTParty

    base_uri "sepomex-api.herokuapp.com/api/v1"

    def self.all(options = {})
      response = get("/zip_codes", { query: options })

      if response.success?
        response["zip_codes"].map { |attributes| new(attributes) }
      else
        raise_exception(response.code, response.body)
      end
    end

    private

      def raise_exception(code, body)
        raise Sepomex::Exception::ServerError.new(code, body) if code >= 500
        raise Sepomex::Exception::ClientError.new(code, body) if code < 500
      end
  end
end
