#
# == Purpose
#
# Unit tests for MyCollection objects.
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
require 'mycollection'
require 'mydata'

#
module Colldemo
class TestMyColl < Test::Unit::TestCase
  #
  # Initialize this test class.
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
  # Setup for each test.
  # * Define four MyData objects
  # * Define one MyCollection object
  # * Add all MyData objects to the MyCollection object
  #
  def setup
    @mda = MyData.new("AA12")
    @mdb = MyData.new("BB1",2)
    @mdc = MyData.new("CA1234",3)
    @mdd = MyData.new("DB123",4)
    @list = MyCollection::new
    # An implicit test of append :-)
    @list.append(@mda).append(@mdb).append(@mdc).append(@mdd)
  end
  #
  # Teardown after each test.  Currently does nothing.
  #
  def teardown
  end
  #
  # Test the +each+ method.
  #
  def test_010_each
    @@log.debug "test_010_each starts" if @@log.debug?
    count = 0
    @list.each do |elt|
      count += 1
    end
    assert_equal(4, count)
    @@log.debug "test_010_each ends" if @@log.debug?
  end
  #
  # Test the +size+ method.
  #
  def test_020_size
    @@log.debug "test_020_size starts" if @@log.debug?
    assert_equal(4, @list.size)
    @list.append(MyData.new("A"))
    assert_equal(5, @list.size)
    @@log.debug "test_020_size ends" if @@log.debug?
  end
  #
  # Test the +index+ method.
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
  # Test the +delete_first+ method.
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

  all? / 100 / *DONE
  any? / 110 / *DONE
  collect (map synonym) / 120, 130 / *DONE / See comments
  detect (find synonym) / 140, 150 / *DONE
  each_with_index / 160 / *DONE
  entries (to_a synonym) / 170, 180 / *DONE
  find_all (select synonym) / 190 / *DONE
  grep / 200 / *DONE / See comments
  include? (member? synonym) / 210 / *DONE
  inject / 220 / *DONE
  max / 230 / *DONE
  member? (include? synonym) / 240 / *DONE
  min / 250 / *DONE
  partition / 260 / *DONE
  reject / 270 / *DONE
  select (find_all synonym) / 275 / *DONE
  sort / 280 / *DONE
  sort_by / 290 / *DONE
  zip / 300 / *DONE

=end

  #--
  # all? / 100 / *DONE
  #++
  #
  # Test the <tt>all?</tt> method.
  #
  def test_100_allq
    @@log.debug "test_100_allq starts" if @@log.debug?
    assert_respond_to(@list, :all?, "test_100_allq_respond")

    assert(@list.all?,"test_100_allq_basic")
    result = @list.all? {|obj| true}
    assert(result, "test_100_allq_block_01")
    result = @list.all? {|obj| obj.ndata == 123 }
    assert(result == false, "test_100_allq_block_02")

    @@log.debug "test_100_allq ends" if @@log.debug?
  end

  #--
  # any? / 110 / *DONE
  #++
  #
  # Test the <tt>any?</tt> method.
  #
  def test_110_anyq
    @@log.debug "test_110_anyq starts" if @@log.debug?
    assert_respond_to(@list, :any?, "test_110_anyq_respond")

    assert(@list.any?, "test_110_anyq_basic")
    result = @list.any? {|obj| true}
    assert(result, "test_100_anyq_block_01")
    result = @list.any? {|obj| obj.ndata == 3 }
    assert(result, "test_100_anyq_block_02")

    @@log.debug "test_110_anyq ends" if @@log.debug?
  end

  #--
  # collect (map synonym) / 120 / *DONE / See comments
  #++
  #
  # Test the +collect+ method.
  #
  def test_120_collect
    @@log.debug "test_120_collect starts" if @@log.debug?
    assert_respond_to(@list, :collect, "test_120_collect_respond")

    #
    new_list = @list.collect { "dummy" }
    assert(new_list.size == @list.size,"test_120_collect_basic")
    assert(new_list[@list.size - 1] == "dummy","test_120_collect_sizecheck")
    # Something else needs to be done for testing.  What is practical?

    @@log.debug "test_120_collect ends" if @@log.debug?
  end

  #--
  #  map (collect synonym) / 130 / *DONE / See comments
  #++
  #
  # Test the +map+ method.
  #
  def test_130_map
    @@log.debug "test_130_map starts" if @@log.debug?
    assert_respond_to(@list, :map, "test_130_map_respond")

    #
    new_list = @list.map { "dummy" }
    assert(new_list.size == @list.size,"test_130_map_basic")
    assert(new_list[@list.size - 1] == "dummy","test_130_map_sizecheck")
    # Something else needs to be done for testing.  What is practical?

    @@log.debug "test_130_map ends" if @@log.debug?
  end

  #--
  # detect (find synonym) / 140 / *DONE
  #++
  #
  # Test the +detect+ method.
  #
  def test_140_detect
    @@log.debug "test_140_detect starts" if @@log.debug?
    assert_respond_to(@list, :detect, "test_140_detect_respond")

    mdx = @list.detect {|obj| obj.ndata == 3 }
    assert_equal(@mdc, mdx, "test_140_detect_feq_01")
    sorry = lambda { "not found" }
    mdx = @list.detect(sorry) {|obj| obj.ndata == 999 }      
    assert_equal("not found", mdx, "test_140_detect_feq_02")

    @@log.debug "test_140_detect ends" if @@log.debug?
  end

  #--
  # find (detect synonym) / 150 / *DONE
  #++
  #
  # Test the +find+ method.
  #
  def test_150_find
    @@log.debug "test_150_find starts" if @@log.debug?
    assert_respond_to(@list, :find, "test_150_find_respond")

    mdx = @list.find {|obj| obj.ndata == 3 }
    assert_equal(@mdc, mdx, "test_150_find_feq_01")
    sorry = lambda { "not found" }
    mdx = @list.find(sorry) {|obj| obj.ndata == 999 }      
    assert_equal("not found", mdx, "test_150_find_feq_02")

    @@log.debug "test_150_find ends" if @@log.debug?
  end

  #--
  # each_with_index / 160 / *DONE
  #++
  #
  # Test the +each_with_index+ method.
  #
  def test_160_each_with_index
    @@log.debug "test_160_each_with_index starts" if @@log.debug?
    assert_respond_to(@list, :each_with_index, "test_160_each_with_index_respond")

    ta = []
    @list.each_with_index do |obj, ndx|
      ta << "#{obj.ndata}-#{ndx}"
    end
    assert_equal(["123-0", "2-1", "3-2", "4-3"], ta, "test_160_each_with_index_basic")

    @@log.debug "test_160_each_with_index ends" if @@log.debug?
  end

  #--
  # entries (to_a synonym) / 170 / *DONE
  #++
  #
  # Test the +entries+ method.
  #
  def test_170_entries
    @@log.debug "test_170_entries starts" if @@log.debug?
    assert_respond_to(@list, :entries, "test_170_entries_respond")

    ta = @list.entries
    assert_equal([@mda, @mdb, @mdc, @mdd], ta, "test_170_entries_basic")

    @@log.debug "test_170_entries ends" if @@log.debug?
  end

  #--
  # to_a (entries synonym) / 180 / *DONE
  #++
  #
  # Test the +to_a+ method.
  #
  def test_180_to_a
    @@log.debug "test_180_to_a starts" if @@log.debug?
    assert_respond_to(@list, :to_a, "test_180_to_a_respond")

    ta = @list.to_a
    assert_equal([@mda, @mdb, @mdc, @mdd], ta, "test_180_to_a_basic")

    @@log.debug "test_180_to_a ends" if @@log.debug?
  end

  #--
  # find_all (select synonym) / 190 / *DONE
  #++
  #
  # Test the +find_all+ method.
  #
  def test_190_find_all
    @@log.debug "test_190_find_all starts" if @@log.debug?
    assert_respond_to(@list, :find_all, "test_190_find_all_respond")

    ta = @list.find_all {|obj| obj.ndata <= 3 }
    assert_equal([@mdb, @mdc], ta, "test_190_find_all_eq01")

    @@log.debug "test_190_find_all ends" if @@log.debug?
  end

  #--
  # grep / 200 / *DONE
  #++
  #
  # Test the +grep+ method.
  #
  def test_200_grep
    @@log.debug "test_200_grep starts" if @@log.debug?
    assert_respond_to(@list, :grep, "test_200_grep_respond")

    # very contrived
    @list.append("aaa")
    @list.append(456)
    ta = @list.grep(MyData)
    assert_equal([@mda, @mdb, @mdc, @mdd], ta, "test_200_grep_class")

    @@log.debug "test_200_grep ends" if @@log.debug?
  end

  #--
  # include? / 210 / *DONE
  #++
  #
  # Test the <tt>include?</tt> method.
  #
  def test_210_includeq
    @@log.debug "test_210_includeq starts" if @@log.debug?
    assert_respond_to(@list, :include?, "test_210_includeq_respond")

    assert(@list.include?(@mdb),"test_210_includeq_basic")
    ta = MyData.new("XYZ", 456)
    assert(@list.include?(ta) == false,"test_210_includeq_backwards")

    @@log.debug "test_210_includeq ends" if @@log.debug?
  end

  #--
  # inject / 220 / *DONE
  #++
  #
  # Test the +inject+ method.
  #
  def test_220_inject
    @@log.debug "test_220_inject starts" if @@log.debug?
    assert_respond_to(@list, :inject, "test_220_inject_respond")

    sumnd = @list.inject(0) {|memo, obj| memo + obj.ndata }
    assert_equal(132, sumnd, "test_220_inject_sumnd")

    catsd = @list.inject("") {|memo, obj| "#{memo}#{obj.sdata}" }
    assert_equal("AA12BB1CA1234DB123", catsd, "test_220_inject_catsd")

    @@log.debug "test_220_inject ends" if @@log.debug?
  end

  #--
  # max / 230 / *DONE
  #++
  #
  # Test the +max+ method.
  #
  def test_230_max
    @@log.debug "test_230_max starts" if @@log.debug?
    assert_respond_to(@list, :max, "test_230_max_respond")

    assert_equal(123, @list.max.ndata, "test_230_max_basic")

    @@log.debug "test_230_max ends" if @@log.debug?
  end

  #--
  # member? / 240 / *DONE
  #++
  #
  # Test the <tt>member?</tt> method.
  #
  def test_240_memberq
    @@log.debug "test_240_memberq starts" if @@log.debug?
    assert_respond_to(@list, :member?, "test_240_memberq_respond")

    assert(@list.member?(@mdb),"test_240_memberq_basic")
    ta = MyData.new("XYZ", 456)
    assert(@list.member?(ta) == false,"test_240_memberq_backwards")

    @@log.debug "test_240_memberq ends" if @@log.debug?
  end

  #--
  # min / 250 / *DONE
  #++
  #
  # Test the +min+ method.
  #
  def test_250_min
    @@log.debug "test_250_min starts" if @@log.debug?
    assert_respond_to(@list, :min, "test_250_min_respond")

    assert_equal(2, @list.min.ndata, "test_250_min_basic")

    @@log.debug "test_250_min ends" if @@log.debug?
  end

  #--
  # partition / 260 / *DONE
  #++
  #
  # Test the +partition+ method.
  #
  def test_260_partition
    @@log.debug "test_260_partition starts" if @@log.debug?
    assert_respond_to(@list, :partition, "test_260_partition_respond")

    ta = @list.partition {|obj| obj.ndata <= 3 }
    assert_equal(2, ta.size,"test_260_partition_basic_01")
    assert_equal([@mdb, @mdc], ta[0], "test_260_partition_basic_02")
    assert_equal([@mda, @mdd], ta[1], "test_260_partition_basic_03")

    @@log.debug "test_260_partition ends" if @@log.debug?
  end

  #--
  # reject / 270 / *DONE
  #++
  #
  # Test the +reject+ method.
  #
  def test_270_reject
    @@log.debug "test_270_reject starts" if @@log.debug?
    assert_respond_to(@list, :reject, "test_270_reject_respond")

    ta = @list.reject {|obj| obj.ndata <= 3 }
    assert_equal([@mda, @mdd], ta, "test_270_reject_eq01")

    @@log.debug "test_270_reject ends" if @@log.debug?
  end

  #--
  # select (find_all synonym) / 275 / *DONE
  #++
  #
  # Test the +select+ method.
  #
  def test_275_select
    @@log.debug "test_275_select starts" if @@log.debug?
    assert_respond_to(@list, :select, "test_275_select_respond")

    ta = @list.select {|obj| obj.ndata <= 3 }
    assert_equal([@mdb, @mdc], ta, "test_275_select_eq01")

    @@log.debug "test_275_select ends" if @@log.debug?
  end

  #--
  # sort / 280 / *DONE
  #++
  #
  # Test the +sort+ method.
  #
  def test_280_sort
    @@log.debug "test_280_sort starts" if @@log.debug?
    assert_respond_to(@list, :sort, "test_280_sort_respond")

    ta = @list.sort
    assert_equal([@mdb, @mdc, @mdd, @mda], ta, "test_280_sort_basic")

    @@log.debug "test_280_sort ends" if @@log.debug?
  end

  #--
  # sort_by / 290 / *DONE
  #++
  #
  # Test the +sort_by+ method.
  #
  def test_290_sort_by
    @@log.debug "test_290_sort_by starts" if @@log.debug?
    assert_respond_to(@list, :sort_by, "test_290_sort_by_respond")

    ta = @list.sort_by {|obj| obj.sdata.length }
    assert_equal([@mdb, @mda, @mdd, @mdc], ta, "test_290_sort_by_basic")

    @@log.debug "test_290_sort_by ends" if @@log.debug?
  end

  #--
  # zip / 300 / *DONE
  #++
  #
  # Test the +zip+ method.
  #
  def test_300_zip
    @@log.debug "test_300_zip starts" if @@log.debug?
    assert_respond_to(@list, :zip, "test_300_zip_respond")

    a = [1]
    b = [2,3]
    c = [4,5,6]
    ta = @list.zip(a, b, c)
    #
    te = [[@mda, 1, 2, 4], 
          [@mdb, nil, 3, 5], 
          [@mdc, nil, nil, 6], 
          [@mdd, nil, nil, nil]]
    #
    assert_equal(te, ta, "test_300_zip_basic")

    @@log.debug "test_300_zip ends" if @@log.debug?
  end
  #
if RUBY_VERSION =~ /(1.9)|(2.)/
=begin

  Test methods provided by Enumerable mixin for ruby 1.9+

  To be tested:

//  count / 600 / * DONE
//  cycle / 610 / * DONE
//  drop / 620 / * DONE
//  drop_while / 630 / * DONE
//  each_cons / 640 / * DONE
//  each_slice / 650 / * DONE
//  each_with_index / 655 / * DONE
//  each_with_object / 660 / * DONE
//  find_index / 670 / * DONE
//  first / 680 / * DONE
//  group_by / 690 / * DONE
//  inject / 700 / * MOD1.9, DONE
//  max_by / 710 / * NEW, DONE
//  min_by / 720 / * NEW, DONE
//  minmax / 730 / * NEW, DONE
//  minmax_by / 740 / * NEW, DONE
//  none? / 750 / * NEW, DONE
//  one? / 760 / * NEW, DONE
//  reduce (inject synonym)  / 770 / * NEW, DONE
//  reverse_each / 780 / * NEW, TBD
//  take / 790 / * NEW, TBD
//  take_while / 800 / * NEW, TBD
//  to_a / 810 / * NEW, TBD

=end

  #--
  # count / 600 / * DONE
  #++
  #
  # Test the <tt>count</tt> method.
  #
  def test_600_count
    @@log.debug "test_600_count starts" if @@log.debug?
    assert_respond_to(@list, :count, "test_600_count_respond")
    assert(@list.count == 4, "test_600_count_count")
    assert(@list.count(@mdb) == 1, "test_600_count_oneobj_1")
    assert(@list.count(42) == 0, "test_600_count_oneobj_2")
    result = @list.count {|obj| obj.ndata > 2}
    assert(result == 3, "test_600_count_trueres")
    @@log.debug "test_600_count ends" if @@log.debug?
  end

  #--
  # cycle / 610 / * DONE
  #++
  #
  # Test the <tt>cycle</tt> method.
  #
  def test_610_cycle
    @@log.debug "test_610_cycle starts" if @@log.debug?
    assert_respond_to(@list, :cycle, "test_610_cycle_respond")
    #
    enum = @list.cycle
    result = enum.is_a? Enumerator
    assert(result,"test_610_cycle_class") 
    #
    assert_equal([@mda, @mdb, @mdc, @mdd], @list.cycle(1).to_a, "test_610_cycle_once")
    # 
    assert_equal([@mda, @mdb, @mdc, @mdd, @mda, @mdb, @mdc, @mdd], 
      @list.cycle(2).to_a, "test_610_cycle_twice") 
    @@log.debug "test_610_cycle ends" if @@log.debug?
  end

  #--
  # drop / 620 / * DONE
  #++
  #
  # Test the <tt>drop</tt> method.
  #
  def test_620_drop
    @@log.debug "test_620_drop starts" if @@log.debug?
    assert_respond_to(@list, :drop, "test_620_drop_respond")
    #
    assert_equal([@mdb, @mdc, @mdd], @list.drop(1), "test_620_drop_one")
    assert_equal([@mdc, @mdd], @list.drop(2), "test_620_drop_two")
    @@log.debug "test_620_drop ends" if @@log.debug?
  end

  #--
  # drop_while / 630 / * DONE
  #++
  #
  # Test the <tt>drop_while</tt> method.
  #
  def test_630_drop_while
    @@log.debug "test_630_drop_while starts" if @@log.debug?
    assert_respond_to(@list, :drop_while, "test_630_drop_while_respond")
    #
    result = @list.drop_while {|item| item.ndata != 2}
    assert_equal([@mdb, @mdc, @mdd], result, "test_630_drop_while_ne2")
    #
    result = @list.drop_while {|item| item.ndata != 3}
    assert_equal([@mdc, @mdd], result, "test_630_drop_while_ne3")
    @@log.debug "test_630_drop_while ends" if @@log.debug?
  end

  #--
  # each_cons / 640 / * DONE
  #++
  #
  # Test the <tt>each_cons</tt> method.
  #
  def test_640_each_cons
    @@log.debug "test_640_each_cons starts" if @@log.debug?
    assert_respond_to(@list, :each_cons, "test_640_each_cons_respond")
    #
    enum = @list.each_cons(2)
    result = enum.is_a? Enumerator
    assert(result,"test_640_each_cons_class") 
    #
    pass = 0
    @list.each_cons(2) {|suba|
      pass += 1
      case pass
        when 1
          assert_equal([@mda, @mdb], suba, "test_640_each_cons_p1")
        when 2
          assert_equal([@mdb, @mdc], suba, "test_640_each_cons_p2")
        when 3
          assert_equal([@mdc, @mdd], suba, "test_640_each_cons_p3")
        else
          fail("test_640_each_cons_invalid")
      end
    }
    @@log.debug "test_640_each_cons ends" if @@log.debug?
  end

  #--
  # each_slice / 650 / * DONE
  #++
  #
  # Test the <tt>each_slice</tt> method.
  #
  def test_650_each_slice
    @@log.debug "test_650_each_slice starts" if @@log.debug?
    assert_respond_to(@list, :each_slice, "test_650_each_slice_respond")
    #
    enum = @list.each_slice(2)
    result = enum.is_a? Enumerator
    assert(result,"test_650_each_slice_class") 
    #
    pass = 0
    @list.each_slice(2) {|suba|
      pass += 1
      case pass
        when 1
          assert_equal([@mda, @mdb], suba, "test_650_each_slice_p1")
        when 2
          assert_equal([@mdc, @mdd], suba, "test_650_each_slice_p2")
        else
          fail("test_650_each_slice_invalid")
      end
    }
    #
    pass = 0
    @list.each_slice(3) {|suba|
      pass += 1
      case pass
        when 1
          assert_equal([@mda, @mdb, @mdc], suba, "test_650_each_slice_p1b")
        when 2
          assert_equal([@mdd], suba, "test_650_each_slice_p2b")
        else
          fail("test_650_each_slice_invalid_b")
      end
    }
    @@log.debug "test_650_each_slice ends" if @@log.debug?
  end

  #--
  # each_with_index / 655 / * DONE
  #++
  #
  # Test the <tt>each_with_index</tt> method.
  #
  def test_655_each_with_index
    @@log.debug "test_655_each_with_index starts" if @@log.debug?
    assert_respond_to(@list, :each_with_index, "test_655_each_with_index_respond")
    #
    enum = @list.each_with_index
    result = enum.is_a? Enumerator
    assert(result,"test_655_each_with_index_class") 
    #
    @list.each_with_index {|item, index|
      case
        when item == @mda
          assert(index == 0, "test_655_each_with_index_i0")
        when item == @mdb
          assert(index == 1, "test_655_each_with_index_i1")
        when item == @mdc
          assert(index == 2, "test_655_each_with_index_i2")
        when item == @mdd
          assert(index == 3, "test_655_each_with_index_i3")
        else
          flunk("test_655_each_with_index_invalid")
      end
    }
    #
    @@log.debug "test_655_each_with_index ends" if @@log.debug?
  end

  #--
  # each_with_object / 660 / * DONE
  #++
  #
  # Test the <tt>each_with_object</tt> method.
  #
  def test_660_each_with_object
    @@log.debug "test_660_each_with_object starts" if @@log.debug?
    assert_respond_to(@list, :each_with_object, "test_660_each_with_object_respond")
    #
    enum = @list.each_with_object({})
    result = enum.is_a? Enumerator
    assert(result,"test_660_each_with_object_class") 
    #
    hash = @list.each_with_object({}) do |item, memo|
      memo[item.sdata] = item.ndata
    end
    assert_equal(hash,
      {"AA12"=>123, "BB1"=>2, "CA1234"=>3, "DB123"=>4},
      "test_660_each_with_object_hash")
    #
    @@log.debug "test_660_each_with_object ends" if @@log.debug?
  end

  #--
  # find_index / 670 / * DONE
  #++
  #
  # Test the <tt>find_index</tt> method.
  #
  def test_670_find_index
    @@log.debug "test_670_find_index starts" if @@log.debug?
    assert_respond_to(@list, :find_index, "test_670_find_index_respond")
    #
    enum = @list.find_index
    result = enum.is_a? Enumerator
    assert(result,"test_670_find_index_class") 
    #
    enum = @list.find_index {|item| false }
    assert_nil(enum, "test_670_find_index_allfalse")
    #
    enum = @list.find_index {|item| item.ndata == 3 }
    assert(enum == 2, "test_670_find_index_ndata3")
    #
    @@log.debug "test_670_find_index ends" if @@log.debug?
  end

  #--
  # first / 680 / * DONE
  #++
  #
  # Test the <tt>first</tt> method.
  #
  def test_680_first
    @@log.debug "test_680_first starts" if @@log.debug?
    assert_respond_to(@list, :first, "test_680_first_respond")
    #
    result = @list.first
    assert_equal(result, @mda, "test_680_first_one")
    #
    result = @list.first(2)
    assert_equal(result, [@mda,@mdb], "test_680_first_two")
    @@log.debug "test_680_first ends" if @@log.debug?
  end

  #--
  # group_by / 690 / * DONE
  #++
  #
  # Test the <tt>group_by</tt> method.
  #
  def test_690_group_by
    @@log.debug "test_690_group_by starts" if @@log.debug?
    assert_respond_to(@list, :group_by, "test_690_group_by_respond")
    #
    enum = @list.group_by
    result = enum.is_a? Enumerator
    assert(result,"test_690_group_by_class") 
    #
    hash = @list.group_by {|item| item.ndata <= 2 ? "le2" : "gt2"}
    assert_equal(hash,
      {"gt2" => [@mda, @mdc, @mdd], "le2" => [@mdb]},
      "test_690_group_by_hash")
    @@log.debug "test_690_group_by ends" if @@log.debug?
  end

  #--
  # inject / 700 / * MOD1.9, DONE
  #++
  #
  # Test the <tt>inject</tt> method.
  #
  def test_700_inject
    @@log.debug "test_700_inject starts" if @@log.debug?
    assert_respond_to(@list, :inject, "test_700_inject_respond")
    #
    test_220_inject
    #
    biggest_nd = @list.inject(@mda) {|memo, item|
      memo.ndata > item.ndata ? memo : item
    }
    assert_equal(biggest_nd, @mda, "test_700_inject_biggest")
    # What else?
    @@log.debug "test_700_inject ends" if @@log.debug?
  end

  #--
  # max_by / 710 / * NEW, DONE
  #++
  #
  # Test the <tt>max_by</tt> method.
  #
  def test_710_max_by
    @@log.debug "test_710_max_by starts" if @@log.debug?
    assert_respond_to(@list, :max_by, "test_710_max_by_respond")
    #
    enum = @list.max_by
    result = enum.is_a? Enumerator
    assert(result,"test_710_max_by_class") 
    #
    result = @list.max_by {|item| item == @mdc ? 9999 : 0 }
    assert_equal(result, @mdc, "test_710_max_by_mdc")
    @@log.debug "test_710_max_by ends" if @@log.debug?
  end

  #--
  # min_by / 720 / * NEW, DONE
  #++
  #
  # Test the <tt>min_by</tt> method.
  #
  def test_720_min_by
    @@log.debug "test_720_min_by starts" if @@log.debug?
    assert_respond_to(@list, :min_by, "test_720_min_by_respond")
    #
    enum = @list.min_by
    result = enum.is_a? Enumerator
    assert(result,"test_720_min_by_class") 
    #
    result = @list.min_by {|item| item == @mda ? 0 : 9999 }
    assert_equal(result, @mda, "test_720_min_by_mda")
    #
    @@log.debug "test_720_min_by ends" if @@log.debug?
  end

  #--
  # minmax / 730 / * NEW, DONE
  #++
  #
  # Test the <tt>minmax</tt> method.
  #
  def test_730_minmax
    @@log.debug "test_730_minmax starts" if @@log.debug?
    assert_respond_to(@list, :minmax, "test_730_minmax_respond")
    #
    result = @list.minmax
    assert_equal(result, [@mdb, @mda], "test_730_minmax_natural")
    @@log.debug "test_730_minmax ends" if @@log.debug?
  end

  #--
  # minmax_by / 740 / * NEW, DONE
  #++
  #
  # Test the <tt>minmax_by</tt> method.
  #
  def test_740_minmax_by
    @@log.debug "test_740_minmax_by starts" if @@log.debug?
    assert_respond_to(@list, :minmax_by, "test_740_minmax_by_respond")
    #
    enum = @list.minmax_by
    result = enum.is_a? Enumerator
    assert(result,"test_740_minmax_by_class") 
    #
    result = @list.minmax_by {|item|
      case
        when item == @mdd
          9999
        when item == @mdc
          0
        else
          1
      end
    }
    assert_equal(result, [@mdc, @mdd], "740_minmax_by_res01")
    #
    @@log.debug "test_740_minmax_by ends" if @@log.debug?
  end

  #--
  # none? / 750 / * NEW, DONE
  #++
  #
  # Test the <tt>none?</tt> method.
  #
  def test_750_none?
    @@log.debug "test_750_none? starts" if @@log.debug?
    assert_respond_to(@list, :none?, "test_750_none?_respond")
    #
    result = @list.none? {|obj| false }
    assert(result, "test_750_none?_false")
    #
    result = @list.none? {|obj| true }
    assert(result == false, "test_750_none?_truea")
    #
    result = @list.none? {|obj| obj.ndata == 2 ? true : false }
    assert(result == false, "test_750_none?_true1")
    @@log.debug "test_750_none? ends" if @@log.debug?
  end

  #--
  # one? / 760 / * NEW, DONE
  #++
  #
  # Test the <tt>one?</tt> method.
  #
  def test_760_one?
    @@log.debug "test_760_one? starts" if @@log.debug?
    assert_respond_to(@list, :one?, "test_760_one?_respond")
    #
    result = @list.one? {|obj|
      case
        when obj == @mda
          true
        else
          false
      end
    }
    assert(result, "test_760_one?_true")
    #
    result = @list.one? {|obj|
      case
        when obj == @mda
          true
        when obj == @mdd
          true
        else
          false
      end
    }
    assert(result == false, "test_760_one?_false")
    #
    @@log.debug "test_760_one? ends" if @@log.debug?
  end

  #--
  # reduce / 770 / * NEW, DONE
  #++
  #
  # Test the <tt>reduce</tt> method.
  #
  def test_770_reduce
    @@log.debug "test_770_reduce starts" if @@log.debug?
    assert_respond_to(@list, :reduce, "test_770_reduce_respond")
    #
    test_700_inject
    # What else?
    @@log.debug "test_770_reduce ends" if @@log.debug?
  end

  #--
  # reverse_each / 780 / * NEW, TBD
  #++
  #
  # Test the <tt>reverse_each</tt> method.
  #
  def test_780_reverse_each
    @@log.debug "test_780_reverse_each starts" if @@log.debug?
    assert_respond_to(@list, :reverse_each, "test_780_reverse_each_respond")
    #
    enum = @list.reverse_each
    result = enum.is_a? Enumerator
    assert(result,"test_780_reverse_each_class") 
    #
    flunk("FIXME test_780_reverse_each")
    @@log.debug "test_780_reverse_each ends" if @@log.debug?
  end

  #--
  # take / 790 / * NEW, TBD
  #++
  #
  # Test the <tt>take</tt> method.
  #
  def test_790_take
    @@log.debug "test_790_take starts" if @@log.debug?
    assert_respond_to(@list, :take, "test_790_take_respond")
    flunk("FIXME test_790_take")
    @@log.debug "test_790_take ends" if @@log.debug?
  end

  #--
  # take_while / 800 / * NEW, TBD
  #++
  #
  # Test the <tt>take_while</tt> method.
  #
  def test_800_take_while
    @@log.debug "test_800_take_while starts" if @@log.debug?
    assert_respond_to(@list, :take_while, "test_800_take_while_respond")
    #
    enum = @list.take_while
    result = enum.is_a? Enumerator
    assert(result,"test_800_take_while_class") 
    #
    flunk("FIXME test_800_take_while")
    @@log.debug "test_800_take_while ends" if @@log.debug?
  end

  #--
  # to_a / 810 / * NEW, TBD
  #++
  #
  # Test the <tt>to_a</tt> method.
  #
  def test_810_to_a
    @@log.debug "test_810_to_a starts" if @@log.debug?
    assert_respond_to(@list, :to_a, "test_810_to_a_respond")
    flunk("FIXME test_810_to_a")
    @@log.debug "test_810_to_a ends" if @@log.debug?
  end

end # of ruby 1.9+ code

end # of class TestMyColl
end # of module Colldemo

