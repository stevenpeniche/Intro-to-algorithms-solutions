def binary_search(collection, value)
	low = 0
	high = collection.length - 1

	while low <= high
		mid = (low + high) / 2
		if collection[mid] > value
			high = mid - 1
		elsif collection[mid] < value
			low = mid + 1
		else
			return mid
		end
	end
  # If collection doesn't include value
	return -1
end

some_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
puts "index: #{binary_search(some_array, 3)}" # index: 2
puts "index: #{binary_search(some_array, 8)}" # index: 7
puts "index: #{binary_search(some_array, 10)}" # index: -1
