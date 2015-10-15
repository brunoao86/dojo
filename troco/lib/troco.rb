# http://dojopuzzles.com/problemas/exibe/troco/

class Troco

  VALUES = [100.00, 50.00, 10.00, 5.00, 1.00, 0.50, 0.10, 0.05, 0.01]

  def initialize(price, cash)
    @price = price
    @cash = cash
  end

  def valid?
    @price.is_a?(Numeric) && @cash.is_a?(Numeric)
  end

  def get
    raise ArgumentError, 'It is not a number!' unless valid?
    raise ArgumentError, 'Negative values are not allowed!' if @price < 0 || @cash < 0
    raise ArgumentError, 'Not money enough to buy it!' if @price > @cash

    remainder_change = (@cash - @price).round(2)
    change = []
    VALUES.each do |value|
      count = (remainder_change / value).to_i
      next if count == 0
      change << [count, value]
      remainder_change = (remainder_change - (count * value)).round(2)
      break if remainder_change == 0
    end
    change
  end

end
