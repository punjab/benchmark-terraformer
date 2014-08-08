benchmark-terraformer
=====================

Provides an example of how to use the [benchmark-bigo gem](http://github.com/davy/benchmark-bigo) to benchmark the convex hull algorithms within [Terraformer](http://github.com/esripdx/terraformer-ruby)

## How Do

```
bundle install
rake benchmark     # generates benchmark chart for objects increasing linearly
rake benchmark_exp # generates benchmark chart for objects increasing exponentially
```

Then view the raw JSON data and rendered charts in `data/`.

I've placed examples of my results in `examples/data/`.

## How does it work?

The Rakefile contains all of the `benchmark-bigo` code that runs the test and generates the report. There is a `Benchmark::Terrafomer` module in `lib/` that provides some convenience methods for generating the objects used for benchmarking.
