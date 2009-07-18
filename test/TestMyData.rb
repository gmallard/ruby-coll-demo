#
# == Purpose
#
# Unit tests for MyData objects.
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
require 'test/unit'
require 'logger'
# To be tested or used
$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'mydata'
#
module Colldemo
class TestMyData < Test::Unit::TestCase
  #
  # Initialize this test class.
  #
  def initialize(name)
    super(name)
    @@log = Logger.new(STDOUT)
    @@log.level = Logger::DEBUG
    @mda = nil
    @mdb = nil
  end
  #
  # Setup for each test.  Define three new MyData objects.
  #
  def setup
    @mda = MyData.new("A",1)
    @mdb = MyData.new("B",2)
    @mdc = MyData.new("C",3)
  end
  #
  # Teardown after each test.  Currently does nothing.
  #
  def teardown
    #
  end
  #
  # Test the less than method.
  #
  def test_lt
    @@log.debug "test_lt starts" if @@log.debug?
    assert_respond_to(@mda, :<, "test_lt_respond")
    assert_equal(@mda < @mdb, true)
    @@log.debug "test_lt ends" if @@log.debug?
  end
  #
  # Test the greater than method.
  #
  def test_gt
    @@log.debug "test_gt starts" if @@log.debug?
    assert_respond_to(@mda, :>, "test_gt_respond")
    assert_equal(@mdb > @mda, true)
    @@log.debug "test_gt ends" if @@log.debug?
  end
  #
  # Test the equals method.
  #
  def test_eq
    @@log.debug "test_eq starts" if @@log.debug?
    assert_respond_to(@mda, :==, "test_eq_respond")
    assert_equal(@mda == @mdb, false)
    @@log.debug "test_eq ends" if @@log.debug?
  end
  #
  # Test the not equal method.
  #
  def test_ne
    @@log.debug "test_ne starts" if @@log.debug?
    assert_equal(@mda != @mdb, true)
    @@log.debug "test_ne ends" if @@log.debug?
  end
  #
  # Test the less than or equals method.
  #
  def test_le
    @@log.debug "test_le starts" if @@log.debug?
    assert_respond_to(@mda, :<=, "test_le_respond")
    assert_equal(@mda <= @mdb, true)
    assert_equal(@mda <= @mda, true)
    @@log.debug "test_le ends" if @@log.debug?
  end
  #
  # Test the greater than or equals method.
  #
  def test_ge
    @@log.debug "test_ge starts" if @@log.debug?
    assert_respond_to(@mda, :>=, "test_ge_respond")
    assert_equal(@mdb >= @mda, true)
    assert_equal(@mda >= @mda, true)
    @@log.debug "test_ge ends" if @@log.debug?
  end
  #
  # Test the between method.
  #
  def test_betweenq
    @@log.debug "test_betweenq starts" if @@log.debug?
    assert_respond_to(@mdb, :between?, "test_betweenq_respond")
    assert(@mdb.between?(@mda,@mdc),"test_betweenq_basic")
    @@log.debug "test_betweenq ends" if @@log.debug?
  end
endend # of Module Colldemo

