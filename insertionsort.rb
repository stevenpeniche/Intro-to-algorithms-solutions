require 'benchmark'

def insertionsort(array)
  i = 1
  while i < array.length
    element = array[i]
    j = i - 1
    while j >= 0 && array[j] > element
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = element
    i += 1
  end
end

data = Array(1..50).shuffle
p "Before sort: #{data}"
time = Benchmark.realtime do
	insertionsort(data)
end
p "After sort: #{data}"
puts "Time elapsed #{time*1000} milliseconds"
