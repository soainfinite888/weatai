require_relative 'cwb_api'
require_relative 'cwb'
module CWB
  # Class to parse the rain data
  class Rain
    attr_reader :dataid

    def initialize(dataid:)
      @dataid = dataid
    end

    def self.instant_rain
      raw_info = CWB::CWBApi.raw_info2(@dataid)
      all_location2 = {}
      keys = CWB::Weather.instant_weather.keys
      raw_info['cwbopendata']['location'].each do |item|
        location = {}
        if(item['locationName'].in?(keys))
          place = item['locationName']
          location['time'] = item['time']['obsTime']
          location['city'] = item['parameter'][0]['parameterValue']
          location['town'] = item['parameter'][2]['parameterValue']
          location['MIN_10'] = item['weatherElement'][2]['elementValue']['value']
          location['MIN_10'] = '0.00' if location['MIN_10'].to_f<0 
          location['Daily Accumulated Rainfall'] = item['weatherElement'][7]['elementValue']['value']
          all_location2.store(place, location)
        end
      end
      all_location2
    end

    def weather_test
      return 'weather_test_yes'
    end
     
  end
end
