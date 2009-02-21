require "test/unit"
require 'immutable_string'

class TestImmutableString < Test::Unit::TestCase

  def test_strings_have_the_same_object_id
    s1 = ImmutableString.new("foo")
    s2 = ImmutableString.new("foo")
    assert_equal s1.value.object_id, s2.value.object_id
  end
  
  def test_that_immutable_strings_are_immutable
    s1 = ImmutableString.new("foo")
    assert_raise NoMethodError do  
      s1.value = "bar" 
    end
  end
  
  def test_all_equals_methods_think_it_is_equal
    s1 = ImmutableString.new("foo")
    s2 = ImmutableString.new("foo")
    assert s1.value == s2.value
    assert s1.value.equal? s2.value
    assert s1.value.eql? s2.value
  end
  
  def test_that_it_acts_like_a_string_sometimes
    s1 = ImmutableString.new("foo")
    s2 = "bar"
    assert "foobar" == s1 + s2
    assert s1 == "foo"
  end                         
  
  def test_chevron
    s1  = ImmutableString.new("foo")
    s1 << "bar"
    s2 = s1 << "bar"
    assert s2 == "foobar"
    assert s1 == "foo"
  end
  
end
