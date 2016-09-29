require "json"
require 'net/http'
require 'pry'

store_page_urls = ['http://shopicruit.myshopify.com/products.json?page=1']
total_json_database = []


store_page_urls.each do |url|
    uri = URI(url)
    response = Net::HTTP.get(uri)
    total_json_database << JSON.parse(response)
end


single_page_price = 0


total_json_database.each do |page|
    page['products'].each do |item|
        item_price = item['variants'][0]['price'].to_f
        single_page_price += item_price
    end
    puts single_page_price
end


























# ,'http://shopicruit.myshopify.com/products.json?page=2','http://shopicruit.myshopify.com/products.json?page=3','http://shopicruit.myshopify.com/products.json?page=4','http://shopicruit.myshopify.com/products.json?page=5'
