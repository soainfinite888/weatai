require_relative 'spec_helper.rb'
require 'yaml'

describe 'CWB specifications' do

  VCR.configure do |c|
    c.cassette_library_dir = 'cassettes'
    c.hook_into :webmock

#    c.filter_sensitive_data('<KEY>') { CREDENTIALS[:key] }
  end

  before do
    VCR.insert_cassette 'all_record', record: :new_episodes
#    @cwb_api = CWB::CWBApi.config

  end

  after do
    VCR.eject_cassette
  end

 # test 01
  it 'should be able to get raw info' do
    CWB::CWBApi.raw_info1('O-A0003-001').wont_be_empty
  end

  # test 02
  it 'should be able to get instant_weather in hash format' do
    CWB::INSTANT.instant.kind_of?(Hash).must_equal true 
  end

  #test 03
  it 'should get name of every Weather Stations' do
    test_instant_weather = CWB::INSTANT.instant
    WeatherStations.each do |name|
        test_instant_weather.has_key?(name).must_equal true
    end
  end
end
