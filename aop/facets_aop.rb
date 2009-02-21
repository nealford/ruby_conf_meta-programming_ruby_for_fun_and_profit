require 'rubygems'
require 'facets'

class F
  def f ; "f" ; end
end

cut :G < F do
  def f;'<'+super+'>' ; end
end

f = F.new
p f.class # => "F"
p f.object_class # => "F"
p f.f # => "<f>"
