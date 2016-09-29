require 'json'
require 'net/http'

i = 1
total_json_database = []
total_cw_price = 0
enpoint_url = 'http://shopicruit.myshopify.com/products.json?page='

loop do
    uri = URI(enpoint_url + i.to_s)
    response = Net::HTTP.get(uri)
    server_response = JSON.parse(response)

    break if server_response['products'].empty?
    total_json_database << server_response
    i += 1
end

def is_watch?(item)
    item['product_type'] == 'Clock' || item['product_type'] == 'Watch'
end

total_json_database.each do |page|
    page['products'].each do |item|
        next unless is_watch?(item)
        item['variants'].each do |variant|
            total_cw_price += variant['price'].to_f
        end
    end
end

puts total_cw_price
