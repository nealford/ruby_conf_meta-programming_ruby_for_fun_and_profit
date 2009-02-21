require "test/unit"

require "command_wrapper"

def wrap(&b)
  raise "Expected block!" unless block_given?
  s = ""
  class << s
    def write(message)
      self.<< message
    end
  end
  
  old = $stdout.clone
  $stdout = s
  b.call
  $stdout = old
  s
end

class TestCommandWrapper < Test::Unit::TestCase
  
  def setup
    @cw = CommandWrapper.new
  end
  
  def test_current_date
    expected = system('date')
    assert_equal expected, @cw.date
  end  
  
  def test_ls
    expected = system('ls')
    assert_equal expected, @cw.ls
  end
end
