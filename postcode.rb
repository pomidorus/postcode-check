# frozen_string_literal: true

require 'sinatra'
require './services/api/postcodes_service'
require './services/lsoa_checker_service'
require './services/postcode_checker_service'

class PostcodesValidator < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/postcode/check' do
    return 'No postcode provided' if params['pc'].empty?

    pio = Postcodes::IO.new
    lsoa_checker = LsoaCheckerService.new
    postcode_checker = PostcodeCheckerService.new

    service = API::PostcodesService.new(pio, lsoa_checker, postcode_checker)
    service.check(params['pc'])
  end

  run! if app_file == $0
end
