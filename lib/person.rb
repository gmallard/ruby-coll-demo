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
module Colldemo
class Person
  include Comparable
  attr_reader :first, :mi, :last
  def initialize(first, middle, last)
    @first = first
    @mi = middle
    @last = last
  end
  #
  def <=>(other)
    compa = []
    compa << (@last <=> other.last)
    compa << (@first <=> other.first)
    compa << (@mi <=> other.mi)
    #
    compa.detect(0) {|i| i != 0}
  end
end # of Module CollDemo

