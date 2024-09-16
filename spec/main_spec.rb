require 'main'

describe 'main function' do
  it 'should print help instructions' do
    expect do
      main []
    end.to output(a_string_including(USAGE)).to_stdout
  end

  context 'when payment frequency is at_maturity' do
    it 'should pay interest only after the term length has completed' do
      input = ['10000', '1.10', '3', 'at_maturity']
      expected = '10330'
      expect do
        main input
      end.to output(a_string_including(expected)).to_stdout
    end
  end

  context 'when payment frequency is annually' do
    it 'should compound interest over the years of payment' do
      input = ['10000', '1.10', '3', 'annually']
      expected = '10334'

      expect do
        main input
      end.to output(a_string_including(expected)).to_stdout
    end
  end

  context 'when payment frequency is quarterly' do
    it 'should compound interest 4 times in the year' do
      input = ['10000', '1.10', '3', 'quarterly']
      expected = '10335'

      expect do
        main input
      end.to output(a_string_including(expected)).to_stdout
    end
  end

  context 'when payment frequency is monthly' do
    it 'should compound every month' do
      input = ['10000', '1.10', '3', 'monthly']
      expected = '10335'

      expect do
        main input
      end.to output(a_string_including(expected)).to_stdout
    end
  end
end
