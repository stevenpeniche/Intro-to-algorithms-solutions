require 'benchmark'

def bubblesort(collection)
	n = collection.length
	begin
		swapped = false

		(n - 1).times do |i|
			if collection[i] > collection[i + 1]
				tmp = collection[i]
				collection[i] = collection[i + 1]
				collection[i + 1] = tmp
				swapped = true
			end
		end
	end until not swapped

	collection
end

data = Array(1..50).shuffle
p "Before sort: #{data}"
time = Benchmark.realtime do
	bubblesort(data)
end
p "After sort: #{data}"
puts "Time elapsed #{time*1000} milliseconds"
