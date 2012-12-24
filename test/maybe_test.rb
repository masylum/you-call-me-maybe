require 'test_helper'

describe Maybe do
  describe '#new' do
    it 'returns a Nothing instance if nil' do
      Maybe.new(nil).must_be_instance_of(Nothing)
    end

    it 'returns a Nothing instance if empty' do
      Maybe.new([]).must_be_instance_of(Nothing)
      Maybe.new('').must_be_instance_of(Nothing)
    end

    it 'returns a Just instance if not nil' do
      Maybe.new(:foo).must_be_instance_of(Just)
      Maybe.new(false).must_be_instance_of(Just)
    end
  end

  describe '#from_a' do
    it 'returns a Nothing instance if []' do
      Maybe.from_a([]).must_be_instance_of(Nothing)
      Maybe.from_a([nil]).must_be_instance_of(Nothing)
    end

    it 'returns a Just instance if not []' do
      Maybe.from_a([1]).must_be_instance_of(Just)
    end
  end

  describe '#extract' do
    it 'extracts the maybe values from an array' do
      a = Maybe.new(1)
      b = Maybe.new(nil)
      Maybe.extract([a, b]).must_equal([1])
    end
  end

  describe '#map_maybe' do
    it 'extracts the maybe values from an array' do
      ls = ['foo', nil, 'zemba']

      Maybe.map_maybe(ls) do |el|
        Maybe.new(el).length
      end.must_equal([3, 5])
    end
  end
end
