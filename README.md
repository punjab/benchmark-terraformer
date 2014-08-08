benchmark-terraformer
=====================

Provides an example of how to use the [benchmark-bigo gem](http://github.com/davy/benchmark-bigo) to benchmark the convex hull algorithms within [Terraformer](http://github.com/esripdx/terraformer-ruby)

## How Do

```
bundle install
rake benchmark
```

Then view the raw data in data/results.json, and view the rendered charts in data/chart.html.

## How does it work?

The Rakefile contains all of the `benchmark-bigo` code that runs the test and generates the report. There is a `Benchmark::Terrafomer` module in `lib/` that provides some convenience methods for generating the objects used for benchmarking.
