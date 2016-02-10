require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require_relative '../lib/junglebeat'

class JungleBeat_Test < Minitest::Test

  # initialize
  def test_it_can_initialize_list_with_single_value
    jb = JungleBeat.new("first")
    assert_equal "first", jb.head.value
  end

  def test_it_can_initialize_list_with_multiple_values
    jb = JungleBeat.new("first second")
    assert_equal "first", jb.head.value
    assert_equal "second", jb.head.next_node.value
  end

  # append
  def test_it_can_append_exisiting_list
    jb = JungleBeat.new("first")
    jb.append("second")
    assert_equal "second", jb.head.next_node.value
  end

  def test_it_can_append_multiples
    jb = JungleBeat.new("first second")
    jb.append("third")
    jb.step_through
    assert_equal "third", jb.head.next_node.next_node.value
  end

  # prepend
  def test_it_can_prepend_singles
    jb = JungleBeat.new("second")
    jb.prepend("first")
    assert_equal "first", jb.head.value
  end

  def test_it_can_prepend_multiples
    jb = JungleBeat.new("third")
    jb.prepend("first second")
    assert_equal "first", jb.head.value
    assert_equal "second", jb.head.next_node.value
  end

  #all
  def test_all
    jb = JungleBeat.new("first second third")
    assert_equal "first second third", jb.all
  end

  #play
  def test_play
    jb = JungleBeat.new("first second third")
    # assert_equal `say -r 500 -v Boing "first second third"`, jb.play
  end

  #count
  def test_count
    jb = JungleBeat.new("first second third")
    assert_equal 3, jb.count
  end
end
