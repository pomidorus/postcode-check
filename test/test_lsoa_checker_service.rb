# frozen_string_literal: true

require_relative '../services/lsoa_checker_service'
require 'test/unit'

class TestLsoaCheckerService < Test::Unit::TestCase
  def initialize(test)
    super
    @service = LsoaCheckerService.new
  end

  def test_check_lsoa
    assert_equal(true, @service.check('Southwark 034A'))
    assert_equal(true, @service.check('Lambeth 034A'))
    assert_equal(false, @service.check('Portsmouth 034A'))
  end
end
