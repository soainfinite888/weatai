require 'yaml'
require 'active_support/all'

#require_relative '../lib/cwb.rb'
CWB_RESPONSE = YAML.load(File.read('./fixtures/data.yml'))
#CREDENTIALS ssssssssss= YAML.load(File.read('config/credentials.yml'))
#CWB_RESPONSE = YAML.load(File.read('./fixtures/data.yml'))
#RESULTS = YAML.load(File.read('spec/fixtures/results.yml'))



#puts CWB_RESPONSE

#test = '123'

#CWB_RESPONSE.each { |key,value| puts "#{key} => #{value}" }
 
if CWB_RESPONSE.kind_of?(Hash)
	puts "rlkmrtklm"
else
	puts "not hash"

end

puts CWB_RESPONSE.has_key?'基隆'





if CWB_RESPONSE == false 
	puts "空的"
else
	puts "有東西"
end



