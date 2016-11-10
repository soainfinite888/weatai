require 'active_support/all'
require 'active_support/core_ext/hash'
require 'yaml'
require 'http'
module CWB
  # Service for all weather API calls
  class CWBApi
    URL_cwb = 'http://opendata.cwb.gov.tw/opendataapi'
    URL_psi = 'http://opendata.epa.gov.tw/webapi/api/rest/datastore/355000000I-000001/'
    
    def self.config=(credentials)
      @config ? @config.update(credentials) : @config = credentials
    end
    
    def self.config
      return @config if @config
      @config = { dataid1: ENV['DATA_ID1'],
                  dataid2: ENV['DATA_ID2'],
                  key:    ENV['AUTH_KEY'], 
                  format: ENV['FORMAT'],
                  token:  ENV['TOKEN']}
    end

    def self.raw_info1(dataid)
      info_response =
        HTTP.get(URL_cwb,
                 params: { dataid:           config[:dataid1],
                           authorizationkey: config[:key]})
      Hash.from_xml(info_response)
    end

    def self.raw_info2(dataid)
      info_response =
        HTTP.get(URL_cwb,
                 params: { dataid:           config[:dataid2],
                           authorizationkey: config[:key]})
      Hash.from_xml(info_response)
    end

    def self.raw_info3(dataid)
      info_response =
        HTTP.get(URL_psi,
                 params: { format: config[:format],
                           token:  config[:token]})
      Hash.from_xml(info_response)
    end

  end
end
