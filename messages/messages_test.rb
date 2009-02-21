require "test/unit"

class TestMessages < Test::Unit::TestCase
  def test_messages_equal_method_calls
    tagline = "Unfortunately, no one can be told what the Matrix is."
    assert tagline[0..12].downcase == "unfortunately"
    assert tagline[0..12].send(:downcase) == "unfortunately"
    assert tagline[0..12].__send__(:downcase) == 'unfortunately'
    assert tagline[0..12].send("downcase".to_sym) == 'unfortunately'
  end         
  
  def test_construction
    a = Array.new
    assert a.kind_of? Array
    
    b = Array.send(:new)
    assert b.kind_of? Array
  end
    
  def create_from_factory(factory)
    factory.new
  end

  def test_factory
    list = create_from_factory(Array)
    assert list.kind_of? Array    
    
    hash = create_from_factory(Hash)
    assert hash.is_a? Hash
  end
end