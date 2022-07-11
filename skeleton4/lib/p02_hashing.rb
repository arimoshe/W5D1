class Integer
  # Integer#hash already implemented for you
end

class Array
  

  def hash
    new_str = 0
    self.each do |ele|
      new_str += ele.hash
    end
  return new_str
  end

end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
