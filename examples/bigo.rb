require 'benchmark/bigo'

Benchmark.bigo do |x|
  x.generate :array
  x.increments = 10
  x.linear 2000 # default

  x.report("#at")  {|array, size|
    array.at rand(size)
  }
  x.report("#index") {|array, size|
    array.index rand(size)
  }
  x.report("#index-miss") { |array, size|
    array.index (size + rand(size))
  }

  x.chart! 'data/array_linear.html'
  x.compare!
end

