=begin
Question: There is an attached log file from one of the development web server.
 Line number 2 of this log file is something like this "Processing by SprintsController#show as JSONAPI"
 This tells us, sprints controller's show action(method or function) ran. You have to parse this log
 file and output it the number of times the controller's actions run.
 Expected Output:
 SprintsController => show action ran 23 times
 SprintsController => index action ran 17 times

language: ruby 2.4.2p198
OS: Ubuntu mate 16.04 LTS
Author: Vikrant Patel
=end

def get_controller_statistics(file_name)
  controller_statistics = Hash.new {|hash,key| hash[key] = Hash.new(&hash.default_proc) }

  File.open(file_name).each do |line|
    if (line =~ /Controller/)

      # Get controller and its related actions as an array.
      controller_with_action = line.split("Controller#")

      controller_name = controller_with_action[0].split(" ").last
      controller_action = controller_with_action[1].split(" ").first

      # Check if there is any entry for fetched controller action.
      if controller_statistics[controller_name].key?(controller_action)
        controller_statistics[controller_name][controller_action] += 1

      else
        controller_statistics[controller_name][controller_action] = 1

      end
    end
  end

  controller_statistics.empty? ? (return nil) : (return controller_statistics)

end

# Print return value of get_controller_statistics method.
get_controller_statistics("development.log").each do |controler_name, value|
  value.each do |action_name, occurrence|
    puts "#{controler_name}Controller => #{action_name} action ran #{occurrence} times."
  end
end
