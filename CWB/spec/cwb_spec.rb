require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'
require 'active_support/all'

#require_relative '../lib/cwb.rb'

CWB_RESPONSE = YAML.load(File.read('./fixtures/data.yml'))

describe 'CWB specifications' do
  
  #test 01
  it 'should be able to download the data file(a hash data)' do
    
    #CWB_RESPONSE is Hash data or not
    CWB_RESPONSE.kind_of?(Hash).must_equal true 
    
=begin
	  
    if CWB_RESPONSE.kind_of?(Hash)
    	CWB_RESPONSE
    	hash.each { |key,value| puts "#{key} => #{value}" }
        puts CWB_RESPONSE.length
    end
    
=end
  
  end

  #test 02
  it 'should get name of every Weather Stations' do
 
    CWB_RESPONSE.has_key?('基隆').must_equal true
    CWB_RESPONSE.has_key?('淡水').must_equal true 
    CWB_RESPONSE.has_key?('板橋').must_equal true 
    CWB_RESPONSE.has_key?('竹子湖').must_equal true 
    CWB_RESPONSE.has_key?('鞍部').must_equal true 
    CWB_RESPONSE.has_key?('新竹').must_equal true 
    CWB_RESPONSE.has_key?('臺中').must_equal true 
    CWB_RESPONSE.has_key?('澎湖').must_equal true 
    CWB_RESPONSE.has_key?('日月潭').must_equal true 
    CWB_RESPONSE.has_key?('阿里山').must_equal true  
    CWB_RESPONSE.has_key?('玉山').must_equal true  
    CWB_RESPONSE.has_key?('嘉義').must_equal true  
    CWB_RESPONSE.has_key?('高雄').must_equal true  
    CWB_RESPONSE.has_key?('恆春').must_equal true  
    CWB_RESPONSE.has_key?('宜蘭').must_equal true  
    CWB_RESPONSE.has_key?('蘇澳').must_equal true  
    CWB_RESPONSE.has_key?('花蓮').must_equal true  
    CWB_RESPONSE.has_key?('成功').must_equal true
    CWB_RESPONSE.has_key?('臺東').must_equal true  
    CWB_RESPONSE.has_key?('大武').must_equal true  
    CWB_RESPONSE.has_key?('蘭嶼').must_equal true  
    CWB_RESPONSE.has_key?('彭佳嶼').must_equal true  
    CWB_RESPONSE.has_key?('東吉島').must_equal true
    CWB_RESPONSE.has_key?('永康').must_equal true 
    CWB_RESPONSE.has_key?('金門(合)').must_equal true 
    CWB_RESPONSE.has_key?('拉拉山').must_equal true 
    CWB_RESPONSE.has_key?('武陵').must_equal true  
    CWB_RESPONSE.has_key?('太魯閣').must_equal true  
    CWB_RESPONSE.has_key?('新店').must_equal true  
    CWB_RESPONSE.has_key?('臺北').must_equal true  
    CWB_RESPONSE.has_key?('彰師大').must_equal true  
    CWB_RESPONSE.has_key?('臺南').must_equal true  
    CWB_RESPONSE.has_key?('合歡山莊').must_equal true 
    CWB_RESPONSE.has_key?('吉貝').must_equal true 
    CWB_RESPONSE.has_key?('東沙').must_equal true 
    CWB_RESPONSE.has_key?('金門').must_equal true 
    CWB_RESPONSE.has_key?('馬祖').must_equal true 
    CWB_RESPONSE.has_key?('麥寮').must_equal true 
    CWB_RESPONSE.has_key?('新屋').must_equal true 
    CWB_RESPONSE.has_key?('古坑').must_equal true 
    CWB_RESPONSE.has_key?('九宮碼頭').must_equal true 

  end

=begin

  it 'should get temperature of every Weather Stations' do
   
  end

=end
  
end