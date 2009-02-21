require "test/unit"

require "final"

class TestFinal < Test::Unit::TestCase
  class P; include Final; end
  
  class C < P; end
  
end