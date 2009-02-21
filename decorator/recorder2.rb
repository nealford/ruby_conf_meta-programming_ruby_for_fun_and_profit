require File.dirname(__FILE__) + "/../builder/blankslate"

class Recorder2 < BlankSlate
  def initialize
    @messages = []
  end
  
  def method_missing(method, *args, &block)
    @messages << [method, args, block]
  end      
  
  def play_back_to(obj)
    @messages.each do |method, args, block|
      obj.send(method, *args, &block)
    end
  end
end
