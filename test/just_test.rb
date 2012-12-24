require 'test_helper'

describe Just do
  describe '#[]' do
    it 'returns a Nothing instance if the attr is nil' do
      Just.new({})[:foo].must_be_instance_of(Nothing)
    end

    it 'returns a Just instance if the attr is not nil' do
      Just.new({:foo => 'bar'})[:foo].must_be_instance_of(Just)
    end

    it 'chains Nothing instances if the attrs not nil' do
      Just.new({})[:foo].length.must_be_instance_of(Nothing)
    end

    it 'chains Just instances if the attrs are not nil' do
      Just.new({:foo => 'bar'})[:foo].length.must_be_instance_of(Just)
    end
  end

  describe '#get' do
    it 'return the value' do
      Just.new('foo').get.must_equal('foo')
    end

    it 'returns the value mapped' do
      Just.new('foo').get(&:length).must_equal(3)
    end
  end

  describe '#just?' do
    it 'returns true' do
      Just.new('foo').just?.must_equal(true)
    end
  end

  describe '#nothing?' do
    it 'returns false' do
      Just.new('foo').nothing?.must_equal(false)
    end
  end

  describe '#to_a' do
    it 'returns an array with the value' do
      Just.new('foo').to_a.must_equal(['foo'])
    end
  end

  describe '#==' do
    it 'returns true if comparing to a Just with the same value' do
      (Just.new(3) == Just.new(3)).must_equal(true)
    end

    it 'returns false otherwise' do
      (Just.new(3) == Just.new(4)).must_equal(false)
      (Just.new(3) == 4).must_equal(false)
      (Just.new(3) == Nothing.new).must_equal(false)
    end
  end
end
