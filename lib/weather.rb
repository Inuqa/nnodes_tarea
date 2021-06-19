class Weather
  include HTTParty
  base_uri 'https://api.openweathermap.org'

  def initialize
    @options = {
      query: {
        lat: -33.4489,
        lon: -70.6693,
        exclude: 'hourly,minutely,current,alerts',
        units: 'metric',
        appid: '681390f9870ae63049cb589fb84cd9de'
      }
    }
  end

  def seven_days_weather
    self.class.get('/data/2.5/onecall', @options)
  end
end
