# Simple class to handle prime number generation and priting of prime multiplication table
class Primer

  # @param [FixNum] limit - The largest value of primes we should search for
  def initialize(limit)
    @max_num = limit
    #length must be at least 1 for numbers less than 10
    @num_len= [Math.log(@max_num * @max_num, 10), 1].max
  end

  #Note: We could just use a gem to do this, but where's the fun in that?
  # Prints a multiplication table of all primes up to the max number specified
  # @param [String] separator - separates printed columns
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

  # Find Array of all primes up to the limit given during object construction
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
  # @param [Fixnum] num - converts Fixnum to string with the appropriate amount of padding
  def format_num(num)
    num.to_s.rjust @num_len, ' '
  end
end
