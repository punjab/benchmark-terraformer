# -*- ruby -*-

require 'benchmark/bigo'
require 'terraformer'

require './lib/benchmark-terraformer'

# generates a line string via a random walk
random_generator = Proc.new {|size|
  Terraformer::Benchmark.random_walk size
}

task :benchmark_random_walk do
  report = Benchmark.bigo do |x|

    x.generator &random_generator

    # sample each point for 20 seconds
    x.time = 20

    x.linear 200
    x.increments = 5 # 200..1000

    x.report("#rand-jarvis") {|f, _| Terraformer::Benchmark.convex_hull f, :jarvis_march }
    x.report("#rand-monotone") {|f, _| Terraformer::Benchmark.convex_hull f, :monotone}

    x.data! 'data/results_random_walk.json'
    x.chart! 'data/chart_random_walk.html'
    x.compare!

  end
end

# generates a circle with size points
circle_generator = Proc.new {|size|
  Terraformer::Benchmark.circle size
}

task :benchmark_circle do
  report = Benchmark.bigo do |x|

    x.generator &circle_generator

    # sample each point for 20 seconds
    x.time = 20

    x.linear 200
    x.increments = 5 # 200..1000

    x.report("#rand-jarvis") {|f, _| Terraformer::Benchmark.convex_hull f, :jarvis_march }
    x.report("#rand-monotone") {|f, _| Terraformer::Benchmark.convex_hull f, :monotone}

    x.data! 'data/results_circle.json'
    x.chart! 'data/chart_circle.html'
    x.compare!

  end
end

@generator_name = :random_walk

dynamic_generator = Proc.new {|size|
  Terraformer::Benchmark.send(@generator_name, size)
}

task :benchmark do

  report = Benchmark.bigo do |x|

    x.generator &dynamic_generator

    # sample each point for 20 seconds
    x.time = 20

    x.linear 200
    x.increments = 5 # 200..1000

    @generator_name = :random_walk

    x.report("#rand-jarvis") {|ls, size| Terraformer::Benchmark.convex_hull ls, :jarvis_march }
    x.report("#rand-monotone") {|ls, size| Terraformer::Benchmark.convex_hull ls, :monotone}

    @generator_name = :circle

    x.report("#circ-jarvis") {|ls, size| Terraformer::Benchmark.convex_hull ls, :jarvis_march }
    x.report("#circ-monotone") {|ls, size| Terraformer::Benchmark.convex_hull ls, :monotone}

    x.data! 'data/results.json'
    x.chart! 'data/chart.html'
    x.compare!

  end
end

task :benchmark_exp do

  report = Benchmark.bigo do |x|

    x.generator &dynamic_generator

    # sample each point for 20 seconds
    x.time = 20

    x.exponential 10
    x.increments = 4 # 1..1000

    @generator_name = :random_walk

    x.report("#rand-jarvis") {|ls, size| Terraformer::Benchmark.convex_hull ls, :jarvis_march }
    x.report("#rand-monotone") {|ls, size| Terraformer::Benchmark.convex_hull ls, :monotone}

    @generator_name = :circle

    x.report("#circ-jarvis") {|ls, size| Terraformer::Benchmark.convex_hull ls, :jarvis_march }
    x.report("#circ-monotone") {|ls, size| Terraformer::Benchmark.convex_hull ls, :monotone}

    x.data! 'data/results-exp.json'
    x.chart! 'data/chart-exp.html'
    x.compare!

  end
end
