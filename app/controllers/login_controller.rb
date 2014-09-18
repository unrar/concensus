require './app/models/login'
require './app/views/login'
require './app/views/public'
class LoginController
  class << self
    #Add your variables here!
    attr_accessor :level, :username, :password
  end
  @level, @username, @password = "public", "anonymous", "anonymous"
  def self.login
    LoginView.load

    # Is it empty?
    if @username.empty? or @password.empty?
      PublicView.error(3) 
    end

    # Does the username exist?
    unless LoginModel.exists?(@username)
      PublicView.error(4)
    end

    # Is the password correct?
    unless LoginModel.matches?(@username, @password)
      PublicView.error(5)
    end

    # Set the permission level
    LoginModel.find_user_level(@username)

    # We got the level, so we go back to the core
  end
end
