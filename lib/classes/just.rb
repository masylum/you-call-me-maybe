class Just < MaybeInterface

  def initialize(value)
    @value = value
  end

  # []
  #
  # @param [a] attr
  # @return [Just a]
  def method_missing(m, *args, &block)
    Maybe.new(@value.__send__(m, *args, &block))
  end

  # get
  #
  # @param [b] default - optional
  # @block [a -> b] - optional
  # @return [b]
  def get(default=nil)
    block_given? ? yield(@value) : @value
  end

  # just?
  #
  # @return [Boolean]
  def just?
    true
  end

  # nothing?
  #
  # @return [Boolean]
  def nothing?
    false
  end

  # to_a
  #
  # @return [Array a]
  def to_a
    [@value]
  end

  # ==
  #
  # @param [Maybe a]
  # @return [Boolean]
  def ==(a)
    return false unless a.instance_of?(Just)
    @value == a.get
  end
end
