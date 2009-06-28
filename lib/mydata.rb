#
# == Purpose
#
# Provide a data element suitable for storing in a collection.
#
# == Author
#
# Guy Allard
#
# == Copyright
#
# Copyright (c) 2009 Guy Allard
# Licensed under the same terms as Ruby.  No warranty is provided.
#
require 'logger'
#
class MyData
  include Comparable
  attr_reader :sdata, :ndata
	#
	# Initialize a new data object.
	#
  def initialize(sdata, ndata = 123)
    @sdata = sdata
    @ndata = ndata
    @@log = Logger.new(STDOUT)
    @@log.level = Logger::DEBUG
  end
  #
  # Convert to string.
  #
  def to_s
    "MyData: #@sdata--#@ndata"
  end
  #
  # Implement spaceship so Comparable methods are available.
  #
  def <=>(other)
    self.ndata <=> other.ndata
  end
end
