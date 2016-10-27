require 'active_support/all'
require 'active_support/core_ext/hash'
require 'yaml'
require 'http'

credentials = YAML.load(File.read('../config/credentials.yml'))
file = HTTP.get('http://opendata.cwb.gov.tw/opendataapi',
                params: { dataid: 'O-A0003-001',
                          authorizationkey: credentials[:key] })
hash = Hash.from_xml(file)
all_location = {}
hash['cwbopendata']['location'].each do |item|
  location = {}
  place = item['locationName']
  location['time'] = item['time']['obsTime']
  location['city'] = item['parameter'][0]['parameterValue']
  location['town'] = item['parameter'][2]['parameterValue']
  location['TEMP'] = item['weatherElement'][4]['elementValue']['value']
  location['HUMD'] = item['weatherElement'][5]['elementValue']['value']
  all_location.store(place, location)
end
File.write('../spec/fixtures/data.yml', all_location.to_yaml)
