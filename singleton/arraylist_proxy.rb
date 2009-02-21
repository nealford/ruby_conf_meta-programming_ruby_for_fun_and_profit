require "java"

include_class "java.util.ArrayList"

class ArrayList
  def first
    size == 0 ? nil : get(0)
  end
end