class Person
  include Comparable
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def <=>(other)
     name <=> other.name    
  end
end