# weatai Gem

[![Gem Version](https://badge.fury.io/rb/weatai.svg)](https://badge.fury.io/rb/weatai)
[![Build Status](https://travis-ci.org/ISS-SOA/weatai.svg?branch=master)](https://travis-ci.org/ISS-SOA/weatai)

weatai is a gem that specializes in getting data from Central Weather Bureau(Taiwan).

## Installation

If you are working on a project, add this to your Gemfile: `gem 'weatai'`

For ad hoc installation from command line:

```$ gem install weatai```

## Setup Central Weather Bureau(Taiwan) Credentials

Please setup your Central Weather Bureau credentials by creating an account on Central Weather Bureau Website: http://www.cwb.gov.tw – creating an CWB member account
and go to :http://opendata.cwb.gov.tw - login by CWB member account and get credentials (資料使用說明->取得驗證碼)

## Usage

Require weatai gem in your code: `require 'weatai'`

Supply your CWB credentials to our library in one of two ways:
- Setup environment variables: `ENV[FB_CLIENT_ID]` and `ENV[FB_CLIENT_SECRET]`
- or, provide them directly to weatai:

```
weatai::Config = { dataid: ENV['DATA_ID'],
                   key: ENV['KEY'] }
```

See the following example code for more usage details:
