def binary_search(collection, value, low = 0, high = collection.length - 1)
	return -1 if low > high

	mid = (low + high) / 2

	if collection[mid] == value
		return mid
	elsif collection[mid] > value
		high = mid - 1
	else
		low = mid + 1
	end

	binary_search(collection, value, low, high)
end

some_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
puts "index: #{binary_search(some_array, 3)}" # index: 2
puts "index: #{binary_search(some_array, 8)}" # index: 7
puts "index: #{binary_search(some_array, 10)}" # index: -1
