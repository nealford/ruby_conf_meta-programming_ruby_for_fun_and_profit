require "test/unit"

require "accessor_string"


class TestAccessorString < Test::Unit::TestCase
  def test_person
    p = Person.new
    assert p.a.kind_of? String
    assert p.b.kind_of? String
  end
end