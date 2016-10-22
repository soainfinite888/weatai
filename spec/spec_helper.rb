
require 'simplecov'
SimpleCov.start



require 'minitest/autorun'
require 'minitest/rg'
require 'active_support/all'
require 'active_support/core_ext/hash'
require 'yaml'
require 'http'
require 'vcr'
require 'webmock'


require_relative '../lib/cwb.rb'
require_relative '../lib/cwb_api.rb'

CWB_RESPONSE = YAML.load(File.read('./fixtures/data.yml'))
CREDENTIALS = YAML.load(File.read('../config/credentials.yml'))