require_relative 'spec_helper.rb'
require 'yaml'

describe 'CWB specifications' do


  before do
    @cwb_api = CWB::CWBApi.new(
      data_id: CREDENTIALS[:key],
    )

  end
  
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

  # test 05
  it 'should be able to get raw info' do
    testCWBApi = @cwb_api
    testCWBApi.raw_info.wont_be_empty
  end

  # test 06
  it 'should be able to get instant_weather' do
    testWeather = CWB::Weather.new(
      @cwb_api
    )
    #testWeather.instant_weather.wont_be_empty
  end

  # test 07
  it 'should be able to be test(cwb_api)' do
    testCWBApi = @cwb_api
    testCWBApi.test_info.must_equal 'test_info_yes'
  end

  # test 08
  it 'should be able to be test(cwb)' do
    testWeather= CWB::Weather.new(
      @cwb_api
    )
  end


end