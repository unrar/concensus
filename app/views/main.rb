require './app/controllers/default_controller'
class MainView

  def self.error(errno)
    if errno == 1
      puts "Error: The name is empty."
    elsif errno == 2
      puts "Error: #{DefaultController.name} wasn't found in the census."
    else
      puts "Unknown error."
    end
    exit
  end

  def self.load
    puts "Welcome to the census. Please enter the name you'd like to look up."
    DefaultController.name = gets.chomp
  end

  def self.return_data
    puts "#{DefaultController.name} was found in the census. He/She is #{DefaultController.age}."
  end
end
