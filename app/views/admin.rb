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

  def self.get_details(p, what)
    if what == :add
      puts "Creating new entry...".yellow
    elsif what == :remove
      puts "Deleting entry...".red
    elsif what == :preedit
      puts "Editing entry...".blue
    elsif what == :edit
      puts "Please enter the new data. If one value is unchanged, keep it blank.".green
    end
    unless what == :edit
      puts "Getting information".green
    end
    print "Enter name: "
    n = gets.chomp
    if what == :add or what == :edit
      print "Enter age: "
      age_str = gets.chomp
      if age_str == "" and what == :edit
        p.age = age_str
      else
        a = Integer(age_str) rescue nil
        if a == nil
          puts "The age must be an integer number!".red
          exit
        end
        p.age = a
      end
    end
    p.name = n
    return p
  end

  def self.success(what)
    if what == :add
      puts "Entry for " + AdminController.p.name.green + " correctly added to the census."
    elsif what == :remove
      puts "Entry for " + AdminController.p.name.red + " correctly removed from the census." 
    elsif what == :edit
      puts "Entry for " + AdminController.p.name.red + " correctly edited."
    end
    AdminController.main
  end

  def self.process(arr)
    puts "Listing all the entries in the census...".green
    arr.each do |row|
      puts "Name: " + row['name'].green + "; Age: " + row['age'].to_s.yellow + "."
    end
    puts "Listing finished.".red
    AdminController.main
  end
end
