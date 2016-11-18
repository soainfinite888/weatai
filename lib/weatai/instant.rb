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

    def self.instant
      #return @instant if @instant
      station = CWB::Rain.instant_rain.keys
      all_location1 = CWB::Weather.instant_weather
      all_location2 = CWB::Rain.instant_rain
      all_location3 = CWB::PSI.instant_psi
      all_location4 = {}
      n=1
      station.each do |item|
        location = {}
        location['Station'] = item
        location['City'] = all_location2[item]['city']
        location['Town'] = all_location2[item]['town']  
        location['Temp'] = all_location1[item]['TEMP']
        location['Humd'] = all_location1[item]['HUMD']
        location['Last 10 minutes Rainfall'] = all_location2[item]['MIN_10'] 
        location['Daily Accumulated Rainfall'] = all_location2[item]['Daily Accumulated Rainfall'] 
        location['PSI'] = all_location3[location['city']]['PSI'] if location['city'].in?(all_location3.keys.uniq)
        location['Status'] = all_location3[location['city']]['Status'] if location['city'].in?(all_location3.keys.uniq)
        location['Time'] = all_location1[item]['time']
        all_location4.store(n, location)
        n+=1
      end
      all_location4
    end

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
