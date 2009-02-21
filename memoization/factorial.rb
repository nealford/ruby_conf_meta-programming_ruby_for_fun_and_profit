class Unmemoized  
    def factorial(n)  
        puts n  
        if n < 1  
            1  
        else  
            n * factorial(n-1)  
        end  
    end  
end  
  
unmemoized = Unmemoized.new  
  
5.downto(1) { |i| puts "\t#{unmemoized.factorial(i)}" }  


class Memoized
  attr_reader :factorial_memo
  def initialize
    @factorial_memo = {}
  end

  def factorial(n)
    puts n
    @factorial_memo[n] ||= if n < 1
      1
    else
      n * factorial(n-1)
    end
  end
end

memoized = Memoized.new

5.downto(1) { |i| puts "\t#{memoized.factorial(i)}" }

puts memoized.factorial_memo.inspect
