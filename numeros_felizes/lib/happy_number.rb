class HappyNumber

  def initialize(number)
    @number = number
  end

  def valid?
    integer?
  end

  def happy?
    return false unless valid?

    processed = Hash.new
    current   = split_and_sum_the_exponents(@number)

    while (current != 1 && !processed[current]) do
      processed[current] = true
      current            = split_and_sum_the_exponents(current)
    end
    current == 1
  end

  private
  def integer?
    @number.is_a?(Integer)
  end

  def split_and_sum_the_exponents(number)
    number.to_s.split("").inject(0) { |sum, n| sum = sum + n.to_i**2 }
  end

end
