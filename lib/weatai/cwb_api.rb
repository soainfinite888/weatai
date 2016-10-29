require 'active_support/all'
require 'active_support/core_ext/hash'
require 'yaml'
require 'http'
module CWB
  # Service for all weather API calls
  class CWBApi
    URL = 'http://opendata.cwb.gov.tw/opendataapi'
    
    def self.config(credentials)
      @config ? @config.update(credentials) : @config = credentials
    end
    
    def self.config
      return @config if @config
      @config = { dataid: ENV['DATA_ID'],
                  key:    ENV['AUTH_KEY'] }
    end

    def self.raw_info(dataid)
      info_response =
        HTTP.get(URL,
                 params: { dataid:           config[:dataid],
                           authorizationkey: config[:key]})
      Hash.from_xml(info_response)
    end
  end
end

#class Tester
#  include CWB
#end

#t = Tester::CWBApi.config
#s = Tester::CWBApi.raw_info('O-A0003-001')
#puts s
