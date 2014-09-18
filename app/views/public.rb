require './app/controllers/public_controller'
require './app/controllers/login_controller'
class PublicView

  def self.error(errno)
    if errno == 1
      puts "Error: The name is empty."
    elsif errno == 2
      puts "Error: #{PublicController.name} wasn't found in the census."
    elsif errno == 3
      puts "Error: Void username or password."
    elsif errno == 4
      puts "Error: #{LoginController.username} wasn't found in the login database."
    elsif errno == 5
      puts "Error: Incorrect password for #{LoginController.username}."
    else
      puts "Unknown error."
    end
    exit
  end

  def self.load
    puts "Welcome to the census. Please enter the name you'd like to look up."
    PublicController.name = gets.chomp
  end

  def self.return_data
    puts "#{PublicController.name} was found in the census. He/She is #{PublicController.age}."
  end
end