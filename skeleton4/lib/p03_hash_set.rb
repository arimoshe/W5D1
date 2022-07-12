class HashSet

  attr_accessor :store, :count 

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self.count += 1
    self[key] << key
    resize! if self.count == num_buckets 
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)  
      self[key].delete(key)
      self.count -= 1
      true
    else 
      false
    end
  end

  def [](num)
    
    self.store[num.hash % num_buckets]
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
