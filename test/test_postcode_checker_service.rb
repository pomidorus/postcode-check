# frozen_string_literal: true

require_relative '../services/postcode_checker_service'
require 'test/unit'

class TestPostcodeCheckerService < Test::Unit::TestCase
  def initialize(test)
    super
    @service = PostcodeCheckerService.new
  end

  def test_check_lsoa
    assert_equal(true, @service.check('SH24 1AA'))
    assert_equal(true, @service.check('SH241AA'))
    assert_equal(true, @service.check('sh24 1aa'))
    assert_equal(true, @service.check('sh241aa'))

    assert_equal(false, @service.check('PH24 1AA'))
    assert_equal(false, @service.check('PH241AA'))
    assert_equal(false, @service.check('ph24 1aa'))
    assert_equal(false, @service.check('ph241aa'))
  end
end
