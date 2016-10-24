require 'active_support/all'
require 'active_support/core_ext/hash'
require 'yaml'
require 'http'
module CWB
  # Service for all weather API calls
  class CWBApi
    URL = 'http://opendata.cwb.gov.tw/opendataapi'

    def initialize(data_id)
      @data_id = data_id
      credentials = YAML.load(File.read('config/credentials.yml'))
      @authorizationkey = credentials[:key]
      @key = @authorizationkey
    end

    def raw_info
      info_response =
        HTTP.get(URL,
                 params: { dataid: @data_id,
                           authorizationkey: @authorizationkey })
      
      return info_response.to_s
    end

    def test_info
      return 'test_info_yes'
    end

  end
end
