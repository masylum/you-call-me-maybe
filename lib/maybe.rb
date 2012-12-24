require 'classes/maybe_interface'
require 'classes/just'
require 'classes/nothing'

class Maybe

  class << self

    # creates a new Just or Nothing value
    #
    # @param [a] value
    # @return [Just a | Nothing]
    def new(value)
      is_empty = value.respond_to?(:empty?) && value.empty?
      (value.nil? || is_empty) ? Nothing.new : Just.new(value)
    end

    # creates a Maybe value from an array
    #
    # @param [Array a] - list
    # @return [Maybe a]
    def from_a(list)
      new(list.first)
    end

    # extracts the maybe values from an array
    #
    # @param [Array (Maybe a)]
    # @return [Array a]
    def extract(list_of_maybes)
      list_of_maybes.flat_map(&:to_a)
    end

    # map_maybe
    #
    # @param [Array a]
    # @block [a -> Maybe b]
    # @return [Array b]
    def map_maybe(list, &block)
      extract(list.map(&block))
    end
  end
end
