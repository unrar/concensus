require './app/controllers/login_controller'
class LoginModel

  # Does the username exist?
  def self.exists?(given_username)
    begin
      db = SQLite3::Database.open('./db/census.db')
      re = db.execute("SELECT * FROM users WHERE username='#{given_username}';")
      if re.length > 0
        return true
      else
        return false
      end
    rescue
      puts "Database error."
      exit
    ensure
      db.close
    end
  end

  # Is the password correct?
  def self.matches?(given_username, given_password)
    begin
      db = SQLite3::Database.open('./db/census.db')
      re = db.execute("SELECT * FROM users WHERE username='#{given_username}' AND password='#{given_password}';")
      if re.length > 0
        return true
      else
        return false
      end
    rescue
      puts "Database error."
      exit
    ensure
      db.close
    end
  end

  # Set the user level
  def self.find_user_level(given_username)
    begin
      db = SQLite3::Database.open('./db/census.db')
      level = db.execute("SELECT level FROM users WHERE username='#{given_username}';").join('').to_i
    rescue
      puts "Database error."
      exit
    ensure
      db.close
    end
    LoginController.level = level
  end
end
