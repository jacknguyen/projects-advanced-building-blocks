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
end
