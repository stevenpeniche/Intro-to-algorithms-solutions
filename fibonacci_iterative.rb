require 'benchmark'

def fib(n)
	fib_0 = 0
	fib_1 = 1

	(n - 1).times do
		temp = fib_0
		fib_0 = fib_1
		fib_1 = temp + fib_1
	end

	fib_1
end

time = Benchmark.realtime do
	puts fib(20)
end

puts "Time elapsed #{time*1000} milliseconds"
