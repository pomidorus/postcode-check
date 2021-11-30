# frozen_string_literal: true

require 'excon'
require_relative '../../models/postcode'

module API
  class PostcodesIO
    def lookup(postcode)
      postcode = postcode.gsub(/\s+/, '')
      response = Excon.get("https://api.postcodes.io/postcodes/#{postcode}")

      unless response.status == 404
        parsed_response = JSON.parse(response.body)
        return Postcode.new(parsed_response['result'])
      end

      nil
    end
  end
end
