require "rubygems"
require "mixology"

class Door
  def initialize(open = false)
    @open = open
    if open
      mixin Open
    else
      mixin Closed
    end

    def closed?
      kind_of? Closed
    end
    
    def opened?
      kind_of? Open
    end
  end
  
  module Closed
    def open
      unmix Closed
      mixin Open
    end
  end
  
  module Open
    def close
      unmix Open
      mixin Closed
    end
  end
end
