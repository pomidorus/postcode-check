# frozen_string_literal: true

require_relative '../models/postcode'
require 'test/unit'

class TestPostcode < Test::Unit::TestCase
  def initialize(test)
    super
    @model = Postcode.new({ 'lsoa' => 'Southwark 1234' })
  end

  def test_lsoa
    assert_equal('Southwark 1234', @model.lsoa)
  end
end

