require 'benchmark'

def mergesort(collection)
	if collection.length <= 1
		collection
	else
		mid = (collection.length / 2).floor
		left = mergesort(collection[0..mid - 1])
		right = mergesort(collection[mid..collection.length])
		merge(left, right)
	end
end

def merge(left, right)
	if left.empty?
		right
	elsif right.empty?
		left
	elsif left.first < right.first
		[left.first] + merge(left[1..left.length], right)
	else
		[right.first] + merge(left, right[1..right.length])
	end
end

data = Array(1..50).shuffle
p "Before sort: #{data}"
time = Benchmark.realtime do
	mergesort(data)
end
p "After sort: #{data}"
puts "Time elapsed #{time*1000} milliseconds"
