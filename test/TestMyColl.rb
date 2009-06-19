require 'mycollection'
require 'mydata'
require 'test/unit'
require 'logger'
#
class TestMyColl < Test::Unit::TestCase
  #
  def initialize(name)
    super(name)
    @@log = Logger.new(STDOUT)
    @@log.level = Logger::DEBUG
		@mda = nil
		@mdb = nil
		@mdc = nil
		@mdd = nil
		@list = nil
  end
	#
	def setup
    @mda = MyData.new("A")
    @mdb = MyData.new("B",2)
    @mdc = MyData.new("C",3)
    @mdd = MyData.new("D",4)
    @list = MyCollection::new
		# An implicit test of append :-)
    @list.append(@mda).append(@mdb).append(@mdc).append(@mdd)
	end
	#
	def teardown
	end
  #
	# Test each method
	#
  def test_010_each
    @@log.debug "test_010_each starts" if @@log.debug?
		count = 0
		@list.each do |elt|
      count += 1
    end
    assert_equal(count, 4)
    @@log.debug "test_010_each ends" if @@log.debug?
  end
  #
	# Test basic custom collection methods
	#
  def test_020_size
    @@log.debug "test_020_size starts" if @@log.debug?
		assert_equal(@list.size, 4)
    @list.append(MyData.new("A"))
		assert_equal(@list.size, 5)
    @@log.debug "test_020_size ends" if @@log.debug?
  end
  #
  def test_030_index_method
    @@log.debug "test_030_index_method starts" if @@log.debug?
    # Appends done in setup
    assert_equal(@mda,@list[0])
    assert_equal(@mdb,@list[1])
    assert_equal(@mdc,@list[2])
    assert_equal(@mdd,@list[3])
    #
    assert_nil(@list[9])
    @@log.debug "test_030_index_method ends" if @@log.debug?
  end
  #
  def test_040_del_methods
    @@log.debug "test_040_del_methods starts" if @@log.debug?
    assert_equal(@mda, @list.delete_first)
    assert_equal(@mdb, @list.delete_first)
    assert_equal(@mdd, @list.delete_last)
    assert_equal(@mdc, @list.delete_last)
    assert_nil(@list.delete_last)
    @@log.debug "test_040_del_methods ends" if @@log.debug?
  end
  #
	# Test methods provided by Enumerable mixin
	#

end
