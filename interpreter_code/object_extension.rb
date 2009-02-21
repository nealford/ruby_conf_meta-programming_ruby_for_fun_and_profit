module ObjectExtension
  
  def eigenclass; class << self; self; end; end
   
  def eigen_eval &blk; eigen_class.instance_eval &blk; end

  def self.included(klass)
    klass.send :undef_method, :id
  end
  
  def not_nil?
    !self.nil?
  end
end

Object.send :include, ObjectExtension
