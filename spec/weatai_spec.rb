require_relative 'spec_helper.rb'
require 'yaml'

describe 'CWB specifications' do

  VCR.configure do |c|
    c.cassette_library_dir = 'cassettes'
    c.hook_into :webmock

    c.filter_sensitive_data('<KEY>') { CREDENTIALS[:key] }
  end

  before do
    VCR.insert_cassette 'all_record', record: :new_episodes
    @cwb_api = CWB::CWBApi.config

  end

  after do
    VCR.eject_cassette
  end


 # test 01
  it 'should be able to get raw info' do
    testCWBApi = @cwb_api
    testCWBApi.raw_info.wont_be_empty
  end

  #test 02
  it 'should be able to download the data file in hash format)' do
    CWB_RESPONSE.kind_of?(Hash).must_equal true 
  
  end

  # test 03
  it 'should be able to get instant_weather in hash format' do
    testWeather = CWB::Weather.new(
      @cwb_api
    )
    testWeather.instant_weather.kind_of?(Hash).must_equal true 
  end
=begin
  #test 04
  it 'should get name of every Weather Stations' do
    testWeather = CWB::Weather.new(
      @cwb_api
    )
    instant_weather = testWeather.instant_weather
    WeatherStations.each do |name|
        CWB_RESPONSE.has_key?(name).must_equal true
    end
  
  end


  # test 05
  it 'should get temperature of every Weather Stations' do
    testWeather = CWB::Weather.new(
      @cwb_api
    )    
    instant_weather = testWeather.instant_weather
    puts instant_weather["烏坵"]
    WeatherStations.each do |name|
      instant_weather[name].has_key?('TEMP').must_equal true

    end

    WeatherStations.each do |name|
        instant_weather[name]['TEMP'].wont_be_empty
    end
  
  end


  # test 06
  it 'should get time of every Weather Stations' do
    testWeather = CWB::Weather.new(
      @cwb_api
    )       
    instant_weather = testWeather.instant_weather
    WeatherStations.each do |name|
        instant_weather[name].has_key?('time').must_equal true
    end

    WeatherStations.each do |name|
        instant_weather[name]['time'].wont_be_empty
    end

  end
=end
 




end
