#!/usr/bin/env ruby

require 'json'
require_relative '../lib/data_parser.rb'

print 'Enter JSON File path: '

path = gets.chomp
extension = File.extname(path)

raise "File is invalid! (#{extension.inspect})" unless extension == '.json'

puts 'Enter Partial or Full Name : '

full_name = gets.chomp

result = DataParser.parse(path:).process(params: { full_name: }).names

puts "Result : #{JSON.pretty_generate(result)}"

puts 'Do you want to show duplicate email(s)? '

answer = gets.chomp
if answer&.downcase != 'yes'
  puts 'You have not answered: `Yes`. Application is terminated! Thanks!'
  exit
end

emails = DataParser.parse(path:).process.emails
puts "Email that has duplicate : #{JSON.pretty_generate(emails)}"

puts "Test commit---"
