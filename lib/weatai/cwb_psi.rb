require_relative 'cwb_api'
require_relative 'cwb'

module CWB
  # Class to parse the PSI data
  class PSI
    attr_reader :dataid

    def initialize(dataid:)
      @dataid = dataid
    end

    def self.instant_psi
      raw_info = CWB::CWBApi.raw_info3(@dataid)
      all_location3 = {}
      raw_info['AQX']['Data'].each do |item|
        location = {}
        place = item['County']
        location['city'] = item['County']
        location['PSI'] = item['PSI']
        location['Status'] = item['Status']
        all_location3.store(place, location)
      end
      all_location3
    end

    def weather_test
      return 'weather_test_yes'
    end 
    
  end
end
