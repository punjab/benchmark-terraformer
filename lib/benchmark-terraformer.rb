module Benchmark
  module Terraformer

    # portland
    LON = -122.6764
    LAT = 45.5165

    # setting the Terraformer ConvexHull implementation
    # is kind of a pain. this does it for you
    def self.convex_hull obj, impl
      ::Terraformer::ConvexHull.impl = impl
      obj.convex_hull
    end

    # generates a polygon representing waldo canyon with approximately
    # size number of points representing the polygon
    def self.generate_waldo size
      # load up waldo
      wc = ::Terraformer.parse 'examples/waldocanyon.geojson'

      # grab the line string of the outer polygon ring
      ls = wc.geometry.polygons[0].line_strings[0]

      # new array to hold new outer ring
      scs = []

      m = (ls.coordinates.length)/size

      # don't divide by zero
      return ::Terraformer::Polygon.new(ls.coordinates).to_feature if m == 0

      # only put every 5th coordinate in the new array
      ls.coordinates.length.times {|n| scs << ls.coordinates[n] if n%m == 0}

      # make a new polygon with the new ring, closing it along the way
      sp = ::Terraformer::Polygon.new(scs + [scs[0]])

      # convert to feature
      sp.to_feature
    end

    # generates a Line String feature representing a
    # random walk
    def self.random_walk size

      lat = LAT
      lon = LON

      walk = [[LAT, LON]]

      size.times do
        lat += ( rand / 100.0 * [-1,1].sample )
        lon += ( rand / 100.0 * [-1,1].sample )

        walk << [lat,lon]
      end

      # create line string from the random walk
      ls = ::Terraformer::LineString.new(walk)

      # convert to feature
      ls.to_feature
    end


    # generates a circle feature with size points
    def self.circle size
      # minimum size is three
      size = 3 if size < 3

      # expand the diameter as size increases
      diameter = [100, size].max

      # generate circle feature
      ::Terraformer::Circle.new([-122.6764, 45.5165], diameter, size).to_feature
    end
  end
end
