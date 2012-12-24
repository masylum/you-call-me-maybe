class MaybeInterface
  def initialize(value); raise NotImplementedError; end
  def get(default=nil); raise NotImplementedError; end
  def just?; raise NotImplementedError; end
  def nothing?; raise NotImplementedError; end
  def to_a; raise NotImplementedError; end
  def ==; raise NotImplementedError; end
end
