# Postcode Check

A simple web application to work out if a given postcode is within user service area.

## General

To start application type in the terminal

`rerun ruby postcode.rb` or `ruby postcode.rb`  

Main page located via root path \
UI implemented with plain HTML, CSS. Check postcode button interactivity using vue js & axios (ajax request with promise)

## Postcode API

`lsoa_checker_service` provides allowance for lsoa regions, via extendable array (can be persisted via database)

`postcode_checker_service` provides allowance for not found postcodes, via extendable array (can be persisted via database)

Input formatting includes removing white spaces & upcasing

## Testing

unit tests for lsoa_checker, postcode model, postcode_checker using test/unit

integration tests for postcodes_service using rspec

e2e tests for main page using capybara (to run this tests https://github.com/mozilla/geckodriver should be installed prior)


