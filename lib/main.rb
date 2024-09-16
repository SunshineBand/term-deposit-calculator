USAGE = 'Usage: calculator <principal> <interest> <term_years> <frequency>'.freeze

COMPOUNDING = {
  'monthly': 12,
  'quarterly': 4,
  'annually': 1,
  'maturity': -1,
  'at_maturity': -1
}.freeze

# Holds information for Interest calculation
class Interest
  def initialize(principal, rate, term, frequency)
    @principal = principal.to_i
    @rate = rate.to_f
    @term = term.to_i
    @frequency = COMPOUNDING.key?(frequency.to_sym) ? COMPOUNDING[frequency.to_sym] : nil
  end

  def valid?
    return false if @principal <= 0 || @term <= 0 || @rate <= 0
    return false if @frequency.nil?

    true
  end

  def compound
    if @frequency == -1
      # Special case, at maturity has no compounding interest
      interest_earned = (@principal * (@rate / 100)) * @term
      return (@principal + interest_earned).round
    end

    formula(@principal, @rate / 100, @frequency, @term)
  end

  private

  def formula(principal, rate, frequency_per_year, years)
    (principal * ((1 + rate / frequency_per_year)**(frequency_per_year * years))).round
  end
end

def main(inputs = ARGV)
  return puts USAGE if inputs.empty? || inputs.size != 4

  calculator = Interest.new(inputs[0], inputs[1], inputs[2], inputs[3])
  return puts USAGE unless calculator.valid?

  puts calculator.compound
end
