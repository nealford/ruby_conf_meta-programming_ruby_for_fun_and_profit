module Quantifier
  @@quantified_count = 0
  
  def Quantifier.append_features(targetClass)
    def targetClass.quantified_count
      @@quantified_count
    end
    super
  end
  
  def any?
    each do |x| 
      @@quantified_count += 1
      return true if yield x 
    end
    false
  end
  
  def all?
    each do |x| 
      @@quantified_count += 1
      return false if not yield x 
    end
    true
  end
end
