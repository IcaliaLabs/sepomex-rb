require 'pry'
require 'sepomex/errors'

module Sepomex
  class ZipCode < OpenStruct
    include HTTParty
            #{
            #"id": 1,
            #"d_codigo": "01000",
            #"d_asenta": "San Ángel",
            #"d_tipo_asenta": "Colonia",
            #"d_mnpio": "Álvaro Obregón",
            #"d_estado": "Distrito Federal",
            #"d_ciudad": "Ciudad de México",
            #"d_cp": "01001",
            #"c_estado": "09",
            #"c_oficina": "01001",
            #"c_cp": "",
            #"c_tipo_asenta": "09",
            #"c_mnpio": "010",
            #"id_asenta_cpcons": "0001",
            #"d_zona": "Urbano",
            #"c_cve_ciudad": "01"
        #},
    base_uri "sepomex-api.herokuapp.com/api/v1"

    def self.all
      zip_codes = []

      response = get("/zip_codes")

      if response.success?
        response["zip_codes"].each do |zip_code_hash|
          zip_codes << new(zip_code_hash)
        end

        zip_codes
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
