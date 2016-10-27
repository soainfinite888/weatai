#!/usr/bin/env ruby
# frozen_string_literal: true
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), *%w(.. lib))
require 'facegroup'

group_id = ARGV[0] || ENV['FB_GROUP_ID']
unless group_id
  puts 'USAGE: facegroup [group_id]'
  exit(1)
end

group = FaceGroup::Group.find(id: group_id)

puts group.name
puts Array.new(group.name.length) { '-' }.join
group.feed.postings.first(3).each.with_index do |post, index|
  print "#{index + 1}: "
  puts post.message ? post.message : '(blank)'
  puts "Attached: #{post.attachment.url}" if post.attachment
  puts
end