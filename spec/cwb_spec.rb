require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require 'active_support/all'
require_relative '../lib/cwb.rb'

CWB_RESPONSE = YAML.load(File.read('./fixtures/data.yml'))

WeatherStations = ['基隆','淡水','板橋','竹子湖','鞍部','新竹','臺中','澎湖',
                   '日月潭','阿里山','玉山','嘉義','高雄','恆春','宜蘭','蘇澳',
                   '花蓮','成功','臺東','大武','蘭嶼','彭佳嶼','東吉島','永康',
                   '金門(合)','拉拉山','武陵','太魯閣','新店','臺北','彰師大',
                   '臺南','合歡山莊','吉貝','東沙','金門','馬祖','麥寮','新屋',
                   '古坑','九宮碼頭']

WeatherStationsAmount = 41 

describe 'CWB specifications' do
  
  #test 01
  it 'should be able to download the data file(a hash data)' do
    
    #CWB_RESPONSE is Hash data or not
    CWB_RESPONSE.kind_of?(Hash).must_equal true 
  
  end


  #test 02
  it 'should get name of every Weather Stations' do
    
    WeatherStations.each do |name|
        CWB_RESPONSE.has_key?(name).must_equal true
    end
  
  end


  # test 03
  it 'should get temperature of every Weather Stations' do
    
    WeatherStations.each do |name|
        CWB_RESPONSE[name].has_key?('TEMP').must_equal true
    end

    WeatherStations.each do |name|
        CWB_RESPONSE[name]['TEMP'].wont_be_empty
    end
  
  end

  
  # test 04
  it 'should get time of every Weather Stations' do
    
    WeatherStations.each do |name|
        CWB_RESPONSE[name].has_key?('time').must_equal true
    end

    WeatherStations.each do |name|
        CWB_RESPONSE[name]['time'].wont_be_empty
    end

  end

end