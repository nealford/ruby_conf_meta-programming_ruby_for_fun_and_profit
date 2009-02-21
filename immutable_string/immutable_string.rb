class ImmutableString
  attr_reader :value
  
  def initialize(s)
    @value = s.to_sym
  end
  
  def +(other)
    String.new(@value.to_s + other)
  end
  
  def <<(addition)
    return @value.to_s + addition
  end

  def to_s
    @value.to_s
  end
  
  def ==(other)
    @value.to_s == other
  end
  
end