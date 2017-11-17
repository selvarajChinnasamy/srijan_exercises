=begin
Question: There is an odometer in a bike and it is broken in a way whenever
there supposed to be value 4 in one of the 5 digits in odometer it skips that
and shows 5. It is not able to display the digit 4. For example, if the
odometer is at reading 32363 KM then next reading it will show is 32365 and not
32364 or if the odometer shows 3999 then next reading it will show is 5000
instead 4000.
So if odometer shows the current reading 56287 then what is its actual reading?

language: ruby 2.4.2p198
OS: Ubuntu mate 16.04 LTS
Author: Vikrant Patel
=end


def correct_odometer_reading(altered_reading)
  # Maintain the odometer's shown reading
  reading = altered_reading.to_i

  # Would be required if the odometer's shown reading is 12000 so reverd
  input_reading_size = reading.to_s.size

  # Check if the provided odometer reading is acceptable or not; if not then exit.
  if (0 < reading && reading<=99999)
    corrected_reading = 0
    corrected = false

    # Loop will keep running until the reading become less than 0
    while reading > 0 do
      corrected_reading *= 10

      # Get digit for inspection. check if it is 5 and correction has not been done.
      # Malfunction will happen to right most digit '4' as incrementation happens from right most.
      digit = (reading % 10)
      if (corrected == false && digit == 5)
        digit = 4
        corrected = true
      end

      # Re-framing the reading as it was provided as parameter.
      corrected_reading += digit

      reading = reading / 10
    end

    corrected_reading = corrected_reading.to_s
    corrected_reading_length = corrected_reading.size
    corrected_reading = corrected_reading.reverse.to_i

    # multiply by 10s to regain the actual number size as parameter has.
    (input_reading_size - corrected_reading_length).times {corrected_reading *= 10}

    puts "If odometer is showing #{altered_reading} then the actual reading was #{corrected_reading}."
  else

    exit
  end
end

# Check provided sample from problem statement.
correct_odometer_reading(32365)
correct_odometer_reading(5000)
correct_odometer_reading(56287)
