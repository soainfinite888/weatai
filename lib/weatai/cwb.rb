require_relative 'cwb_api'
module CWB
  # Class to organize raw_data, finding the data we need
  class Weather
    attr_reader :dataid

    def initialize(data:)
      @dataid = data['dataid']
    end

    def instant_weather
      return @instant_weather if @instant_weather
      raw_info = CWB::CWBApi.raw_info(@dataid)
      all_location = {}
      raw_info['cwbopendata']['location'].each do |item|
        location = {}
        place = item['locationName']
        location['time'] = item['time']['obsTime']
        location['city'] = item['parameter'][0]['parameterValue']
        location['town'] = item['parameter'][2]['parameterValue']
        location['TEMP'] = item['weatherElement'][4]['elementValue']['value']
        location['HUMD'] = item['weatherElement'][5]['elementValue']['value']
        all_location.store(place, location)
      end
      # File.write('spec/fixtures/data.yml', all_location.to_yaml)
      all_location
    end

    def self.find(dataid:)
      raw_data = CWB::CWBApi.raw_info(dataid) 
      new(data: raw_data)
    end

    def weather_test
      return 'weather_test_yes'
    end 
  end
end
