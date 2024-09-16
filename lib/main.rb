USAGE = 'Usage: calculator <amount> <interest> <term_years> <frequency>'.freeze

def get_compounded_interest(principal, rate, frequency_per_year, years)
  (principal * ((1 + rate / frequency_per_year)**(frequency_per_year * years))).round
end

COMPOUNDING = {
  'monthly': 12,
  'quarterly': 4,
  'annually': 1,
  'maturity': -1
}.freeze

# Holds information for Interest calculation
class Interest
  def initialize(principal, rate, term, frequency)
    @principal = principal.to_i
    @rate = rate.to_f
    @term = term.to_i
    @frequency = COMPOUNDING.key? frequency ? COMPOUNDING[frequency] : nil
  end

  def valid?
    return false if @principal <= 0 || @term <= 0 || @rate <= 0
    return false if @rate >= 15
    return false if @frequency.nil?

    true
  end
end

def main(inputs = ARGV)
  # potential new feature
  return puts USAGE if inputs.empty?

  amount = inputs[0]
  interest = inputs[1]
  term_in_years = inputs[2]
  frequency = inputs[3]

  return puts USAGE unless Interest.new(amount, interest, term_in_years, frequency).valid?

  result = 'nope'

  case frequency
  when 'maturity', 'at_maturity'
    # maturity provides no compounded interest
    interest_earned = (amount.to_i * (interest.to_f / 100)) * term_in_years.to_i
    result = (amount.to_i + interest_earned).round
  else
    result = get_compounded_interest(amount.to_i, interest.to_f / 100, COMPOUNDING[frequency.to_sym], term_in_years.to_i)
  end

  puts result
end
