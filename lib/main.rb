USAGE = 'Usage: calculator <amount> <interest> <term_years> <frequency>'.freeze

def main(inputs = ARGV)
  puts USAGE if inputs.empty?
end
