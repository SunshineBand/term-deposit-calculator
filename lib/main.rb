USAGE = 'Usage: calculator <amount> <interest> <term_years> <frequency>'.freeze

def main(inputs = ARGV)
  return puts USAGE if inputs.empty?

  amount = inputs[0]
  interest = inputs[1]
  term_in_years = inputs[2]
  frequency = inputs[3]

  result = 'nope'

  case frequency
  when 'maturity', 'at_maturity'
    interest_earned = (amount.to_i * (interest.to_f / 100)) * term_in_years.to_i
    result = (amount.to_i + interest_earned).round
  when 'annually'
    total = amount.to_f
    interest_earned = 0
    term_in_years.to_i.times do
      interest_earned = (total * (interest.to_f / 100))
      total += interest_earned
    end
    result = total.round
  end

  puts result
end
