require './app/models/public'
require './app/views/public'
class PublicController
  class << self
    #Add your variables here!
    attr_accessor :name, :age
  end
  @name, @age = "void", 0
  def self.main
    PublicView.load
    unless @name.empty?
      name_exists = PublicModel.look_name_up(@name)
      if name_exists
    	 PublicModel.look_age_up(@name)
       PublicView.return_data
       exit
      else
        PublicView.error(2)
      end
    else
    	PublicView.error(1)
    end
  end
end
