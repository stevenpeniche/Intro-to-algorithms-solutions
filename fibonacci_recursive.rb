require 'benchmark'

def fib(n)
	if (n == 0)
		return 0
	elsif (n == 1)
		return 1
	else
		return fib(n-1) + fib(n-2)
	end
end

time = Benchmark.realtime do
	puts fib(20)
end

puts "Time elapsed #{time*1000} milliseconds"
