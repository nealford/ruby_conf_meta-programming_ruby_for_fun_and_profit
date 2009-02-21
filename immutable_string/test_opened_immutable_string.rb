require "test/unit"

require "unupdatable_string"

class TestUnupdateableString < Test::Unit::TestCase
  
  def test_other_methods
    s1 = String.new "foo"
    assert_raise NoMethodError do
      s1.downcase!
    end                  
    
    assert_raise NoMethodError do
      s1.capitalize!
    end
  end
  
  def test_that_methods_still_work
    s1 = "foo"
    s2 = s1 + 'bar'
    assert "foobar" == s2
  end
end