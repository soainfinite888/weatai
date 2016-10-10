require 'active_support/all' 
require 'active_support/core_ext/hash'
require 'yaml'
require 'net/http'
file = Net::HTTP.get_response(URI.parse('http://opendata.cwb.gov.tw/opendataapi?dataid=O-A0003-001&authorizationkey=CWB-68359A90-313D-405A-B575-10A924C6EC13')).body
#file = File.open("O-A0003-001.xml", "r")
hash = Hash.from_xml(file)
#yaml = hash.to_yaml
#File.open("data.yml", "w") { |file| file.write(yaml) }
result={}
location={}
for i in 0..hash['cwbopendata']['location'].length-1
	place=hash['cwbopendata']['location'][i]['locationName']
	result['time']=hash['cwbopendata']['location'][i]['time']['obsTime']
	result['city']=hash['cwbopendata']['location'][i]['parameter'][0]['parameterValue']
	result['town']=hash['cwbopendata']['location'][i]['parameter'][2]['parameterValue']
	result['TEMP']=hash['cwbopendata']['location'][i]['weatherElement'][4]['elementValue']['value']
	result['HUMD']=hash['cwbopendata']['location'][i]['weatherElement'][5]['elementValue']['value']
	location.store(place, result)
	result={}
end
File.write("../spec/fixtures/data.yml", location.to_yaml)

#puts hash['cwbopendata']['location'][0]['weatherElement'][0] #TIME
#puts hash['cwbopendata']['location'][0]['weatherElement'][1] #ELEV
#puts hash['cwbopendata']['location'][0]['weatherElement'][2] #WDIR
#puts hash['cwbopendata']['location'][0]['weatherElement'][3] #WDSD
#puts hash['cwbopendata']['location'][0]['weatherElement'][4] #TEMP
#puts hash['cwbopendata']['location'][0]['weatherElement'][5] #HUMD
#puts hash['cwbopendata']['location'][0]['weatherElement'][6] #PRES 
#puts hash['cwbopendata']['location'][0]['weatherElement'][7] #24R
#puts hash['cwbopendata']['location'][0]['weatherElement'][8] #H_FX
#puts hash['cwbopendata']['location'][0]['weatherElement'][9] #H_XD
#puts hash['cwbopendata']['location'][0]['weatherElement'][10] #H_FXT
#puts hash['cwbopendata']['location'][0]['weatherElement'][11] #H_F10
#puts hash['cwbopendata']['location'][0]['weatherElement'][12] #H_10D
#puts hash['cwbopendata']['location'][0]['weatherElement'][13] #H_F10T

#puts hash['cwbopendata']['location'][i]['time']['obsTime'] #time
#puts hash['cwbopendata']['location'][i]['locationName'] #keelung
#puts hash['cwbopendata']['location'][i]['parameter'][0]['parameterValue'] #keelung city
#puts hash['cwbopendata']['location'][i]['parameter'][2]['parameterValue'] #town   
#puts hash['cwbopendata']['location'][i]['weatherElement'][4]['elementName'] #TEMP
#puts hash['cwbopendata']['location'][i]['weatherElement'][4]['elementValue']['value'] #TEMP
#puts hash['cwbopendata']['location'][i]['weatherElement'][5]['elementName'] #HUMD
#puts hash['cwbopendata']['location'][i]['weatherElement'][5]['elementValue']['value'] #HUMD