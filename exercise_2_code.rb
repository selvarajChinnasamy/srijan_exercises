=begin
Question: We have a file which has 10 million numbers put in randomly ranging
from 0 to 99.
Sort the array and write it to another file without keeping the whole array
into memory or reading the whole file at once and putting it in memory.

language: ruby 2.4.2p198
OS: Ubuntu mate 16.04 LTS
Author: Vikrant Patel
=end

# # to generate 10 million random numbers and save it to test.txt; use below mentioned three lines in IRB
# File.open('random_numbers.txt', 'w') do |line|
#   line.puts 10_000_000.times.map{ Random.rand(99) }
# end
ranged_array = []

# taken a dataset of 100000 numbers
File.open('random_numbers.txt', 'w') do |line|
  line.puts 1_000.times.map{ Random.rand(99) }
  puts "'random_numbers.txt' has been create, with random integers ranging from 0 to 99."
end

# fetch all the number from 'random_numbers.txt' into an array.
File.foreach( 'random_numbers.txt' ) do |line|
  ranged_array.push line.to_i
end

