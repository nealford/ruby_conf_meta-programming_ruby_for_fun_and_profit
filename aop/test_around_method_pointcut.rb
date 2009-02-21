require 'test/unit'
require 'around_method_pointcut'
require 'old_fashioned_logging'

class TestAroundMethodPointcut < Test::Unit::TestCase

  def test_oldfasioned_logging
    l = OldFashioned.new
    l.some_method
  end


  class Subject
    include Aop
    def persist_info
      puts "inside method persist_info"
    end

    def non_persist_info
      puts "inside method non_persist_info"
    end
  end

  def test_methods_with_wrapped_names
    s = Subject.new
    s.persist_info
    s.non_persist_info
  end
end
