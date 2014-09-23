require './app/controllers/admin_controller'
require './app/controllers/login_controller'
require 'colorize'

class AdminView
  def self.load
    # Show the menu
    puts "Welcome to the concensus administrator, #{LoginController.username}. What would you like to do?"
    puts "    1- Look a name up."
    puts "    2- Add someone to the census."
    puts "    3- Remove someone from the census."
    puts "    4- Edit a census entry."
    puts "    5- See all the census entries."
    puts "    6- Exit."
    AdminController.choice = gets.chomp.to_i
  end

  def self.get_details(p)
    puts "Creating new entry...".yellow
    puts "Getting information".green
    print "Enter new name: "
    n = gets.chomp
    print "Enter new age: "
    a = Integer(gets.chomp) rescue nil
    if a == nil
      puts "The age must be an integer number!".red
      exit
    end
    p.name = n
    p.age = a
    return p
  end

  def self.success
    puts "Entry for ".green + AdminController.p.name.yellow + " correctly added to the census!".green
    exit
  end

  def self.process(arr)
    puts "Listing all the entries in the census...".green
    arr.each do |row|
      puts "Name: " + row['name'].green + "; Age: " + row['age'].to_s.yellow + "."
    end
    puts "Listing finished.".red
  end
end