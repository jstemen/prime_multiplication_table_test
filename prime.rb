#!/bin/env ruby
class Primer
  def initialize(limit)
    @max_num = limit
    @num_len= Math.log @max_num * @max_num, 10
  end

  def print_multi_table(separator = ' ')
    primes = find_primes @max_num
    header = primes.collect{|prim| format_num(prim)}.join separator 
    puts "   #{header}"
    primes.each{|prime_side,row|
      row= primes.collect{|prime_top,col|
        format_num(prime_top*prime_side)
      }.join(separator)
      puts "#{format_num(prime_side)} #{row}"
    }
  end
  private  
  def find_primes(max)
    canidates = (0..max).to_a
    k=2
    while(k<= canidates.size/2)
      j=2
      while(j<= canidates.size/2)
        prod = k*j 
        if prod <= max
          canidates[prod] = nil
        end
        j+=1
      end
      k+=1
    end
    res = canidates.compact
    res.shift(2)
    res
  end

  def format_num(num)
    num.to_s.rjust @num_len, ' '
  end
end
primer = Primer.new 10
primer.print_multi_table
