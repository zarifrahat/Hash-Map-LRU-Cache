require_relative "p01_int_set.rb"

class HashSet < ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    super(key)
  end

  def include?(key)
    super(key)
  end

  def remove(key)
    super(key)
  end

  private

  def [](num)
    super(num.hash)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
