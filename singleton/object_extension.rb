module ObjectExtension
  
  def metaclass; class << self; self; end; end
   
  def meta_eval &blk; metaclass.instance_eval &blk; end

  def self.included(klass)
    klass.send :undef_method, :id
  end
  
  def not_nil?
    !self.nil?
  end
end

Object.send :include, ObjectExtension
