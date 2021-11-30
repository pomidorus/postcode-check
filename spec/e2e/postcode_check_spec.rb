# frozen_string_literal: true

require_relative '../spec_helper'

describe 'postcode checker app' do
  context 'validate postcode' do
    before :each do
      visit '/'
    end

    context 'when lsoa valid' do
      it 'returns allowed postcode' do
        expect(page).to have_content 'Hello Postcode Checker'
        fill_in 'postcode', with: 'SE1 7QD'
        click_button 'Check Postcode'
        expect(page).to have_content 'SE1 7QD is allowed'
      end
    end

    context 'when postcode not found but valid' do
      it 'returns allowed postcode' do
        expect(page).to have_content 'Hello Postcode Checker'
        fill_in 'postcode', with: 'SH24 1AA'
        click_button 'Check Postcode'
        expect(page).to have_content 'SH24 1AA is allowed'
      end
    end

    context 'when empty input' do
      it 'returns correct message' do
        expect(page).to have_content 'Hello Postcode Checker'
        click_button 'Check Postcode'
        expect(page).to have_content 'No postcode provided'
      end
    end

    context 'when postcode not supprted' do
      it 'returns not allowed postcode' do
        expect(page).to have_content 'Hello Postcode Checker'
        fill_in 'postcode', with: 'PO5 3SR'
        click_button 'Check Postcode'
        expect(page).to have_content 'PO5 3SR not allowed'
      end
    end
  end
end
