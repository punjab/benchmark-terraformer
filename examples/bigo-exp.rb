require 'benchmark/bigo'

Benchmark.bigo do |x|
  x.generate :array
  x.increments = 7
  x.exponential

  x.report("#at")  {|array, size|
    array.at rand(size)
  }
  x.report("#index") {|array, size|
    array.index rand(size)
  }
  x.report("#index-miss") { |array, size|
    array.index (size + rand(size))
  }

  x.chart! 'array_exp.html'
  x.compare!
end

