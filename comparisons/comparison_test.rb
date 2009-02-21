require "test/unit"
require "comparison"

class TestComparison < Test::Unit::TestCase
  
  def setup
    @list = Array.new
    @list << Person.new("Neo")
    @list << Person.new("Trinity")
    @list << Person.new("Morpheus")
  end

  def test_comparison_works_correctly
    @list.sort!
    expected_names = ["Morpheus", "Neo", "Trinity"]
    @list.each_with_index do |p, i|
      assert_equal expected_names[i], p.name
    end
    assert @list[1].between? @list[0], @list[2]
    
  end
  
end
