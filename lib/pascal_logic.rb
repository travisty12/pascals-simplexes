class Fixnum
  def build_tri
    puts "-"*20
    print "How many layers deep? "
    number = gets.chomp.to_s.to_i
    if self == 6
      self.six(number)
    elsif self == 5
      self.five(number)
    elsif self == 4
      self.four(number)
    elsif self == 3
      self.three(number)
    elsif self == 2
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

  def three(total)
    total.times() do |layer|
      sum = 0
      puts "-"*20
      puts "*"*5 + " Layer #{layer + 1} " + "*"*5
      puts "-"*20
      (layer + 1).times() do |row|
        print "--"*(layer - row) + "   "
        (row + 1).times() do |index|
          comb = layer.tri_choose(index, row)
          print "#{comb}" + " "*(4-comb.to_s.length)
          sum += comb
        end
        puts "--"*(layer - row)
      end
      puts "-"*5 + " Sum: #{sum} " + "-"*5
    end
  end

  def four(total)
    total.times() do |cell|
      sum = 0
      puts "-"*20
      puts "*"*5 + " Cell #{cell + 1} " + "*"*5
      (cell + 1).times() do |layer|
        puts "-"*20
        puts "-"*5 + " Layer #{layer + 1} " + "-"*5
        puts "-"*20
        (layer + 1).times() do |row|
          print "--"*(layer - row) + "   "
          (row + 1).times() do |index|
            comb = cell.quad_choose(index, row, layer)
            print "#{comb}" + " "*(4-comb.to_s.length)
            sum += comb
          end
          puts "--"*(layer - row)
        end
      end
      puts "-"*5 + " Sum: #{sum} " + "-"*5
    end
  end

  def five(total)
    total.times() do |pentachoron|
      sum = 0
      puts "-"*20
      puts "*"*5 + " Pentatope #{pentachoron + 1} " + "*"*5
      (pentachoron + 1).times() do |cell|
        puts "-"*20
        puts "*"*5 + " Cell #{cell + 1} " + "*"*5
        (cell + 1).times() do |layer|
          puts "-"*20
          puts "-"*5 + " Layer #{layer + 1} " + "-"*5
          puts "-"*20
          (layer + 1).times() do |row|
            print "--"*(layer - row) + "   "
            (row + 1).times() do |index|
              comb = pentachoron.quint_choose(index, row, layer, cell)
              print "#{comb}" + " "*(4-comb.to_s.length)
              sum += comb
            end
            puts "--"*(layer - row)
          end
        end
      end
      puts "-"*5 + " Sum: #{sum} " + "-"*5
    end
  end

  def six(total)
    total.times() do |hexateron|
      sum = 0
      puts "-"*20
      puts "*"*5 + " Hexateron #{hexateron + 1} " + "*"*5
      (hexateron + 1).times() do |pentachoron|
        puts "-"*20
        puts "*"*5 + " Pentatope #{pentachoron + 1} " + "*"*5
        (pentachoron + 1).times() do |cell|
          puts "-"*20
          puts "*"*5 + " Cell #{cell + 1} " + "*"*5
          (cell + 1).times() do |layer|
            puts "-"*20
            puts "-"*5 + " Layer #{layer + 1} " + "-"*5
            puts "-"*20
            (layer + 1).times() do |row|
              print "--"*(layer - row) + "   "
              (row + 1).times() do |index|
                comb = hexateron.sex_choose(index, row, layer, cell, pentachoron)
                print "#{comb}" + " "*(4-comb.to_s.length)
                sum += comb
              end
              puts "--"*(layer - row)
            end
          end
        end
      end
      puts "-"*5 + " Sum: #{sum} " + "-"*5
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

  def tri_choose(index, row) # 'self' is the layer
    return self.fact() / ((row - index).fact() * index.fact() * (self - row).fact())
  end

  def quad_choose(index, row, layer) # 'self' is the cell
    return self.fact() / ((self - layer).fact() * (layer - row).fact() * (row - index).fact() * index.fact())
  end

  def quint_choose(index, row, layer, cell) # 'self' is the pentachoron
    return self.fact() / ((self - cell).fact() * (cell - layer).fact() * (layer - row).fact() * (row - index).fact() * index.fact())
  end

  def sex_choose(index, row, layer, cell, pentachoron) # 'self' is the hexateron
    return self.fact() / ((self - pentachoron).fact() * (pentachoron - cell).fact() * (cell - layer).fact() * (layer - row).fact() * (row - index).fact() * index.fact())
  end
end
