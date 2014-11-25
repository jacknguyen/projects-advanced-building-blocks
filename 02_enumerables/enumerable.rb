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

  def my_count
    output = 0
    self.my_each do |x|
      output += 1
    end
    output
  end

  def my_map(a_proc)
    @output = Array.new
    self.my_each do |x|
      @output << a_proc.call(x)
    end
    if a_proc
      block_arr = Array.new
      @output.my_each do |x|
        block_arr << yield(x)
      end
      @output = block_arr
    end
    @output
  end

  def my_inject(ini=nil)
    output = ini if ini
    self.my_each do |x|
      if output
        output = yield(output, x)
      else
        output = x
      end
    end
    output
  end
end

def multiply_els arr
  output = 1
  arr.my_each do |x|
    output *= x
  end
  output
end
