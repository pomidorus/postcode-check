# frozen_string_literal: true

require 'postcodes_io'

module API
  class PostcodesService
    attr_reader :pio, :lsoa_checker, :postcodes_checker

    def initialize()
      @pio = Postcodes::IO.new
      @lsoa_checker = LsoaCheckerService.new
      @postcodes_checker = PostcodesCheckerService.new
    end

    def check(postcode)
      pc = pio.lookup(postcode)

      if pc.nil?
        return postcodes_checker.check(postcode) ? "#{postcode} is allowed" : 'No postcode found'
      end

      lsoa_checker.check(pc.lsoa) ? "#{postcode} is allowed" : "#{postcode} not allowed"
    end
  end
end
