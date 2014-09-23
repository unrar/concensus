require './app/controllers/admin_controller'
require 'sqlite3'
require 'colorize'

class AdminModel
  def self.list
    begin
      db = SQLite3::Database.open('./db/census.db')
      db.results_as_hash = true
      return db.execute("SELECT * FROM ages;")
    rescue
      puts "Database error.".red
    ensure
      db.close
    end
  end

  def self.write(p)
    begin
      db = SQLite3::Database.open('./db/census.db')
      re = db.execute("INSERT INTO ages(name, age) VALUES(\"#{p.name}\",#{p.age});")
    rescue
      puts "Database error.".red
      exit
    ensure
      db.close
    end
  end
end