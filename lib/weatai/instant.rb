require_relative 'cwb_api'
require_relative 'cwb'
require_relative 'cwb_rain'
require_relative 'cwb_psi'
module CWB
  # Class to organize all the data we need
  class INSTANT
    attr_reader :dataid

    def initialize(dataid:)
      @dataid = dataid
    end
  
  # Self method, All station Data
    def self.instant
      #return @instant if @instant
      station = CWB::Rain.instant_rain.keys   #station's name觀測站名稱(key)
      all_location1 = CWB::Weather.instant_weather #中央氣象局O-A0003-001
      all_location2 = CWB::Rain.instant_rain #中央氣象局O-A0002-001
      all_location3 = CWB::PSI.instant_psi #環保署
      all_location4 = {}
      station.each do |item|
        location = {}
        place = item
        location['time'] = all_location1[item]['time']  #data's time 
        location['city'] = all_location2[item]['city']  #station's city
        location['town'] = all_location2[item]['town']  #station's township
        location['TEMP'] = all_location1[item]['TEMP']  #station's temperature
        location['HUMD'] = all_location1[item]['HUMD']  #relative humidity(HUMD)相對濕度
        location['MIN_10'] = all_location2[item]['MIN_10']  #10min rainfall十分鐘雨量
        location['Daily Accumulated Rainfall'] = all_location2[item]['Daily Accumulated Rainfall'] #day rainfall日雨量
        location['PSI'] = all_location3[location['city']]['PSI'] if location['city'].in?(all_location3.keys.uniq) #空氣品質PSI
        location['Status'] = all_location3[location['city']]['Status'] if location['city'].in?(all_location3.keys.uniq)  #測站對齊
        all_location4.store(place, location)
      end
      all_location4
    end

  # Only one local station Data 
    def self.local(position)
      station = CWB::Rain.instant_rain.keys
      if (position.in?(station))
        CWB::INSTANT.instant.assoc(position)
      end
    end

    def self.find(dataid:)
      new(dataid: dataid)
    end

    def weather_test
      return 'weather_test_yes'
    end 
  end
end
