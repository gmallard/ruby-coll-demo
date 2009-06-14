#
class MyData
  attr_reader :sdata, :ndata
  def initialize(sdata, ndata = 123)
    @sdata = sdata
    @ndata = ndata
  end
  #
  def to_s
    "MyData: #@sdata--#@ndata"
  end
end
