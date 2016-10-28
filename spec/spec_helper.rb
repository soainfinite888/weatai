require 'simplecov'
SimpleCov.start

require_relative '../lib/weatai/cwb.rb'
require_relative '../lib/weatai/cwb_api.rb'

require 'minitest/autorun'
require 'minitest/rg'
require 'active_support/all'
require 'active_support/core_ext/hash'
require 'yaml'
require 'http'
require 'vcr'
require 'webmock'

CREDENTIALS = YAML.load(File.read('config/credentials.yml'))
#=======
#File.read('./fixtures/data.yml')
#CWB_RESPONSE = YAML.load(File.read('./fixtures/data.yml'))
#CREDENTIALS = YAML.load(File.read('../config/credentials.yml'))

#CWB_RESPONSE = YAML.load(File.read('/Users/YIAN/GitHub/soaproject/spec/fixtures/data.yml'))
#CREDENTIALS = YAML.load(File.read('/Users/YIAN/GitHub/soaproject/config/credentials.yml'))

#CWB_RESPONSE = YAML.load(File.read('./fixtures/data.yml'))
#CREDENTIALS = YAML.load(File.read('../config/credentials.yml'))

#>>>>>>> Stashed changes
WeatherStations = ['基隆','淡水','板橋','竹子湖','鞍部','新竹','臺中','澎湖',
                   '日月潭','阿里山','玉山','嘉義','高雄','恆春','宜蘭','蘇澳',
                   '花蓮','成功','臺東','大武','蘭嶼','彭佳嶼','東吉島','永康',
                   '金門(合)','拉拉山','武陵','太魯閣','新店','臺北','彰師大',
                   '臺南','合歡山莊','吉貝','東沙','金門','馬祖','麥寮','新屋',
                   '古坑','九宮碼頭']
WeatherStationsAmount = 41 
