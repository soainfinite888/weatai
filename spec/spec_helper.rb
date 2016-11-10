require 'simplecov'
SimpleCov.start

require_relative '../lib/weatai/cwb.rb'
require_relative '../lib/weatai/cwb_api.rb'
require_relative '../lib/weatai/cwb_rain.rb'
require_relative '../lib/weatai/cwb_psi.rb'
require_relative '../lib/weatai/instant.rb'

require 'minitest/autorun'
require 'minitest/rg'
require 'active_support/all'
require 'active_support/core_ext/hash'
require 'yaml'
require 'http'
require 'vcr'
require 'webmock'


CWB_RESPONSE = YAML.load(File.read('spec/fixtures/data.yml'))
if File.file?('config/credentials.yml')
  CREDENTIALS = YAML.load(File.read('config/credentials.yml'))
  ENV['AUTH_KEY'] = CREDENTIALS[:key]
  ENV['DATA_ID1'] = CREDENTIALS[:dataid1]
  ENV['DATA_ID2'] = CREDENTIALS[:dataid2]
  ENV['FORMAT'] = CREDENTIALS[:format]
  ENV['TOKEN'] = CREDENTIALS[:token]
end

WeatherStations = ['基隆','淡水','板橋','竹子湖','鞍部','新竹','臺中','梧棲',
	               '澎湖','日月潭','阿里山','玉山','嘉義','臺南','高雄','恆春',
	               '宜蘭','蘇澳','花蓮','成功','臺東','大武','蘭嶼','彭佳嶼',
	               '東吉島','永康','拉拉山','武陵','太魯閣','新店','臺北',
	               '彰師大','吉貝','金門','馬祖','麥寮','新屋','古坑']
WeatherStationsAmount = 38 
