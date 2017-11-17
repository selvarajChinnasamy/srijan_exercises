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

def get_controller_actions(file_name, controller_name)
  controller_actions = {}

  File.open(file_name).each do |line|
    if (line =~ /#{controller_name}/)
      # Get controller action from the fetched line.
      controller_action = line.split("#")[1].split(" ").first

      # controller_actions.key?(controller_action) ? controller_actions[controller_action] += 1 : controller_actions[controller_action] = 1
      if controller_actions.key?(controller_action)
        controller_actions[controller_action] += 1

      else
        controller_actions[controller_action] = 1

      end
    end
  end

  controller_actions.empty? ? (return nil) : (return controller_actions)

end

get_controller_actions("development.log", "SprintsController").each do |key, value|
  puts "SprintsController => #{key} action ran #{value} times."
end

# # If user wants to check other controller's actions
# get_controller_actions("development.log", "ApplicationController").each do |key, value|
#   puts "ApplicationController => #{key} action ran #{value} times."
# end
