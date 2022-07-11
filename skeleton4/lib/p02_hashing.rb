class Integer
  # Integer#hash already implemented for you
end

class Array
  

  def hash
    new_str = 0
    self.each.with_index do |ele, idx|
      new_str += ele.hash * (idx + 1) 
    end
  return new_str
  end

end

class String
  def hash
    newnum = 0 
    self.each_char.with_index do |ele, idx|
      newnum += ele.ord * (idx + 1)
    end 
    newnum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    newnum = 0
    self.each do |k,v|
      newnum +=(k.hash + v.hash)
    end 
    newnum 
  end
end
