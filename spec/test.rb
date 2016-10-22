require 'active_support/all'
require 'active_support/core_ext/hash'
require 'yaml'
require 'http'


require_relative '../lib/cwb.rb'
require_relative '../lib/cwb_api.rb'

CWB_RESPONSE = YAML.load(File.read('./fixtures/data.yml'))
CREDENTIALS = YAML.load(File.read('../config/credentials.yml'))
WeatherStations = ['基隆','淡水','板橋','竹子湖','鞍部','新竹','臺中','澎湖',
                   '日月潭','阿里山','玉山','嘉義','高雄','恆春','宜蘭','蘇澳',
                   '花蓮','成功','臺東','大武','蘭嶼','彭佳嶼','東吉島','永康',
                   '金門(合)','拉拉山','武陵','太魯閣','新店','臺北','彰師大',
                   '臺南','合歡山莊','吉貝','東沙','金門','馬祖','麥寮','新屋',
                   '古坑','九宮碼頭']
WeatherStationsAmount = 41 

@cwb_api = CWB::CWBApi.new(
      data_id: CREDENTIALS[:key],
)

testCWBApi = CWB::Weather.new(
      @cwb_api
)
    


=begin 

#require_relative '../lib/cwb.rb'
CWB_RESPONSE = YAML.load(File.read('./fixtures/data.yml'))
#CREDENTIALS ssssssssss= YAML.load(File.read('config/credentials.yml'))
#CWB_RESPONSE = YAML.load(File.read('./fixtures/data.yml'))
#RESULTS = YAML.load(File.read('spec/fixtures/results.yml'))

WeatherStations = ['基隆','淡水','板橋','竹子湖','鞍部','新竹','臺中','澎湖',
                   '日月潭','阿里山','玉山','嘉義','高雄','恆春','宜蘭','蘇澳',
                   '花蓮','成功','臺東','大武','蘭嶼','彭佳嶼','東吉島','永康',
                   '金門(合)','拉拉山','武陵','太魯閣','新店','臺北','彰師大',
                   '臺南','合歡山莊','吉貝','東沙','金門','馬祖','麥寮','新屋',
                   '古坑','九宮碼頭']

WeatherStationsAmount = 41 

WeatherStations.each do |name|
        puts CWB_RESPONSE[name]['TEMP']
end


WeatherStations.each do |name|
	puts name
end


	

while WeatherStationsAmount > 0
         puts WeatherStations[WeatherStationsAmount-1]
         WeatherStationsAmount = WeatherStationsAmount - 1
end


 
puts CWB_RESPONSE["基隆"]has_key?'TEMP'




if CWB_RESPONSE.kind_of?(Hash)
	puts "hash"
else
	puts "not hash"

end

puts CWB_RESPONSE.has_key?'基隆'





if CWB_RESPONSE == false 
	puts "空的"
else
	puts "有東西"
end


=end

