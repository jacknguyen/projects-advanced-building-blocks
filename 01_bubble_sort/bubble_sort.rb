def bubble_sort array
  @arr = array

  (@arr.length).downto(1) do |x|        # begins the check iteration because max number of iteration depends on size of array
    (0..(x-1)).each do |y|              # iterates though each position in the array
      if (@arr[y] <=> @arr[y+1]) == 1   # checks to see if value at current array position is smaller than its neighbor
        c = @arr[y]
        @arr[y], @arr[y+1] = @arr[y+1], c
      end
    end
  end

  @arr
end

def bubble_sort_by array
  @arr = array

  (@arr.length).downto(1) do |x|
    (0..(x-2)).each do |y|
      if (yield( @arr[y] , (@arr[y+1]) )) <= -1
        c = @arr[y]
        @arr[y] = @arr[y+1]
        @arr[y+1] = c
      end
    end
  end

  @arr
end
