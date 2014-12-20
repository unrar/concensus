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
    	 p = PublicModel.look_age_up(@name)
       @age = p.age
       ret = PublicView.return_data
        if ret
          exit
        else
          # If it's an admin, go to menu again
          if LoginController.level == 2
            AdminController.main
          else
            PublicController.main
          end
        end
      else
        PublicView.error(2)
      end
    else
    	PublicView.error(1)
    end
  end
end
