require "json"
require 'net/http'


url = 'http://shopicruit.myshopify.com/products.json?page=1'
uri = URI(url)
response = Net::HTTP.get(uri)

parsed_response = JSON.parse(response) # turn the JSON response into a Ruby Hash
