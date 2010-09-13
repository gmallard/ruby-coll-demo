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
# Copyright (c) 2009, 2010 Guy Allard
# Licensed under the same terms as Ruby.  No warranty is provided.
#
require 'logger'
#
module Colldemo
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
  def <=>(other)
    compa = []
    compa << (@last <=> other.last)
    compa << (@first <=> other.first)
    compa << (@mi <=> other.mi)
    #
    all_zero = lambda { 0 }
    compa.detect(all_zero) {|i| i != 0}
  end
end # of class Person
end # of Module CollDemo

