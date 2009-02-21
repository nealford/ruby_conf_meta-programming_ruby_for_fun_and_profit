flag = true

if flag
  class String
    def dance
      self + "dance!"
    end
  end
end

if !flag
   class String
     def touch_monkey
       self + "Touch him! Love him!"
     end
   end
end   

require "test/unit"

class TestOpenedString < Test::Unit::TestCase
  def test_dancing
    s = "Now is the time on Sprockets when we ".dance
    assert s == "Now is the time on Sprockets when we dance!"
  end

  def test_changing_flag_has_no_effect
    flag = false
    s = "Now is the time on Sprockets when we ".dance
    assert s == "Now is the time on Sprockets when we dance!"    
  end                                 
  
  def test_monkey
    assert_raise NoMethodError do
      s = "Touch my monkey".touch_monkey
    end
  end
end