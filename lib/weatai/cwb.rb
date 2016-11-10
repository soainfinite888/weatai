require_relative 'cwb_api'
module CWB
  # Class to organize raw_data, finding the data we need
  class Weather
    attr_reader :dataid

    def initialize(dataid:)
      @dataid = dataid
    end

    def self.instant_weather
      raw_info = CWB::CWBApi.raw_info1(@dataid)
      all_location1 = {}
      raw_info['cwbopendata']['location'].each do |item|
        location = {}
        place = item['locationName']
        location['time'] = item['time']['obsTime']
        location['city'] = item['parameter'][0]['parameterValue']
        location['town'] = item['parameter'][2]['parameterValue']
        location['TEMP'] = item['weatherElement'][4]['elementValue']['value']
        location['HUMD'] = item['weatherElement'][5]['elementValue']['value']
        all_location1.store(place, location)
      end
      all_location1
    end

    def weather_test
      return 'weather_test_yes'
    end 
  end
end
