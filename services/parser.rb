require 'byebug'
require_relative '../lib/visitor'
require_relative '../lib/visitor_views'
require_relative './console_output'

#input_file = File.open('./input/webserver.log', 'r')
input_file = File.open(ARGV[0], 'r')
visitors = []

input_file.each_line do |line|
  visitor = line.split(" ")
  visitors << Visitor.new(link: visitor[0], ip: visitor[1]) 
end

visitor_views = VisitorViews.new(
  visitors: visitors 
)

console_output = ConsoleOutput.new(
  views: visitor_views.desc_sort_by('views'),
  unique_views: visitor_views.desc_sort_by('unique_views')
)
console_output.output()
