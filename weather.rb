require 'yahoo_weatherman'



def determine_weather(location)
  weather = Weatherman::Client.new
  response = weather.lookup_by_location(location)
  forecast = response.description
  puts response.forecasts
  #puts response.methods
  # puts forecast
  split = forecast.split(' />')

  for i in 5..9
    loop_split = split[i]
    weekday = loop_split.split('. ')[0]
    high_low = loop_split.split('. ')[1]

    if (i == 5)
      puts "Today is going to be #{weekday.split('- ')[1]} \
with a low of #{high_low.split(' ')[3].chop.chop.chop} and a high of #{high_low.split(' ')[1]} \
degrees Celsius."
    elsif (i == 6)
      puts "Tomorrow is going to be #{weekday.split('- ')[1]} \
with a low of #{high_low.split(' ')[3].chop.chop.chop} and a high of #{high_low.split(' ')[1]} \
degrees Celsius."
    else
      puts "#{weekday.split('- ')[0].chop} is going to be #{weekday.split('- ')[1]} \
with a low of #{high_low.split(' ')[3].chop.chop.chop} and a high of #{high_low.split(' ')[1]} \
degrees Celsius."
    end
  end
end

puts "Please enter your location: "
location = gets
determine_weather(location)
