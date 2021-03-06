require 'yahoo_weatherman'


def getLocation
  puts "What is your location?  Enter city or zipcode"
  location = gets.chomp
end

def lookupLocation(currLoc)
  client = Weatherman::Client.new
  client.lookup_by_location(currLoc)
end

def getCurrentWeather(location, currLoc)
  tempInC = location.condition['temp']
  tempInF = tempInC * 9 / 5 + 32
  forecast = location.condition['text'].downcase

  puts "It is currently #{tempInF}°F/#{tempInC}˚C and #{forecast} in #{currLoc}."

end

def getForecast(location, today)
  forecasts = location.forecasts

  forecasts.each do |forecast|
    weekday = forecast["date"]
    day = weekday.strftime('%A')
    weather = forecast["text"].downcase
    high = forecast["high"].to_i * 9 / 5 + 32
    low = forecast["low"].to_i * 9 / 5 + 32

    dayNum = weekday.strftime('%w').to_i

    if dayNum == today
      weekday = "Today"
    elsif dayNum == today + 1 || dayNum == today - 6
      weekday = "Tomorrow"
    else
      weekday = day
    end

    puts "#{weekday}'s forecast is #{weather}, with a high of #{high}˚F and a low of #{low}˚F."
  end
end

currLoc = getLocation
location = lookupLocation(currLoc)
today = Time.now.strftime('%w').to_i

getCurrentWeather(location, currLoc)
getForecast(location, today)


