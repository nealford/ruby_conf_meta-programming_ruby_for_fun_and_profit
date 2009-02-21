require "test/unit"
require "recorder"
require 'recorder2'

class TestRecorder < Test::Unit::TestCase
  def test_recorder
    r = Recorder.new
    r.sub!(/Java/) { "Ruby" }
    r.upcase!
    r[11, 5] = "Universe"
    r << "!"
    
    s = "Hello Java World"
    r.play_back_to(s)
    assert_equal "HELLO RUBY Universe!", s    
  end
  
  def test_recorder_fails_when_existing_methods_called
    r = Recorder.new
    r.downcase!
    r.freeze
    
    s = "Hello Ruby"
    r.play_back_to s
    assert_equal("hello ruby", s)
    assert_equal(s.upcase!, "HELLO RUBY")    
  end
  

  def test_recorder_works_with_blankslate
    r = Recorder2.new
    r.downcase!
    r.freeze
    
    s = "Hello Ruby"
    r.play_back_to s
    assert_equal("hello ruby", s)
    assert_raise(TypeError) {  
      s.upcase!
    }
  end
  
end