require './app/controllers/login_controller'
require 'io/console'
class LoginView
  def self.load
    # Login notice
    puts "You need to log into the census in order to use it. Tip: if you're a visitor, use"
    puts "'anonymous' as username and password."
    puts ""
    # Ask for the username
    print "Enter your username: "
    LoginController.username = gets.chomp
    print "Enter your password: "
    LoginController.password = STDIN.noecho(&:gets).chomp
    # Go back to the controller
    puts ""
  end
end
