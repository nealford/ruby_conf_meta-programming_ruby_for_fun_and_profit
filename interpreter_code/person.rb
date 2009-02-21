result = class Person
  attr_accessor :name

  def initialize name
    @name = name
  end

  x = def name
    @name.upcase
  end

  puts x
  42
end


homer = Person.new "Homer"
puts homer.name

puts result

method = homer.method :name
puts method.call
