class String
  def rot(num = 13)
    return self.split("").collect { |ch|
      if /^[a-z]$/ === ch
        ((ch[0] + num - 'a'[0]) % 26 + 'a'[0]).chr
      elsif /^[A-Z]$/ === ch
        ((ch[0] + num - 'A'[0]) % 26 + 'A'[0]).chr
      else
        ch
      end
    }.join("")
  end

  alias rot13 rot
end


require "test/unit"

class TestRot13Encryption < Test::Unit::TestCase
  SMITH_RANT = <<EOS
    I'd like to share a revelation that I've had 
    during my time here. It came to me when I 
    tried to classify your species and I 
    realized that you're not actually mammals. 
    Every mammal on this planet 
    instinctively develops a natural equilibrium 
    with the surrounding environment but you 
    humans do not. You move to an area and 
    you multiply and multiply until every 
    natural resource is consumed and the 
    only way you can survive is to 
    spread to another area. There is 
    another organism on this planet that
     follows the same pattern. Do you know 
     what it is? A virus. Human beings 
     are a disease, a cancer of this planet. 
     You're a plague and we are the cure. 
EOS

  def test_simple_string
    s = "abcdef"
    assert s.rot == "nopqrs"
  end
  
end