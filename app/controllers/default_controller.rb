require './app/models/default'
require './app/views/main'
class DefaultController
  class << self
    #Add your variables here!
    attr_accessor :name, :age
  end
  @name, @age = "void", 0
  def self.main
    MainView.load
    unless @name.empty?
      name_exists = DefaultModel.look_name_up(@name)
      if name_exists
    	 DefaultModel.look_age_up(@name)
       MainView.return_data
       exit
      else
        MainView.error(2)
      end
    else
    	MainView.error(1)
    end
  end
end
