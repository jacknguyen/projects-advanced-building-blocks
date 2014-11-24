module Enumerable
  def my_each
    i = 0
    while i < self.size
      yield( self[i] )
      i+=1
    end
    self
  end

  def my_each_with_index
    i = 0

    while i < self.size
      yield(self[i], i)
      i+=1
    end
    self
  end

  def my_select
    output = Array.new
    self.my_each do |x|
      if yield(x)
        output << x
      end
    end
    output
  end

  def my_all?
    output = true
    self.my_each do |x|
      if !yield(x)
        output = false
      end
    end
    output
  end

  def my_any?
    output = false
    self.my_each do |x|
      if yield(x)
        output = true
      end
    end
    output
  end

  def my_none?
    output = true
    self.my_each do |x|
      if yield(x)
        output = false
      end
    end
    output
  end
end
