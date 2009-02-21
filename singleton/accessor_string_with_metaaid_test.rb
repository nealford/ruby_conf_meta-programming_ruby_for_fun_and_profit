require "test/unit"
require "accessor_string_with_metaaid"


class TestAccessorString < Test::Unit::TestCase
  def test_person
    p = Person.new
    assert p.a.kind_of? String
    assert p.b.kind_of? String
  end
end