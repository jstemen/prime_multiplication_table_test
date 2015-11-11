#!/bin/env ruby

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

def format_num(num, num_length)
  num.to_s.rjust num_length, ' '
end

separator = ' '
max_num = 100
primes = find_primes max_num
num_len= Math.log max_num * max_num, 10
header = primes.collect{|prim| format_num(prim, num_len)}.join separator 
puts "    #{header}"
primes.each{|prime_side,row|
  row= primes.collect{|prime_top,col|
    format_num(prime_top*prime_side, num_len)
  }.join(separator)
  puts "#{format_num(prime_side, num_len)} #{row}"
}
