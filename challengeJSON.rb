require "json"
require 'net/http'

store_page_urls = ['http://shopicruit.myshopify.com/products.json?page=1','http://shopicruit.myshopify.com/products.json?page=2','http://shopicruit.myshopify.com/products.json?page=3','http://shopicruit.myshopify.com/products.json?page=4','http://shopicruit.myshopify.com/products.json?page=5']
total_page_price = 0
total_json_database = []

# Send a request to the JSON endpoints for each page. Store the response in our "pseudo-JSON database" Parse the JSON into a ruby hash so we can work with it in Ruby.
# Edge cases are that we require the page to be set up in the way the endpoint is returned. We can turn these into methods to where we check to see if we are given an in correct input.

store_page_urls.each do |url|
    uri = URI(url)
    response = Net::HTTP.get(uri)
    total_json_database << JSON.parse(response)
end

# Go through the collection of pages and run a double iteration over the products and items to gram the varrying price.

total_json_database.each do |page|
    page['products'].each do |item|
        item_price = item['variants'][0]['price'].to_f
        total_page_price += item_price
    end
end

# I do not believe this is the most efficient way to calculate the price but it is an MVP
# Print the result of the page
puts total_page_price

#
