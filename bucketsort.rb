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

def bucketsort(array, bucket_size = 5)
  if array.empty?
    return array
  end

  max_value = array.max
  min_value = array.min

  # Initialize buckets
  bucket_count = ((max_value - min_value) / bucket_size).floor + 1
  buckets = Array.new(bucket_count)
  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end

  # Distribute array elements into buckets
  (0..array.length - 1).each do |i|
    buckets[((array[i] - min_value) / bucket_size).floor].push(array[i])
  end

  # Sort buckets and place into original array
  array.clear
  (0..buckets.length - 1).each do |i|
    insertionsort(buckets[i])
    buckets[i].each do |element|
      array.push(element)
    end
  end
  array
end

data = Array(1..50).shuffle
p "Before sort: #{data}"
time = Benchmark.realtime do
	bucketsort(data)
end
p "After sort: #{data}"
puts "Time elapsed #{time*1000} milliseconds"
