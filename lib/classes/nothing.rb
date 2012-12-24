class Nothing < MaybeInterface

  def initialize(); end

  # []
  #
  # @param [a] attr
  # @return [Nothing]
  def method_missing(m, *args, &block)
    Nothing.new
  end

  # get
  #
  # @param [b] default - optional
  # @block [a -> b] - optional
  # @return [b]
  def get(default=nil)
    default
  end

  # just?
  #
  # @return [Boolean]
  def just?
    false
  end

  # nothing?
  #
  # @return [Boolean]
  def nothing?
    true
  end

  # to_a
  #
  # @return [Array a]
  def to_a
    []
  end

  # ==
  #
  # @param [Maybe a]
  # @return [Boolean]
  def ==(maybe)
    maybe.instance_of?(Nothing)
  end
end
