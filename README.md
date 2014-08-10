benchmark-terraformer
=====================

Provides an example of how to use the [benchmark-bigo gem](http://github.com/davy/benchmark-bigo) to benchmark the convex hull algorithms within [Terraformer](http://github.com/esripdx/terraformer-ruby)

## How Do

```
bundle install

rake benchmark_random_walk  # benchmarks random walk line string
rake benchmark_circle       # benchmarks circle

rake benchmark              # benchmarks both objects, increasing linearly
rake benchmark_exp          # benchmarks both objects, increasing exponentially
```

Then view the raw JSON data and rendered charts in `data/`.

I've placed examples of my results in `examples/data/`.

## How does it work?

The Rakefile contains all of the `benchmark-bigo` code that runs the test and generates the report. There is a `Benchmark::Terrafomer` module in `lib/` that provides some convenience methods for generating the objects used for benchmarking.

## Viewer

In order to view generated random walks and circles for testing, a simple map viewer has been created.

First run a simple HTTP Server out of the `examples/` directory:

```
cd examples
ruby -run -e httpd . -p 5000
```

Then navigate to `http://localhost:5000/viewer.html`

The viewer is built on top of [Leaflet](http://leafletjs.com/) and uses [Esri Leaflet](http://esri.github.io/esri-leaflet/) for the Esri Gray basemap and [Leaflet AJAX](https://github.com/calvinmetcalf/leaflet-ajax).

The viewer currently can show either the `example/geojson/circle.geojson` file or the `example/geojson/random_walk.geojson` and the accompanying `example/geojson/random_walk_hull.geojson` file.
