#!/usr/bin/ruby

require ('./lib/pascal_logic.rb')

def intro
  puts "--------------------"
  # puts "Pascal's N-Dimensional Shape:"
  puts "Pascal's Natural Constant Calculator"
  puts "--------------------"
  print "How many dimensions would you like to see built?  "
  # print "How many terms would you like to use to calculate e? "
  return gets.chomp.to_s.to_i
end

rows = intro()
rows.build_tri()
# rows.find_e()
