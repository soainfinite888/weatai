require 'active_support/all'
require 'active_support/core_ext/hash'
require 'yaml'
require 'http'

module CWB
  class CWBApi
    URL = 'http://opendata.cwb.gov.tw/opendataapi'

    def initialize(authorizationkey)
        @authorizationkey = authorizationkey
    end

    def info(data_id)
      info_response = 
        HTTP.get(URL,
                params: { dataid: data_id,
                authorizationkey: credentials[:key] })
      Hash.from_xml(info_response)
    end
  end
end
