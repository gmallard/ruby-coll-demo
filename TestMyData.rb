require 'mydata'
require 'test/unit'
require 'logger'
#
class TestMyData < Test::Unit::TestCase
  #
  def initialize(name)
    super(name)
    @@log = Logger.new(STDOUT)
    @@log.level = Logger::DEBUG
		@mda = nil
		@mdb = nil
  end
	#
	def setup
		@mda = MyData.new("A",1)
		@mdb = MyData.new("B",2)
	end
	#
	def teardown
		#
	end
  #
  def test_lt
    @@log.debug "test_lt starts" if @@log.debug?
		assert_equal(@mda < @mdb, true)
    @@log.debug "test_lt ends" if @@log.debug?
  end
  #
  def test_gt
    @@log.debug "test_gt starts" if @@log.debug?
		assert_equal(@mdb > @mda, true)
    @@log.debug "test_gt ends" if @@log.debug?
  end
  #
  def test_eq
    @@log.debug "test_eq starts" if @@log.debug?
		assert_equal(@mda == @mdb, false)
    @@log.debug "test_eq ends" if @@log.debug?
  end
  #
  def test_ne
    @@log.debug "test_ne starts" if @@log.debug?
		assert_equal(@mda != @mdb, true)
    @@log.debug "test_ne ends" if @@log.debug?
  end
  #
  def test_le
    @@log.debug "test_le starts" if @@log.debug?
		assert_equal(@mda <= @mdb, true)
		assert_equal(@mda <= @mda, true)
    @@log.debug "test_le ends" if @@log.debug?
  end
  #
  def test_ge
    @@log.debug "test_ge starts" if @@log.debug?
		assert_equal(@mdb >= @mda, true)
		assert_equal(@mda >= @mda, true)
    @@log.debug "test_ge ends" if @@log.debug?
  end
end
