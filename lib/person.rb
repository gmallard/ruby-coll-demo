require 'logger'
module Colldemo
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
# Copyright (c) 2009, 2010, 2011 Guy Allard
# Licensed under the same terms as Ruby.  No warranty is provided.
#
class Person
  include Comparable
  attr_reader :first, :mi, :last, :ndata
  def initialize(first, middle, last, num)
    @first = first
    @mi = middle
    @last = last
    @ndata = num
  end
  #
  # Spaceship operator for completion of Comparable.
  #
  # Attempt to show a somewhat generalized spaceship operator in that:
  #
  # * Result depends on more than one field of the class
  # * Generalized method of returning that result
  #
  def <=>(other)
    compare_array = []
    # Lastname, Firstname, Middle
    compare_array << (@last <=> other.last) <<
      (@first <=> other.first) <<
      (@mi <=> other.mi)
    #
    # Return either:
    #
    # * zero
    # * the first compare that is non-zero
    #
    all_zero = lambda { 0 }
    compare_array.detect(all_zero) {|i| i != 0}
  end
end # of class Person
end # of Module CollDemo

