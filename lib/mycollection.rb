#
# == Purpose
#
# Provide an example collection which is suitable for
# mixing in Enumerable.
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
module Colldemo
class MyCollection
  include Enumerable
  #
  # Initialize the collection.
  #
  def initialize
    @data = Array.new
  end
  #
  # Append an object to the end of the collection.
  #
  def append(data)
    @data.push(data)
    self
  end
  #
  # Remove and return the first object in the collection.
  #
  def delete_first
    @data.shift
  end
  #
  # Remove and return the last object in the collection.
  #
  def delete_last
    @data.pop
  end
  #
  # Remove and return the object at the specified index in the collection.
  #
  def [](index)
    @data[index]
  end
  #
  # Return the size of the collection.
  #
  def size
    @data.size
  end
  #
  # Iterate through the items in the collection and yeid each item in turn
  # to the supplied block (if any).
  #
  def each
    @data.each do |elt|
      yield elt if block_given?
    end
  end
end
end # of Module Colldemo

