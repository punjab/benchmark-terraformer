require 'benchmark/ips'
size = 10000
array = (0...size).to_a.shuffle

Benchmark.ips do |x|
  x.report("#at") {
    array.at rand(size)
  }
  x.report("#index") {
    array.index rand(size)
  }
  x.report("#index miss") {
    array.index (size + rand(size))
  }
  x.compare!
end
