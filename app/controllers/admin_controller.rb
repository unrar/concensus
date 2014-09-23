require './app/models/admin'
require './app/models/person'
require './app/models/public'
require './app/views/admin'
require './app/views/public'
require './app/controllers/public_controller'
class AdminController
  class << self
    #Add your variables here!
    attr_accessor :choice, :p
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

    # List all entries
    elsif @choice == 5
      cdb = AdminModel.list
      AdminView.process(cdb)
    end
  end
end
