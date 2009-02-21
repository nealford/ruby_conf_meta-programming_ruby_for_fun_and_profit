require 'around_method_pointcut'

class OldFashioned
  def some_method
    Log.instance.write("starting method 'some_method'")
    puts "do something important"
    Log.instance.write("ending method 'some_method'")
  end
end
