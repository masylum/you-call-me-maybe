require 'test_helper'

describe Just do
  describe '#[]' do
    it 'returns a Nothing instance' do
      Nothing.new[:foo].must_be_instance_of(Nothing)
    end
  end

  describe '#get' do
    it 'return nil' do
      Nothing.new.get.must_equal(nil)
      Nothing.new.get(&:length).must_equal(nil)
    end

    it 'returns the default value mapped if any' do
      Nothing.new.get(3, &:length).must_equal(3)
    end
  end

  describe '#just?' do
    it 'returns false' do
      Nothing.new.just?.must_equal(false)
    end
  end

  describe '#nothing?' do
    it 'returns true' do
      Nothing.new.nothing?.must_equal(true)
    end
  end

  describe '#to_a' do
    it 'returns an empty array' do
      Nothing.new.to_a.must_equal([])
    end
  end

  describe '#==' do
    it 'returns true if comparing to a nothing' do
      (Nothing.new == Nothing.new).must_equal(true)
    end

    it 'returns false otherwise' do
      (Nothing.new == 3).must_equal(false)
      (Nothing.new == Just.new(3)).must_equal(false)
    end
  end
end

