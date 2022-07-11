require "byebug" 
class MaxIntSet
  
  attr_accessor :store

  def initialize(max)
    @store = Array.new(max+1){false}
  end

  def insert(num)
     if num < @store.length  && num >= 0
     self.store[num] = true
     else 
      raise "Out of bounds"
     end 
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    self.store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def [](num)
    self.store[num % self.store.length]
  end
 

  def insert(num)
    
    self[num] << num
  end

  def remove(num)
    self.store[num % self.store.length].delete(num)
  end

  def include?(num)
    self.store[num % self.store.length].include?(num)
  end

  private

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  # end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def [](num)
    self.store[num % self.store.length]
  end

  def insert(num)
    unless self.include?(num)
      self[num] << num 
      @count += 1 
    end 
   resize! if count == self.store.length 
    
  end

  def remove(num)
    if self.include?(num)
    self.store[num % self.store.length].delete(num)
    @count -= 1
    end
  end

  def include?(num)
     self.store[num % self.store.length].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    newarr = []
    self.store.each do |ele|
        ele.each do |i|
          newarr << i 
          self.remove(i)
        end 
      end 
    self.store += Array.new(self.store.length) { Array.new }
      newarr.each do |ele|
          self.insert(ele)
      end 
  end


end
