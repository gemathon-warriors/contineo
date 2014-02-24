module Contineo
  # Returns the version of the currently loaded Contineo as a Gem::Version
  def self.version
    Gem::Version.new "0.1.0"
  end

  module VERSION #:nodoc:
    MAJOR, MINOR, TINY = Contineo.version.segments
    STRING = Contineo.version.to_s
  end
end
