class Fixnum
  def build_tri
    puts "-"*20
    print "How many layers deep? "
    number = gets.chomp.to_s.to_i
    if self == 2
      self.two(number)
    else
      puts "Oops! That's not an option -- yet."
    end
  end

  def find_e # Maximum accuracy of 15 decimal places at 18 terms
    puts "-"*20
    e_stimate = 0
    (self).times() do |term|
      e_stimate += 1 / term.fact().to_f
    end
    puts "Estimation of e: #{e_stimate}"
    puts "-"*20
  end

  def two(total)
    puts "-"*20
    total.times() do |row|
      sum = 0
      print "--"*(total - row) + "   "
      (row + 1).times() do |index|
        comb = row.choose(index)
        print "#{comb}" + " "*(4-comb.to_s.length)
        sum += comb
      end
      puts "--"*(total - row) + " Sum: #{sum}"
    end
  end

  def fact
    if (self == 0)
      return 1
    elsif (self > 0)
      return (self * (self - 1).fact())
    end
  end

  def choose(index) # 'self' is the row
    return self.fact() / (index.fact() * (self - index).fact())
  end
end
