class Weather
  include HTTParty
  base_uri 'https://api.openweathermap.org'

  def initialize
    @options = {
      query: {
        lat: ENV['WEATHER_LATITUDE'],
        lon: ENV['WEATHER_LONGITUDE'],
        exclude: 'hourly,minutely,current,alerts',
        units: 'metric',
        appid: ENV['WEATHER_API_KEY']
      }
    }
  end

  def seven_days_weather
    self.class.get('/data/2.5/onecall', @options).with_indifferent_access[:daily]
  end

  def seven_days_max_temps
    seven_days_weather.map { |d| d[:temp][:max] }
  end

  def seven_days_over_temp?(temp)
    seven_days_max_temps.any? { |t| t > temp }
  end
end
