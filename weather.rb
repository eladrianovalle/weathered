require 'yahoo_weatherman'

# puts "What is your location?  Enter city or zipcode"
# location = gets.chomp

def getWeather(location)

  client = Weatherman::Client.new

  tempInC = client.lookup_by_location(location).condition['temp']
  tempInF = tempInC * 9 / 5 + 32
  forecast = client.lookup_by_location(location).condition['text']

  puts "It is #{tempInF}°F and #{forecast}."

end

# getWeather(location)

client = Weatherman::Client.new
weatherman = client.lookup_by_location('11221')
forecasts = weatherman.forecasts


forecasts.each do |forecast|
  day = forecast["day"]
  weather = forecast["text"]
  high = forecast["high"]
  low = forecast["low"]

  puts "#{day} is going to be #{weather}, with a high of #{high} and a low of #{low} degrees Celsius."
end