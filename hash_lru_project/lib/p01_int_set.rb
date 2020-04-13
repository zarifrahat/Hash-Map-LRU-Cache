class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if (num > store.length || num < 0)
    store[num] = true
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    store[num] == true
  end

  private

  

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == store.length

    unless include?(num)
      self[num] << num
      @count += 1 #count doesnt work. Breaks insert. Why?
    end
  end

  def remove(num)
    while include?(num)
      self[num].delete(num)
      @count -= 1
    end

  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    store.length
  end

  def resize!
    stored = store.flatten.dup
    @store = Array.new(count * 2 ) { Array.new }
    @count = 0
    stored.each do |el|
      insert(el)
    end
  end
end

#Dont lose stuff in array
#.flatten store
