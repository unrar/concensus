require './app/controllers/public_controller'
require './app/controllers/login_controller'
require 'colorize'

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
    elsif errno == 6
      puts "Error: The entry for #{AdminController.p.name} already exists.".red
    elsif errno == 7
      puts "Error: The entry for #{AdminController.p.name} doesn't exist.".red
    else
      puts "Unknown error."
    end
    exit
  end

  def self.load
    puts "Welcome to the census, #{LoginController.username}. Please enter the name you'd like to look up."
    PublicController.name = gets.chomp
  end

  def self.return_data
    puts "#{PublicController.name} was found in the census. He/She is #{PublicController.age}."
  end
end
