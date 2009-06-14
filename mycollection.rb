class MyCollection
  def initialize
    @data = Array.new
  end
  #
  def append(data)
    @data.push(data)
    self
  end
  #
  def delete_first
    @data.shift
  end
  #
  def delete_last
    @data.pop
  end
  #
  def [](index)
    @data[index]
  end
  #
  def size
    @data.size
  end
end

