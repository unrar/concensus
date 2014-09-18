require './app/controllers/public_controller'
require './app/controllers/login_controller'

# First of all, start the login process
LoginController.login

# Now start either the public or the admin process
if LoginController.level == 2
  puts "hai admin"
elsif LoginController.level == 1
  PublicController.main
else
  puts "wtf"
end