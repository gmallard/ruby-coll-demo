#
# == Purpose
#
# Unit tests for Person objects.
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
require 'test/unit'
require 'logger'
# To be tested or used
$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'person'
#
module Colldemo
class TestPerson < Test::Unit::TestCase
  #
  # Initialize this test class.
  #
  def initialize(name)
    super(name)
    @@log = Logger.new(STDOUT)
    @@log.level = Logger::DEBUG
    @abs = nil
    @jas = nil
  end
  #
  # Setup for each test.  Define three new Person objects.
  #
  def setup
    # Allen B Sheppard
    @abs = Person.new("Allen","B", "Sheppard", 3)
    # John A Smith
    @jas = Person.new("John","A", "Smith", 2)
    # John B Smith
    @jbs = Person.new("John","B", "Smith", 1)
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
    assert_respond_to(@abs, :<, "test_lt_respond")
    assert_equal(@abs < @jas, true)
    @@log.debug "test_lt ends" if @@log.debug?
  end
  #
  # Test the greater than method.
  #
  def test_gt
    @@log.debug "test_gt starts" if @@log.debug?
    assert_respond_to(@abs, :>, "test_gt_respond")
    assert_equal(@jas > @abs, true)
    @@log.debug "test_gt ends" if @@log.debug?
  end
  #
  # Test the equals method.
  #
  def test_eq
    @@log.debug "test_eq starts" if @@log.debug?
    assert_respond_to(@abs, :==, "test_eq_respond")
    assert_equal(@abs == @jas, false)
    @@log.debug "test_eq ends" if @@log.debug?
  end
  #
  # Test the not equal method.
  #
  def test_ne
    @@log.debug "test_ne starts" if @@log.debug?
    assert_equal(@abs != @jas, true)
    @@log.debug "test_ne ends" if @@log.debug?
  end
  #
  # Test the less than or equals method.
  #
  def test_le
    @@log.debug "test_le starts" if @@log.debug?
    assert_respond_to(@abs, :<=, "test_le_respond")
    assert_equal(@abs <= @jas, true)
    assert_equal(@abs <= @abs, true)
    @@log.debug "test_le ends" if @@log.debug?
  end
  #
  # Test the greater than or equals method.
  #
  def test_ge
    @@log.debug "test_ge starts" if @@log.debug?
    assert_respond_to(@abs, :>=, "test_ge_respond")
    assert_equal(@jas >= @abs, true)
    assert_equal(@abs >= @abs, true)
    @@log.debug "test_ge ends" if @@log.debug?
  end
  #
  # Test the between method.
  #
  def test_betweenq
    @@log.debug "test_betweenq starts" if @@log.debug?
    assert_respond_to(@jas, :between?, "test_betweenq_respond")
    assert(@jas.between?(@abs,@jbs),"test_betweenq_basic")
    @@log.debug "test_betweenq ends" if @@log.debug?
  end
end
end # of Module Colldemo

