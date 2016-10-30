require_relative 'cwb_api'

module CWB
  # Class to 
  class Config
    attr_reader :dataid, :key
    
    def initialize(data)
      return unless data
      @dataid = data['DATA_ID']
      @key = data['AUTH_KEY']

    end
  end
end