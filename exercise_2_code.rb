=begin
Question: We have a file which has 10 million numbers put in randomly ranging
from 0 to 99.
Sort the array and write it to another file without keeping the whole array
into memory or reading the whole file at once and putting it in memory.

language: ruby 2.4.2p198
OS: Ubuntu mate 16.04 LTS
Author: Vikrant Patel
=end

# # to generate 10 million random numbers and save it to random_numbers.txt; use below mentioned three lines in IRB
# File.open('random_numbers.txt', 'w') do |line|
#   line.puts 10_000_000.times.map{ Random.rand(99) }
# end
def sort_random_interger_file_data( file_name )
  require_relative 'sort_array'
  ranged_array = []

  unless File.file?( file_name )
    puts "file is not present; so creating '#{file_name}'."
    # taken a dataset of 100000 numbers
    File.open(file_name, 'w') do |line|
      line.puts 10_000_000.times.map{ Random.rand(99) }
      puts "'#{file_name}' has been created, with random integers ranging from 0 to 99."
    end
  end

  # fetch all the number from 'random_numbers.txt' into an array.
  File.foreach( file_name ) do |line|
    ranged_array.push line.to_i
  end
  puts "Taken data dump of unsorted data."

  # sort ranged_array
  ranged_array = sort_array(ranged_array)
  puts "sorted data dump."

  # Writing sorted numbers to file
  File.open("sorted_numbers.txt", "w") do |line|
    line.puts(ranged_array)
  end
  puts "Sorted data is stored into 'sorted_numbers.txt'."
end

# Calling method for execution
sort_random_interger_file_data( "random_numbers.txt" )
