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
require 'json'

url = URI("https://streaming-availability.p.rapidapi.com/get/basic?country=fr&imdb_id=tt3799232&output_language=en")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'streaming-availability.p.rapidapi.com'
request["x-rapidapi-key"] = '1aef7e6fabmsh76ada75c37ba36ap1fcf99jsn647aa68d0153'

response = http.request(request) 
data = JSON.parse(response.read_body)
puts "#{data['title']}"
puts "il est dispo sur : #{data['streamingInfo'].keys.join}"
puts "Sortie en : #{data['year']}"
puts data['posterURLs']['780']

puts "creation d'un film"
  movie = Movie.new(
    name: data['title'],
    year: data['year'],
    url: data['posterURLs']['780']
  )
  movie.save!

puts "creation ok" 