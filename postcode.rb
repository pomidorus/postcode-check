# frozen_string_literal: true

require 'sinatra'

get '/' do
  erb :index
end

get '/postcode/check' do
  'checked'
end
