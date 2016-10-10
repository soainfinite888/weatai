# frozen_string_literal: true
require 'http'

module CWB
  # Service for all FB API calls
  class CWBApi
    CWB_URL = 'http://opendata.cwb.gov.tw/'
    #API_VER = 'v2.7'
    #CWB_API_URL = URI.join(CWB_URL, "#{API_VER}/")
    dataid = "O-A0003-001"
    apikey = "CWB-6D14390B-86D8-444E-80B1-E35B712C5DE0"
    CWB_API_URL = "http://opendata.cwb.gov.tw/opendataapi?dataid=#{dataid}&authorizationkey=#{apikey}"


    #FB_TOKEN_URL = URI.join(FB_API_URL, 'oauth/access_token')

    def initialize(client_id:, client_secret:)
      access_token_response =
        HTTP.get(CWB_API_URL,
                 params: { dataid: dataid,
                           apikey: apikey,})


      @access_token = XMl.load(access_token_response.to_s)['access_token']
    end

    

=begin
    
  
    def group_info(group_id)
      group_response = HTTP.get(fb_resource_url(group_id),
                                params: { access_token: @access_token })
      JSON.load(group_response.to_s)
    end

    def group_feed(group_id)
      feed_response = HTTP.get(URI.join(fb_resource_url(group_id), 'feed'),
                               params: { access_token: @access_token })
      JSON.load(feed_response.to_s)['data']
    end

    def posting_attachments(posting_id)
      attachments_response = HTTP.get(
        URI.join(fb_resource_url(posting_id), 'attachments'),
        params: { access_token: @access_token }
      )
      JSON.load(attachments_response.to_s)['data'].first
    end

=end





    private

    def cwb_resource_url(id)
      #{}"http://opendata.cwb.gov.tw/opendataapi?dataid=#{dataid}&authorizationkey=#{apikey}"
      #URI.join(FB_API_URL, "/#{id}/")
    end
  end
end
