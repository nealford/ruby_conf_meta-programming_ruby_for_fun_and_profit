require "test/unit"
require "counting_quantifier"

class Array
  include Quantifier
end

class TestCountingQuantifier < Test::Unit::TestCase
  
  def setup
    @list = []
    # @list.extend(Quantifier)
    1.upto(20) do |i|
      @list << i
    end
  end
  
  def test_everything_because_order_now_matters!
    assert @list.all? { |x| x < 50 }
    assert_equal 20, Array.quantified_count
    assert !@list.all? { |x| x < 10 }
    assert_equal 30, Array.quantified_count
    assert @list.any? {|x| x > 5 }
    assert_equal 36, Array.quantified_count
    assert ! @list.any? {|x| x > 20 }
    assert_equal 56, Array.quantified_count
  end
  
end