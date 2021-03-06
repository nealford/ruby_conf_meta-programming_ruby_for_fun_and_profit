require "test/unit"

class TestFreezing < Test::Unit::TestCase
  def test_string_freezing
    str = "Do not try and bend the spoon."
    str.freeze
    assert_raise TypeError do
      str << "That is impossible."
    end
  end
  
  def test_array_freezing
    array = [1, 2, 5]
    array.freeze
    assert_raise TypeError do
      array << 3
    end
  end

  def test_hash_freezing
    hash = [1 => "one", 2 => "two"]
    hash.freeze
    assert_raise TypeError do
      hash['foo'] = 'bar'
    end
  end
  
  def test_mutating_value_instead_of_reference
    str = "counter"
    str.freeze
    str += "-intuitive"
    assert str == "counter-intuitive"
  end
  
  def test_frozen_clones
    hash = { 1 => "one", 2 => "two", 3 => "three"} 
    hash.freeze
    assert hash.frozen?
    array = hash.to_a
    assert ! array.frozen?
    hash2 = hash
    assert hash2.frozen?
    hash_clone = hash.clone
    assert hash_clone.frozen?
  end
end
