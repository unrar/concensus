require './app/controllers/default_controller'
require 'sqlite3'

class DefaultModel
  def self.look_name_up(given_name)
    begin
      db = SQLite3::Database.open('./db/census.db')
      re = db.execute("SELECT * FROM ages WHERE name='#{given_name}';")
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

  def self.look_age_up(given_name)
    begin
      db = SQLite3::Database.open('./db/census.db')
      age = db.execute("SELECT age FROM ages WHERE name='#{given_name}';").join('').to_i
    rescue
      puts "Database error."
      exit
    ensure
      db.close
    end
    DefaultController.age = age
  end
end
