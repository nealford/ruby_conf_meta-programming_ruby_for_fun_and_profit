module Quantifier
  def any?
    each { |x| return true if yield x }
    false
  end
  def all?
    each { |x| return false if not yield x }
    true
  end
end
