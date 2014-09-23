class PersonModel
  # Object defining a census entry
  attr_accessor :name, :age

  # Constructor
  def initialize (pname = nil, page = nil)
    @name = pname unless pname == nil
    @age = page unless page == nil
  end

  # Setters
  def name= (pname)
    @name = pname
  end
  def age= (page)
    @age = page
  end

  # Checkers
  def empty?
    return true unless name and age
  end
end
