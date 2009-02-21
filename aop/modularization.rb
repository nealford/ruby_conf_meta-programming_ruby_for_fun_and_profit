class Person
  attr_accessor :name

  def initialize name
    @name = name
  end
end

class EntityObserver
  def receive_update subject
   puts "adding new name: #{subject.name}"
  end
end

module Subject
  def add_observer observer
    raise "Observer must respond to receive_update" unless 
      observer.respond_to? :receive_update
    @observers ||= []
    @observers.push observer
  end

  def notify subject
    @observers.each { |o| o.receive_update subject }
  end
end

class Person
  include Subject
  old_name = self.instance_method(:name=)

  define_method(:name=) do |new_name|
    old_name.bind(self).call(new_name)
    notify self
  end
end

neo = Person.new "neo"
morpheus = Person.new "morpheus"
neo.add_observer EntityObserver.new
neo.add_observer EntityObserver.new
morpheus.add_observer EntityObserver.new
neo.name = "the one"
morpheus.name = "the prophet"
