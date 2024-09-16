USAGE = 'Usage: calculator <amount> <interest> <term_years> <frequency>'.freeze

def get_compounded_interest(principal, rate, frequency_per_year, years)
  principal * ((1 + rate / frequency_per_year)**(frequency_per_year * years))
end

def main(inputs = ARGV)
  return puts USAGE if inputs.empty?

  amount = inputs[0]
  interest = inputs[1]
  term_in_years = inputs[2]
  frequency = inputs[3]

  result = 'nope'

  case frequency
  when 'maturity', 'at_maturity'
    # maturity provides no compounded interest
    interest_earned = (amount.to_i * (interest.to_f / 100)) * term_in_years.to_i
    result = (amount.to_i + interest_earned).round
  when 'annually'
    result = get_compounded_interest(amount.to_i, interest.to_f / 100, 1, 3).round
  end

  puts result
end
