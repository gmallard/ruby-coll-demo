#
require 'logger'
#
class MyData
  include Comparable
  attr_reader :sdata, :ndata
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
  # Implement spaceship so Comparable works.
  #
  def <=>(other)
    self.ndata <=> other.ndata
  end
end
