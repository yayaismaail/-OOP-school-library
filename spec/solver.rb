class Solver
  def self.factorial(n)
    raise ArgumentError, 'Input must be a non-negative integer' unless n.is_a?(Integer) && n >= 0

    result = 1
    (1..n).each { |i| result *= i }
    result
  end

  def self.reverse(word)
    word.reverse
  end

  def self.fizzbuzz(n)
    raise ArgumentError, 'Input must be an integer' unless n.is_a?(Integer)

    result = ''
    result += 'fizz' if (n % 3).zero?
    result += 'buzz' if (n % 5).zero?
    result.empty? ? n.to_s : result
  end
end
