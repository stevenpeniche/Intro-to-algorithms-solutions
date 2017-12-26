require 'benchmark'

def swap(array, from, to)
  temp = array[from]
  array[from] = array[to]
  array[to] = temp
end

def partition(array, left_index, right_index)
  pivot = array[((right_index + left_index) / 2).floor]

  while left_index <= right_index
    while array[left_index] < pivot # Stop when element on left is greater than pivot
      left_index += 1
    end

    while array[right_index] > pivot # Stop when element on right is less than pivot
      right_index -= 1
    end

    if left_index <= right_index
      swap(array, left_index, right_index)
      left_index += 1
      right_index -= 1
    end
  end

  return left_index
end

def quicksort(array, left_index = 0, right_index = array.length - 1)
  if array.length > 1
    pivot_index = partition(array, left_index, right_index)

    if left_index < pivot_index - 1 # left sub array still needs to be sorted
      quicksort(array, left_index, pivot_index - 1)
    end

    if pivot_index < right_index # right sub array still needs to be sorted
      quicksort(array, pivot_index, right_index)
    end
  end
end

data = Array(1..50).shuffle
p "Before sort: #{data}"
time = Benchmark.realtime do
	quicksort(data)
end
p "After sort: #{data}"
puts "Time elapsed #{time*1000} milliseconds"
