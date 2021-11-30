# frozen_string_literal: true

require 'sinatra'
require './services/api/postcodes_service'
require './services/lsoa_checker_service'
require './services/postcode_checker_service'

get '/' do
  erb :index
end

get '/postcode/check' do
  return 'No postcode provided' if params['pc'].empty?

  API::PostcodesService.new.check(params['pc'])
end
