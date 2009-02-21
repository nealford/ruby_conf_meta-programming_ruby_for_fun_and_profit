require 'rubygems'
require 'facets/memoize'  
  
class FacetsMemoized  
    def factorial(n)  
        puts n  
        if n < 1  
            1  
        else  
            n * factorial(n-1)  
        end  
    end  
  
    memoize :factorial # <= HINT  
end  
  
facets_memoized = FacetsMemoized.new  
  
5.downto(1) { |i| puts "\t#{facets_memoized.factorial(i)}" }  
