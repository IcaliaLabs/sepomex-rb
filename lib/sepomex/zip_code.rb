require 'sepomex/errors'
require 'sepomex/collection'

module Sepomex
  class ZipCode < OpenStruct
    include HTTParty

    base_uri "sepomex.icalialabs.com/api/v1"

    def self.where(options = {})

      response = get("/zip_codes", { query: options })

      if response.success?
        zip_codes = Sepomex::Collection.new(response["meta"]["pagination"])

        response["zip_codes"].each do |attributes|
          zip_codes << new(attributes)
        end

        zip_codes
      else
        raise_exception(response.code, response.body)
      end

    end

    class << self
      alias_method :all, :where
    end

    private

      def raise_exception(code, body)
        raise Sepomex::Exception::ServerError.new(code, body) if code >= 500
        raise Sepomex::Exception::ClientError.new(code, body) if code < 500
      end
  end
end
