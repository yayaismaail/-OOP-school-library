class Solver
  def self.factorial(num)
    raise ArgumentError, 'Input must be a non-negative integer' unless num.is_a?(Integer) && num >= 0

    result = 1
    (1..num).each { |i| result *= i }
    result
  end

  def self.reverse(word)
    word.reverse
  end

  def self.fizzbuzz(num)
    raise ArgumentError, 'Input must be an integer' unless num.is_a?(Integer)

    result = ''
    result += 'fizz' if (num % 3).zero?
    result += 'buzz' if (num % 5).zero?
    result.empty? ? num.to_s : result
  end
end
