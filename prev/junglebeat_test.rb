require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'junglebeat'
require 'pry'

class JungleBeatTest < Minitest::Test

  #initialize
  def test_it_can_initialize_singles
    jb = JungleBeat.new("first")
    assert_equal "first", jb.head.data
  end

  def test_it_can_initialize_multiples
    jb = JungleBeat.new("first second")
    assert_equal "first", jb.head.data
    assert_equal "second", jb.head.link.data
  end

  #append
  def test_it_can_append_singles
    jb = JungleBeat.new("first")
    jb.append("second")
    assert_equal "second", jb.head.link.data
  end

  def test_it_can_append_multiples
    jb = JungleBeat.new("first")
    jb.append("second third")
    assert_equal "second", jb.head.link.data
    assert_equal "third", jb.head.link.link.data
  end

  #prepend
  def test_it_can_prepend_singles
    jb = JungleBeat.new("second")
    jb.prepend("first")
    assert_equal "first", jb.head.data
  end

  def test_it_can_prepend_multiples
    jb = JungleBeat.new("second")
    jb.prepend("zeroth first")
    assert_equal "zeroth", jb.head.data
    assert_equal "first", jb.head.link.data
  end

  #all
  def test_all
    jb = JungleBeat.new("first second")
    assert_equal "first second", jb.all
  end

  #count
  def test_it_can_count
    jb = JungleBeat.new("first second third")
    assert_equal 3, jb.count
  end

  #include?
  def test_include_can_find_things
    jb = JungleBeat.new("first second third")
    assert jb.include?("first")
  end

  def test_include_wont_find_things_that_arent_there
    jb = JungleBeat.new("first second third")
    refute jb.include?("fourth")
  end

  #pop
end
