def tell_fortunes &block
  date = Time.now

  post_fortune = lambda { |s| 
    block.call date, s
  }

  post_fortune.call "Your day is filled with ceremony"
  post_fortune.call "They're features, not bugs"

end

tell_fortunes do | date, fortune| 
  puts "Fortune for #{date} is #{fortune}"
end

class Proc

  def curry(*args)
    if args.empty?
      idx = (0...arity).to_a
    else
      raise ArgumentError, "argument count is greater than arity (#{args.size} > #{arity})" if args.size > arity
      raise ArgumentError, "arguments must be unique indexes" if args.uniq != args
      raise ArgumentError, "arguments must be indexes" if args.any? { |a| !Fixnum===a }
      idx = (0...arity).to_a
      idx = args + (idx - args)
    end

    rec = ''
    idx.each do |i|
      rec << "proc { |a#{i}| "
    end
    rec << "self["
    rec << (0...arity).to_a.collect{|i| "a#{i}"}.join(',')
    rec << "]"
    rec << "}" * arity

    instance_eval rec
  end

end


def curried_fortunes &block
  date = Time.now

  post_fortune = block.curry(date)

  post_fortune["Your day is filled with ceremony"]
  post_fortune["They're features, not bugs"]

 
end

curried_fortunes do |date, fortune| 
  puts "Fortune for #{date} is #{fortune}"
end
