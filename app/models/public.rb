require './app/controllers/public_controller'
require './app/models/person.rb'

require 'sqlite3'

class PublicModel
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
    # Create a person
    p = PersonModel.new(given_name, age)
    return p
  end
end
