# frozen_string_literal: true

require 'sinatra'
require 'rspec'
require 'rack/test'
require 'capybara/rspec'
require_relative '../postcode'

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  Capybara.app = PostcodesValidator.new
  Capybara.default_driver = :selenium
end

RSpec.configure do |config|
  config.include RSpecMixin
  config.include Capybara::DSL
end
