require 'main'

describe 'main function' do
  it 'should print help instructions' do
    expect do
      main []
    end.to output(a_string_including(USAGE)).to_stdout
  end
end
