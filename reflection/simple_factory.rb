def create_from_factory(factory)
  factory.new
end

list = create_from_factory(Array)
puts "list is a " + list.class.to_s

hash = create_from_factory(Hash)
puts "hash is a " + hash.class.to_s