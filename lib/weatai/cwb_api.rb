require 'active_support/all'
require 'active_support/core_ext/hash'
require 'yaml'
require 'http'
module CWB
  # Service for all weather API calls
  class CWBApi
    URL = 'http://opendata.cwb.gov.tw/opendataapi'
    
    def self.config=(credentials)
      @config ? @config.update(credentials) : @config = credentials
    end
    
    def self.config
      return @config if @config
      @config = {key:    ENV['AUTH_KEY'] }
    end

    def self.raw_info(id)
      info_response =
        HTTP.get(URL,
                 params: { dataid:           id,
                           authorizationkey: config[:key]})
      Hash.from_xml(info_response)
    end
  end
end
