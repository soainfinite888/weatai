require_relative 'cwb_api'
module CWB
  # Class to organize raw_data, finding the data we need
  class Weather
    def initialize(cwb_api)
      @cwb_api = cwb_api
    end

    def instant_weather
      raw_info = @cwb_api.raw_info
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
      File.write('../spec/fixtures/data.yml', all_location.to_yaml)
    end

    def self.find(cwb_api)
      raw_data = cwb_api.raw_info 
      new(cwb_api)
    end 
  end
end
