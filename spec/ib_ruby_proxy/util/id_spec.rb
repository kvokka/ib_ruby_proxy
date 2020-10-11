require 'spec_helper'

describe IbRubyProxy::Util::Id do
  include described_class

  describe '#call' do
    it 'returns some integer' do
      expect(call).to be_a Integer
    end

    it 'the next value is +1 from the previous one' do
      prev = call
      expect(call).to eq prev + 1
    end
  end
end
