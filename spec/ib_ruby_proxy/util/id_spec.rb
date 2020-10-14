require 'spec_helper'

describe IbRubyProxy::Util::Id do
  include described_class

  describe '#call' do
    it 'returns Concurrent::AtomicFixnum' do
      expect(call).to be_a Concurrent::AtomicFixnum
    end

    it 'the next value is +1 from the previous one' do
      prev = call.value

      expect(call).to eq prev + 1
    end
  end
end
