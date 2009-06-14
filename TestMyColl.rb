require 'mycollection'
require 'mydata'
require 'test/unit'
require 'logger'
#
class TestMyColl < Test::Unit::TestCase
  def initialize(name)
    super(name)
    @@log = Logger.new(STDOUT)
    @@log.level = Logger::DEBUG
  end
  def test_delete
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
    if @@log.debug?
      @@log.debug "test_delete ends"
    end
    
  end
end
