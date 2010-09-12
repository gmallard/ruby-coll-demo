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
class PersonCollection
  include Enumerable
  #
  # Initialize the collection.
  #
  def initialize
    @data = Array.new
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

