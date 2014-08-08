# -*- ruby -*-

require 'benchmark/bigo'
require 'terraformer'

require './lib/benchmark-terraformer'

task :benchmark do

  report = Benchmark.bigo do |x|

    @generator_name = :random_walk

    # generates a line string via a random walk
    random_generator = Proc.new {|size|
      Benchmark::Terraformer.random_walk size
    }

    # generates a circle with size points
    circle_generator = Proc.new {|size|
      Benchmark::Terraformer.circle size
    }

    dynamic_generator = Proc.new {|size|
      Benchmark::Terraformer.send(@generator_name, size)
    }

    x.generator &dynamic_generator
    #x.generator &circle_generator

    # sample each point for 20 seconds
    x.time = 20

    x.linear 200
    x.increments = 4 # 200..800

    # can switch to exponential
    #x.exponential 10
    #x.increments = 4 # 1..1000

    @generator_name = :random_walk

    x.report("#rand-jarvis") {|ls, size| Benchmark::Terraformer.convex_hull ls, :jarvis_march }
    x.report("#rand-monotone") {|ls, size| Benchmark::Terraformer.convex_hull ls, :monotone}

    @generator_name = :circle

    x.report("#circ-jarvis") {|ls, size| Benchmark::Terraformer.convex_hull ls, :jarvis_march }
    x.report("#circ-monotone") {|ls, size| Benchmark::Terraformer.convex_hull ls, :monotone}

    x.data! 'data/results.json'
    x.chart! 'data/chart.html'
    x.compare!

  end
end
