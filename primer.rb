class Primer
  def initialize(limit)
    @max_num = limit
    @num_len= [Math.log(@max_num * @max_num, 10), 1].max
  end

  def print_multi_table(separator = ' ')
    primes = find_primes 
    header = primes.collect{|prim| format_num(prim)}.join separator 
    puts separator * (1+ @num_len) + header
    primes.each{|prime_side,row|
      row= primes.collect{|prime_top,col|
        format_num(prime_top*prime_side)
      }.join(separator)
      puts "#{format_num(prime_side)} #{row}"
    }
  end
  def find_primes
    canidates = (0..@max_num).to_a
    k=2
    while(k<= canidates.size/2)
      j=2
      while(j<= canidates.size/2)
        prod = k*j 
        if prod <= @max_num
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

  private  
  def format_num(num)
    num.to_s.rjust @num_len, ' '
  end
end
