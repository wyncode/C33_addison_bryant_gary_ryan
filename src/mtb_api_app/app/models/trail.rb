class Trail < ApplicationRecord
    belongs_to :user
    has_many :sections, dependent: :destroy

    def weather
        two_four_ago = Time.now.to_i
        response = HTTParty.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{lat},#{lon},#{two_four_ago}")
        JSON.parse(response.body, :quirks_mode => true)
    end

    def hours_of_rain_since_midnight(weather_response)
        weather_response["hourly"]["data"].select do |forecast|
            forecast["time"] > 0 && 
            forecast["time"] < Time.now.to_i &&
            forecast["precipProbability"] > 0
        end.count
    end

    def rain_probabilities_since_midnight(weather_response)
        weather_response["hourly"]["data"].select do |forecast|
            forecast["time"] > 0 && 
            forecast["time"] < Time.now.to_i
        end.map do |forecast_since_midnight|
            [Time.at(forecast_since_midnight["time"]).hour, forecast_since_midnight["precipProbability"]]
        end.to_h        
    end
end
