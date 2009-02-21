require "test/unit"
require "arraylist_proxy"

class TestArrayListProxy < Test::Unit::TestCase
  def setup
    @list = ArrayList.new
    @list << 'Red' << 'Green' << 'Blue'
    def @list.last
      size == 0 ? nil : get(size - 1)
    end
  end
  
  def test_first
    assert_equal "Red", @list.first
  end
  
  def test_last
    assert_equal "Blue", @list.last
  end
  
  def test_that_last_does_not_exist_for_other_instances
    list = ArrayList.new
    list << "One" << "Two"
    assert_raise(NoMethodError) { 
      list.last
    }
  end
  
end