require 'http'
require 'yaml'

require 'active_support/core_ext/hash'
#require 'hash'
require 'active_support/all'
require 'net/http'
require 'http'


module CWB
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

    
    file = Net::HTTP.get_response(URI.parse(CWB_API_URL)).body

    cwbhash = Hash.new
    cwbhash = Hash.from_xml(file)

    yaml = cwbhash.to_yaml

    cwbhash.each {|key| puts '#{key} SET' } 
    File.open('cwb.yam', 'w'){|file| file.write(yaml)}

  end
end
