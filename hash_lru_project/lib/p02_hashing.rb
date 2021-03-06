class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
  end
end

class String
  def hash
    sum = 0
    self.each_char.with_index do |char, index|
      sum += char.ord * index
    end
    sum  
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
