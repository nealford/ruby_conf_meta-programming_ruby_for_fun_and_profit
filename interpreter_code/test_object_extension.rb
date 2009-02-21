require 'test/unit'
require 'object_extension'

class TestObjectExtension < Test::Unit::TestCase

  def test_that_object_has_extended_methods
    o = Object.new
    assert o.respond_to?(:eigenclass)
    assert o.respond_to?(:eigen_eval)
    assert o.not_nil?
  end
end
