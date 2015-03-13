require 'yahoo_weatherman'

puts "What is your location?  Enter city or zipcode"
location = gets.chomp

def getCurrentWeather(location)

  client = Weatherman::Client.new

  tempInC = client.lookup_by_location(location).condition['temp']
  tempInF = tempInC * 9 / 5 + 32
  forecast = client.lookup_by_location(location).condition['text']

  puts "It is currently #{tempInF}°F and #{forecast}."

end

def getForecast(location)
  client = Weatherman::Client.new
  weatherman = client.lookup_by_location(location)
  forecasts = weatherman.forecasts

  forecasts.each do |forecast|
    date = forecast["date"]
    day = DateTime.iso8601("#{date}").strftime('%A')
    weather = forecast["text"]
    high = forecast["high"].to_i * 9 / 5 + 32
    low = forecast["low"].to_i * 9 / 5 + 32

    d = Time.now
    today = d.strftime('%w')
    dayNum = DateTime.iso8601("#{date}").strftime('%w')

    if dayNum == today
      day = "Today"
    elsif dayNum.to_i == today.to_i + 1
      day = "Tomorrow"
    else
      day
    end

    puts "#{day} the forecast is #{weather}, with a high of #{high}˚F and a low of #{low}˚F."
  end
end

getCurrentWeather(location)
getForecast(location)


