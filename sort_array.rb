def count_sort(input_array, exponent = 0)

  count_array = Array.new(10, 0)
  output_array = Array.new(input_array.size)

  incremented_tenth_exponential = 10**(exponent + 1)
  tenth_exponential = 10**exponent

  # count occurrence of currently significant digit
  # if exp == 0 than 5 is the currently significant digit in 135
  input_array.each do |number|
    significant_number = (number % incremented_tenth_exponential) / tenth_exponential
    count_array[significant_number] += 1
  end

  # modify count_array to show actual index
  for index in 1...10
    count_array[index] = count_array[index-1] + count_array[index]
  end

  # getting data into output array
  index = input_array.size - 1
  until index < 0 do
    number = input_array[index]
    significant_number = (number % incremented_tenth_exponential) / tenth_exponential
    count_array[ significant_number ] -= 1
    output_array[ count_array[ significant_number ]] = number
    index -= 1
  end

  output_array
end


def sort_array(array_parameter)

  largest_number = array_parameter.max

  # find up to what exponent the numbers are there in
  exponent = 0

  until largest_number == 0 do
    exponent += 1
    largest_number /= 10
  end

  for index in 0...exponent do
    array_parameter =  count_sort(array_parameter, index)
  end

  array_parameter
end
