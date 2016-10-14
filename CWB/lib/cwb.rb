require_relative 'cwb_api'
module CWB
  class Weather
    def initialize(cwb_api)
      @cwb_api = cwb_api
    end

    def instant_weather
      raw_info = @cwb_api.raw_info
      for i in 0..hash['cwbopendata']['location'].length-1
        location = {}
        place = raw_info['cwbopendata']['location'][i]['locationName']
        location['time'] = raw_info['cwbopendata']['location'][i]['time']['obsTime']
        location['city'] = raw_info['cwbopendata']['location'][i]['parameter'][0]['parameterValue']
        location['town'] = raw_info['cwbopendata']['location'][i]['parameter'][2]['parameterValue']
        location['TEMP'] = raw_info['cwbopendata']['location'][i]['weatherElement'][4]['elementValue']['value']
        location['HUMD'] = raw_info['cwbopendata']['location'][i]['weatherElement'][5]['elementValue']['value']
        all_location.store(place, location)
      end
    end
  end
end
