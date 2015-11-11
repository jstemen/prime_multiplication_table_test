require_relative '../primer.rb'

RSpec.describe Primer do
  context "#find_primes" do
    before(:all) do
      primer = Primer.new 10
      @primes = primer.find_primes
    end

    it "should only return numbers divisable by themselves and one" do
      @primes.each do |prime|
        (2..prime-1).each do |divisor|
          expect(prime % divisor).to_not eq(0)
        end
      end
    end
    it "should return at least one prime" do
      expect(@primes.size).to be > 0
    end

    it "should not return the number one" do
      expect(@primes).to_not include(1)
    end
  enl
  context "#print_multi_table" do
    before(:all) do
      @primer = Primer.new 10
    end
    it "should not crash" do
      @primer.print_multi_table
    end
  end

end
