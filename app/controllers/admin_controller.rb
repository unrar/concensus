require './app/models/admin'
require './app/models/person'
require './app/models/public'
require './app/views/admin'
require './app/views/public'
require './app/controllers/public_controller'
class AdminController
  class << self
    #Add your variables here!
    attr_accessor :choice, :p, :np
  end
  @choice, @p = 0, nil
  def self.main
    AdminView.load

    # Look a name up
    if @choice == 1
      PublicController.main

    # Add a new entry
    elsif @choice == 2
      @p = PersonModel.new
      @p = AdminView.get_details(p, :add)
      exists = PublicModel.look_name_up(@p.name)
      if exists
        PublicView.error(6)
      end
      AdminModel.write(@p)
      AdminView.success(:add)

    # Remove an entry
    elsif @choice == 3
      @p = PersonModel.new
      @p = AdminView.get_details(p, :remove)
      exists = PublicModel.look_name_up(@p.name)
      unless exists
        PublicView.error(7)
      end
      AdminModel.remove(@p)
      AdminView.success(:remove)

    # Edit an entry
    elsif @choice == 4
      # Create a person model and try and fill it with existing info
      @p = PersonModel.new
      @p = AdminView.get_details(@p, :preedit)
      exists = PublicModel.look_name_up(@p.name)
      unless exists
        PublicView.error(7)
      end
      # Create a new person with the edited details
      @np = PersonModel.new
      @np = AdminView.get_details(@np, :edit)
      # Now we have the details: check if any are void
      if @np.name == ""
        @np.name = @p.name
      end
      if @np.age == ""
        @np.age = @p.age
      end
      if @np.age == @p.age and @np.name == @p.name
        PublicView.error(8)
      end
      # Edit the entry
      AdminModel.edit(@p, @np)
      AdminView.success(:edit)


    # List all entries
    elsif @choice == 5
      cdb = AdminModel.list
      AdminView.process(cdb)

    # Exit
    else
      puts "Good bye, #{LoginController.username}!"
      exit
    end
  end
end
