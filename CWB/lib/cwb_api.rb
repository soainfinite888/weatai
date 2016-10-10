# frozen_string_literal: true
require 'http'

module CWB
  # Service for all FB API calls
  class CWBApi
    CWB_URL = 'http://opendata.cwb.gov.tw/'
    dataid = "O-A0003-001"
    apikey = "CWB-6D14390B-86D8-444E-80B1-E35B712C5DE0"
    CWB_API_URL = "http://opendata.cwb.gov.tw/opendataapi?dataid=#{dataid}&authorizationkey=#{apikey}"


    def initialize(dataid:, apikey:)
      access_token_response =
        HTTP.get(CWB_API_URL,
                 params: { dataid: dataid,
                           apikey: apikey,})


      @access_token = XMl.load(access_token_response.to_s)['access_token']
    end

    private

    def cwb_resource_url(id)
      #{}"http://opendata.cwb.gov.tw/opendataapi?dataid=#{dataid}&authorizationkey=#{apikey}"
      #URI.join(FB_API_URL, "/#{id}/")
    end
  end
end
