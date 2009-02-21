

require 'singleton'

class Log
  include Singleton
  def write(msg)
    puts msg
  end
end

module Aop
  def Aop.included(into)
    into.instance_methods(false).each { |m| Aop.hook_method(into, m) }

    def into.method_added(meth)
      unless @adding
        @adding = true
        Aop.hook_method(self, meth)
        @adding = false
      end
    end
  end

  def Aop.hook_method(klass, meth)
    klass.class_eval do
      if meth.to_s =~ /^persist_.*/
        alias_method "old_#{meth}", "#{meth}"
        define_method(meth) do |*args|
          Log.instance.write("calling method #{meth}")
          self.send("old_#{meth}",*args)
          Log.instance.write("call finished for #{meth}")
        end
      end
    end
  end
end
