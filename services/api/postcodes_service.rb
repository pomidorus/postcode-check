# frozen_string_literal: true

require 'postcodes_io'

module API
  class PostcodesService
    attr_reader :pio, :lsoa_checker, :postcode_checker

    def initialize(pio, lsoa_checker, postcode_checker)
      @pio = pio
      @lsoa_checker = lsoa_checker
      @postcode_checker = postcode_checker
    end

    def check(postcode)
      pc = pio.lookup(postcode)

      if pc.nil?
        return postcode_checker.check(postcode) ? "#{postcode} is allowed" : 'No postcode found'
      end

      lsoa_checker.check(pc.lsoa) ? "#{postcode} is allowed" : "#{postcode} not allowed"
    end
  end
end
