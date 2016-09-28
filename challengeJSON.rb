require "json"
require 'net/http'


urls = ['http://shopicruit.myshopify.com/products.json?page=1','http://shopicruit.myshopify.com/products.json?page=2','http://shopicruit.myshopify.com/products.json?page=3','http://shopicruit.myshopify.com/products.json?page=4','http://shopicruit.myshopify.com/products.json?page=5']

total_json_database = []


urls.each do |url|
    uri = URI(url)
    response = Net::HTTP.get(uri)
    total_json_database << JSON.parse(response) # turn the JSON response into a Ruby Hash
end

puts total_json_database
