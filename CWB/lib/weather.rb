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
for i in 0..hash['cwbopendata']['location'].length-1
  location = {}
  place = hash['cwbopendata']['location'][i]['locationName']
  location['time'] = hash['cwbopendata']['location'][i]['time']['obsTime']
  location['city'] = hash['cwbopendata']['location'][i]['parameter'][0]['parameterValue']
  location['town'] = hash['cwbopendata']['location'][i]['parameter'][2]['parameterValue']
  location['TEMP'] = hash['cwbopendata']['location'][i]['weatherElement'][4]['elementValue']['value']
  location['HUMD'] = hash['cwbopendata']['location'][i]['weatherElement'][5]['elementValue']['value']
  all_location.store(place, location)
end
File.write("../spec/fixtures/data.yml", all_location.to_yaml)
