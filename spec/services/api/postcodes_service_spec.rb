# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe API::PostcodesService do
  let(:pio) { API::PostcodesIO.new }
  let(:lsoa_checker) { LsoaCheckerService.new }
  let(:postcode_checker) { PostcodeCheckerService.new }
  let(:service) { API::PostcodesService.new(pio, lsoa_checker, postcode_checker) }

  context 'when wrong postcode' do
    it 'returns correct message' do
      expect(service.check('sdsdf')).to eq('No postcode found')
    end
  end

  context 'when allowed postcode' do
    it 'returns correct message' do
      expect(service.check('SE1 7QD')).to eq('SE1 7QD is allowed')
    end
  end

  context 'when not allowed postcode' do
    it 'returns correct message' do
      expect(service.check('PO5 3SR')).to eq('PO5 3SR not allowed')
    end
  end
end
