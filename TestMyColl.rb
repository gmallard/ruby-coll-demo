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
  end
  #
  def test_methods
    @@log.debug "test_methods starts" if @@log.debug?
    mda = MyData.new("A")
    mdb = MyData.new("B",2)
    mdc = MyData.new("C",3)
    mdd = MyData.new("D",4)
    #
    list = MyCollection.new
    list.append(mda).append(mdb).append(mdc).append(mdd)
    #
    assert_equal(list.size, 4)
    #
    assert_equal(mda,list[0])
    assert_equal(mdb,list[1])
    assert_equal(mdc,list[2])
    assert_equal(mdd,list[3])
    #
    assert_nil(list[9])
    #
    assert_equal(mda, list.delete_first)
    assert_equal(mdb, list.delete_first)
    assert_equal(mdd, list.delete_last)
    assert_equal(mdc, list.delete_last)
    assert_nil(list.delete_last)
    @@log.debug "test_methods ends" if @@log.debug?
  end
  #
  def test_size
    @@log.debug "test_size starts" if @@log.debug?
    list = MyCollection::new
	assert_equal(list.size, 0)
    list.append(MyData.new("A"))
	assert_equal(list.size, 1)
    @@log.debug "test_size ends" if @@log.debug?
  end
  #
  def test_each
    @@log.debug "test_each starts" if @@log.debug?
    list = MyCollection::new
    list.append(MyData.new("A"))
	count = 0
	list.each do |elt|
      count += 1
      assert_equal(elt.ndata, 123)
    end
    assert_equal(count, 1)
    @@log.debug "test_each ends" if @@log.debug?
  end
end
