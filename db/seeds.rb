# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=fr&service=prime&type=movie&page=2&output_language=en&language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'streaming-availability.p.rapidapi.com'
request["x-rapidapi-key"] = '47e3704f9amsh0a64d5957b15463p1e1066jsn0d00a9711106'

response = http.request(request)
data = JSON.parse(response.read_body)
data['results'].each do |film|
  puts film['title']
  puts film['streamingInfo']
end

#puts "creation d'un film"
#  movie = Movie.new(
#    name: data['title'],
#    year: data['year'],
#    url: data['posterURLs']['780']
#  )
puts "creation ok" 