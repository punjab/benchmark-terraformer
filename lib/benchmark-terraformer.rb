require 'terraformer'

module Terraformer::Benchmark
  # portland
  LON = -122.6764
  LAT = 45.5165

  # calculate convex hull with given implementation
  def self.convex_hull obj, impl
    Terraformer::ConvexHull.impl = impl
    obj.convex_hull
  end
end

class Float
  def perm
    self + rand(-100..100) / 10000.0
  end
end

module Terraformer::Benchmark
  # generates a Line String representing a random walk
  def self.random_walk size

    walk = [[LON, LAT]] # start in pdx

    size.times do
      walk << walk.last.map{|i| i.perm }
    end

    # create line string from the random walk
    ls = Terraformer::LineString.new(walk)

    # convert to feature
    ls.to_feature
  end
end

module Terraformer::Benchmark

  # generates a circle feature with size points
  def self.circle size
    # minimum size is three
    size = 3 if size < 3

    # expand the diameter as size increases
    diameter = [100, size].max

    # generate circle feature
    c = Terraformer::Circle.new([LON, LAT], diameter, size)

    # convert to feature
    c.to_feature
  end
end


# needed for geojson_io method
# useful for quickly visualizing
# a feature
require 'uri'
require 'launchy'
