# Ruby stuff
require 'test/unit'
require 'logger'
# To be tested or used
$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'mycollection'
require 'mydata'

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
=begin

	Test methods provided by Enumerable mixin.

	To be tested:

		all? / 100
		any? / 110
		collect (map synonym) / 120, 130
		detect (find synonym) / 140, 150
		each_with_index / 160
		entries (to_a synonym) / 170, 180
		find_all / 190
		grep / 200
		include? / 210
		inject / 220
		max / 230
		member? / 240
		min / 250
		partition / 260
		reject / 270
		sort / 280
		sort_by / 290
		zip / 300

=end

		# all? / 100
		def test_100_allq
	    @@log.debug "test_100_allq starts" if @@log.debug?
			flunk
	    @@log.debug "test_100_allq ends" if @@log.debug?
		end

		# any? / 110
		def test_110_anyq
	    @@log.debug "test_110_anyq starts" if @@log.debug?
			flunk
	    @@log.debug "test_110_anyq ends" if @@log.debug?
		end

		# collect (map synonym) / 120, 130
		def test_120_collect
	    @@log.debug "test_120_collect starts" if @@log.debug?
			flunk
	    @@log.debug "test_120_collect ends" if @@log.debug?
		end

		def test_130_map
	    @@log.debug "test_130_map starts" if @@log.debug?
			flunk
	    @@log.debug "test_130_map ends" if @@log.debug?
		end

		# detect (find synonym) / 140, 150
		def test_140_detect
	    @@log.debug "test_140_detect starts" if @@log.debug?
			flunk
	    @@log.debug "test_140_detect ends" if @@log.debug?
		end

		def test_150_find
	    @@log.debug "test_150_find starts" if @@log.debug?
			flunk
	    @@log.debug "test_150_find ends" if @@log.debug?
		end

		# each_with_index / 160
		def test_160_each_with_index
	    @@log.debug "test_160_each_with_index starts" if @@log.debug?
			flunk
	    @@log.debug "test_160_each_with_index ends" if @@log.debug?
		end

		# entries (to_a synonym) / 170, 180
		def test_170_entries
	    @@log.debug "test_170_entries starts" if @@log.debug?
			flunk
	    @@log.debug "test_170_entries ends" if @@log.debug?
		end

		def test_180_to_a
	    @@log.debug "test_180_to_a starts" if @@log.debug?
			flunk
	    @@log.debug "test_180_to_a ends" if @@log.debug?
		end

		# find_all / 190
		def test_190_find_all
	    @@log.debug "test_190_find_all starts" if @@log.debug?
			flunk
	    @@log.debug "test_190_find_all ends" if @@log.debug?
		end

		# grep / 200
		def test_200_grep
	    @@log.debug "test_200_grep starts" if @@log.debug?
			flunk
	    @@log.debug "test_200_grep ends" if @@log.debug?
		end

		# include? / 210
		def test_210_includeq
	    @@log.debug "test_210_includeq starts" if @@log.debug?
			flunk
	    @@log.debug "test_210_includeq ends" if @@log.debug?
		end

		# inject / 220
		def test_220_inject
	    @@log.debug "test_220_inject starts" if @@log.debug?
			flunk
	    @@log.debug "test_220_inject ends" if @@log.debug?
		end

		# max / 230
		def test_230_max
	    @@log.debug "test_230_max starts" if @@log.debug?
			flunk
	    @@log.debug "test_230_max ends" if @@log.debug?
		end

		# member? / 240
		def test_240_memberq
	    @@log.debug "test_240_memberq starts" if @@log.debug?
			flunk
	    @@log.debug "test_240_memberq ends" if @@log.debug?
		end

		# min / 250
		def test_250_min
	    @@log.debug "test_250_min starts" if @@log.debug?
			flunk
	    @@log.debug "test_250_min ends" if @@log.debug?
		end

		# partition / 260
		def test_260_partition
	    @@log.debug "test_260_partition starts" if @@log.debug?
			flunk
	    @@log.debug "test_260_partition ends" if @@log.debug?
		end

		# reject / 270
		def test_270_reject
	    @@log.debug "test_270_reject starts" if @@log.debug?
			flunk
	    @@log.debug "test_270_reject ends" if @@log.debug?
		end

		# sort / 280
		def test_280_sort
	    @@log.debug "test_280_sort starts" if @@log.debug?
			flunk
	    @@log.debug "test_280_sort ends" if @@log.debug?
		end

		# sort_by / 290
		def test_290_sort_by
	    @@log.debug "test_290_sort_by starts" if @@log.debug?
			flunk
	    @@log.debug "test_290_sort_by ends" if @@log.debug?
		end

		# zip / 300
		def test_300_zip
	    @@log.debug "test_300_zip starts" if @@log.debug?
			flunk
	    @@log.debug "test_300_zip ends" if @@log.debug?
		end

end
